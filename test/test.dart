import "package:test/test.dart";
import "../lib/bowl.dart";

Bowling rollMany(Bowling b, int score, int count) {
    for (var i = count ; i>0; i--) {
    	b.roll(score);
    }
    return b;
}

main() {

    test("this actually runs", () {
	expect(true,true);
    });

    test("gutter game", () {
    	var game = new Bowling();
	rollMany(game, 0, 20);
	expect(game.score, 0);
    });
    test("all singles", () {
    	var game = new Bowling();
	rollMany(game, 1, 20);
	expect(game.score, 20);
    });
    //*
    // */
	
}
