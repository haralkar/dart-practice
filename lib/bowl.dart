
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
    int get count => 0;
}
