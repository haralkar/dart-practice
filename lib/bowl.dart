
class Bowling {
    List<int> _score = new List();

    int get score {
	int roll = 0;
	int theScore = 0;
	for (int frame = 0; frame < 10; frame ++) {

	    int usedRolls = 2;
	    int newScore = _score[roll] + _score[roll+1];

	    if (_score[roll] == 10) { // strike
		newScore += _score[roll+2];
		usedRolls = 1;
	    } else if (newScore == 10) { // spare
		newScore += _score[roll+2];
	    } 
	    roll += usedRolls;
	    theScore += newScore;
	}
	return theScore;
    }

    Bowling roll (int s) {
    	_score.add(s);
    }
}

class Sorting {
    bool isSorted = false;
    List<int> list = new List<int>();

    //Sorting(List<int> this.list) {}
    add( int d) {
	count ++;
    	list.add(d);
    }
    int count = 0;
    sort() {
    	list = internalSort(list);
	isSorted = true;
    }
    List<int> internalSort(list) {
	if (list.length == 1) {
	    return list;
	} else if (list.length == 2) {
	    if (list[0] > list[1]) {
		return [list[1], list[0]];
	    }
	    return list;
	}
	List<int> split = [list[0]];
	List<int> after = [list[1], list[2]];
	List<int> sorted = internalSort(after);
	print("$split, $after");
	split.addAll(sorted);
	print("$split");
	return split;
    }
}
