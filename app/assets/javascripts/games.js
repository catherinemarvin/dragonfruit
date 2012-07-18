//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
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

	//checkGameState();

	//eventually this will load up the webcam and stuff
	//for now it displays a box and you submit a picture

	var displayStart = function () {

	}

	$("#submitImage").click(function () {
		console.log("Submitting an image");
		var url = $("#userImage").val();
		console.log("URL submitted: ",url)
		$.post("/games/"+$.cookie("gameId")+"/submit", {url: url, name: $.cookie("name")}, function (data) {
			console.log(data)
		});
	});

	$("#viewImages").click(function () {
		console.log("Time to load images")
		$.get("/games/"+$.cookie("gameId")+"/getImages", function (data) {
			console.log(data);
			for (i in data) {
				var url = data[i];
				$("#images").append("<img class='userImg' src='"+url+"'/>")
			}
		});
	});

	$("#vote").click(function () {
		var votee = "khwang"
		console.log("Voting for: ",votee);
		$.post("/games/"+$.cookie("gameId")+"/vote", { userId : votee }, function (data) {
			console.log(data);
		});

	});


});
