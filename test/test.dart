import "package:test/test.dart";
import "../lib/bowl.dart";

abstract class IRollMany {
    Bowling rollMany( int score, int count) ;
    Bowling roll64Spare() ;
    
}
class RollManyBowling extends Bowling with IRollMany {
    Bowling rollMany( int score, int count) {
	for (var i = count ; i>0; i--) {
	    roll(score);
	}
	return this;
    }
    Bowling roll64Spare() {
	roll(6);
	roll(4);
	return this;
    }
}

class TestSorting extends Sorting {}

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
	    ..roll64Spare()
	    ..roll64Spare()
	    ..rollMany(0, 16);
	expect(game.score, 26);
    });
    test("single strike", () {
    	var game = new RollManyBowling()
		..roll(10) // 10 +10
		..roll64Spare() // 20 + 10,1 
		..rollMany(1, 16); //31 + 16 == 47
	expect(game.score, 47);
    });
    test("perfect game", () {
    	var game = new RollManyBowling()
	    ..rollMany(10, 20);
	expect(game.score, 300);
    });


    //
    // Sorting
    //


    test("empty is empty", () {
    	var sorted = new TestSorting();
	expect(sorted.isSorted, false);
    });
    /*
    test("single item counts as one", () {
    	var sorted = new TestSorting()
	    ..add(1);
	expect(sorted.count, 1);
    });
    // */
	
}
