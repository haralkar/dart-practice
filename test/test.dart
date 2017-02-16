import "package:test/test.dart";
import "../lib/bowl.dart";

abstract class IRollMany {
    Bowling rollMany( int score, int count) ;
    
}
class RollManyBowling extends Bowling with IRollMany {
    Bowling rollMany( int score, int count) {
	for (var i = count ; i>0; i--) {
	    roll(score);
	}
	return this;
    }
}

main() {

    

    test("this actually runs", () {
	expect(true,true);
    });

    test("gutter game", () {
    	var game = new RollManyBowling()
	    ..rollMany(0, 20);
	expect(game.score, 0);
    });
    test("all singles", () {
    	var game = new RollManyBowling()
	    ..rollMany( 1, 20);
	expect(game.score, 20);
    });
    test("single spare", () {
    	var game = new RollManyBowling()
		..roll(4)
		..roll(6)
		..roll(6)
		..roll(1)
		..rollMany(0, 16);
	expect(game.score, 23);
    });
    test("single strike", () {
    	var game = new RollManyBowling()
		..roll(10) // 10 +7
		..roll(6)
		..roll(1) // 17 + 7 
		..rollMany(1, 16); //24 + 16 == 40
	expect(game.score, 40);
    });
    test("perfect game", () {
    	var game = new RollManyBowling()
	    ..rollMany(10, 20);
	expect(game.score, 300);
    });
    //*
    // */
	
}
