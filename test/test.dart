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
    test("single item counts as one", () {
    	var sorted = new TestSorting()
	    ..add(1);
	expect(sorted.count, 1);
    });
    test("couple go in order", () {
    	var sorted = new TestSorting()
	    ..add(2)
	    ..add(1)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],1);
	expect(sorted.list[1],2);
    });
    test("in stay in", () {
    	var sorted = new TestSorting()
	    ..add(1)
	    ..add(2)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],1);
	expect(sorted.list[1],2);
    });
    test("all is after split", () {
    	var sorted = new TestSorting()
	    ..add(1)
	    ..add(3)
	    ..add(2)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],1);
	expect(sorted.list[1],2);
	expect(sorted.list[2],3);
    });
    test("no loosing split values", () {
    	var sorted = new TestSorting()
	    ..add(3)
	    ..add(3)
	    ..add(3)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],3);
	expect(sorted.list[1],3);
	expect(sorted.list[2],3);
    });
    test("split in the back", () {
    	var sorted = new TestSorting()
	    ..add(3)
	    ..add(2)
	    ..add(1)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],1);
	expect(sorted.list[1],2);
	expect(sorted.list[2],3);
    });
    test("split in the middle", () {
    	var sorted = new TestSorting()
	    ..add(2)
	    ..add(1)
	    ..add(3)
	    ..sort();
	expect(sorted.isSorted, true);
	expect(sorted.list[0],1);
	expect(sorted.list[1],2);
	expect(sorted.list[2],3);
    });
    test("adding to a sorted list dirties it", () {
    	var sorted = new TestSorting()
	    ..add(2)
	    ..add(1)
	    ..add(3)
	    ..sort()
	    ..add(2);
	expect(sorted.isSorted, false);
    });



    //*
    // */
	
}
