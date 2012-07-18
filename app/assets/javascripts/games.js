//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var checkGameState = function () {
	console.log("Checking game state!")
	console.log($.cookie("name"))
	console.log($.cookie("gameId"))
	$.get("/games/"+$.cookie("gameId")+".json", function (data) {
		console.log(data)
		if (data.started === true) { //game has started
			console.log("the game is afoot");
		} else { //game has not started
			console.log("we must wait")
			setTimeout(checkGameState,5000);
		}
	});
}