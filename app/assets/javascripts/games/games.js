
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

	checkGameState();

	//eventually this will load up the webcam and stuff
	//for now it displays a box and you submit a picture

	var displayStart = function () {
		console.log("displaying the beginning")
		$("#startGame").css("display","none");
		displaySourceImage();
		//displayImages();
	}

	var displaySourceImage = function () {
		console.log("finding source");
		$.get("/games/"+$.cookie("gameId")+"/source", function (data) {
			console.log(data);
			$("#sourceImg").append("<img src='"+data.url+"'>");
		});
	}

	$("#submitImage").click(function () {
		console.log("Submitting an image");
		var url = $("#userImage").val();
		console.log("URL submitted: ",url)
		$.post("/games/"+$.cookie("gameId")+"/submit", {url: url, name: $.cookie("name")}, function (data) {
			console.log(data)
		});
	});

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

			})
		});
	}

	$("#displayWinner").click(function () {
		console.log("displaying the winner");
		$.get("/games/"+$.cookie("gameId")+"/winner", function (data) {
			console.log(data);
			$("#winner").append("<img class='userImg' src='"+data.url+"'>");
		});
	});

	var castVote = function (votee) {
		console.log("Voting for: ",votee);
		$.post("/games/"+$.cookie("gameId")+"/vote", { userId : votee }, function (data) {
			console.log(data);
		});

	}


});