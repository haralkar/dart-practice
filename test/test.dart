import "package:test/test.dart";
import "../lib/bowl.dart";

main() {

    test("this actually runs", () {
	expect(true,true);
    });

    test("gutter game", () {
    	var game = new Bowling();
	for (var i=0; i<20; i++) {
	    game.roll = 0;
	}
	expect(game.score, 0);
    });
    test("all singles", () {
    	var game = new Bowling();
	for (var i=0; i<20; i++) {
	    game.roll = 1;
	}
	expect(game.score, 20);
    });
    //*
    // */
	
}
