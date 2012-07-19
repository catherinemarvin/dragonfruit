
//game page javascript
$(document).ready(function () {
	var checkGameState = function () {
		console.log("Checking game state!")
		console.log($.cookie("name"))
		console.log($.cookie("gameId"))
		$.get("/games/"+$.cookie("gameId")+".json", function (data) {
			console.log(data)
			if (data.started === true) { //game has started
				console.log("the game is afoot");
				displayStart();
			} else { //game has not started
				console.log("we must wait")
				setTimeout(checkGameState,5000);
			}
		});
	}

	var pos = 0, ctx = null, saveCB, image = [];

	canvas = document.getElementById("canvas")

	if (canvas.getContext) {
		ctx = document.getElementById("canvas").getContext("2d");
		ctx.clearRect(0,0,320,240);
		var img = new Image();
		img.src = "";
		img.onload = function () {
			ctx.drawImage(img, 129, 89);
		}
		image = ctx.getImageData(0,0,320,240);
	}
	$(canvas).hide();


	$("#camera").webcam({
		width: 320,
		height: 240,
		mode: "callback",
		swffile: "/jscam_canvas_only.swf",
		onTick: function (remain) {
			if (0 == remain) {
				$("#status").text("Cheese!");
			} else {
				$("#status").text(remain + " seconds remaining...");
			}
		},
		onSave: function (data) {
			var col = data.split(";");
			var img = image;

			for (var i = 0; i < 320; i++) {
				var tmp = parseInt(col[i]);
				img.data[pos + 0] = (tmp >> 16) & 0xff;
				img.data[pos + 1] = (tmp >> 8) & 0xff;
				img.data[pos + 2] = tmp & 0xff;
				img.data[pos + 3] = 0xff;
				pos+=4;
			}

			if (pos >= 4 * 320 * 240) {
				ctx.putImageData(img, 0, 0);
				pos = 0;

				$("#webcam-object").remove();
				var canvas = $("#canvas").show();
				//$("#status").remove();
				var dataURL = canvas[0].toDataURL('image/png');
				var encodedImage = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
				upload(encodedImage)
				$("#camera").remove()
			}
		},
		onCapture: function () {
			webcam.save()
		},
		debug: function (type, string) {
			$("#status").html(type + ": " + string);
		},
		onLoad: function () {}
	});

	checkGameState();

	var upload = function (imagestream) {
		$.post("http://api.imgur.com/2/upload.json", {
			key: "50a3a2c69c7102e780797f9ceaafa180",
			image: imagestream
		}, function (data) {
			var url = data.upload.links.original;
			saveImage(url);
		});
	}

	var saveImage = function (url) {
		console.log("Submitting an image");
		console.log("URL submitted: ",url)
		$.post("/games/"+$.cookie("gameId")+"/submit", {url: url, name: $.cookie("name")}, function (data) {
			console.log(data)
			$("#status").text("Nice picture!");
			//after save, wait 5 seconds, then load the images
			setTimeout(displayImages,5000)
		});
	}

	var displayStart = function () {
		console.log("displaying the beginning")
		$("#startGame").css("display","none");
		displaySourceImage();
		//assume game doesn't start until webcam is loaded
		webcam.capture(3);
	}

	var displaySourceImage = function () {
		console.log("finding source");
		$.get("/games/"+$.cookie("gameId")+"/source", function (data) {
			console.log(data);
			$("#sourceImg").append("<img src='"+data.url+"'>");
		});
	}

	var displayImages = function () {
		console.log("Time to load images")
		$.get("/games/"+$.cookie("gameId")+"/getImages", function (data) {
			console.log(data);
			for (i in data) {
				var url = data[i]["url"];
				var author = data[i]["submittedBy"];
				$("#images").append("<img class='userImg' id='userImg-"+author+"' src='"+url+"'/>")
			}
			$(".userImg").click(function () {
				console.log('gonna cast a vote');
				var myId = this.id;
				var votee = myId.substring(8);
				console.log('vote for: ', votee);
				castVote(votee);
				$("#images").remove();
				$("#status").text("Thanks for your vote! Wait a bit for the final results...")
				
			});
			setTimeout(displayWinner,10000);
		});
	}

	var displayWinner = function () {
		console.log("displaying the winner");
		$.get("/games/"+$.cookie("gameId")+"/winner", function (data) {
			console.log(data);
			$("#winner").append("<img class='userImg' src='"+data.url+"'>");
		});
	}

	var castVote = function (votee) {
		console.log("Voting for: ",votee);
		$.post("/games/"+$.cookie("gameId")+"/vote", { userId : votee }, function (data) {
			console.log(data);
		});

	}


});
