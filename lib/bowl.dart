
class Bowling {
    List<int> _score = new List();

    int get score {
    	int frame = 0;
	int roll = 0;
	int theScore = 0;
	while (frame < 10) {
	    int newScore = _score[roll];
	    newScore += _score[roll+1];
	    if (_score[roll] == 10) {
		newScore += _score[roll+2];
		roll += 1;
	    } else if (newScore == 10) {
		newScore += _score[roll+2];
		roll += 2;
	    } else {roll+=2;}
	    frame += 1;
	    theScore += newScore;
	}
	return theScore;
    }
    Bowling roll (int s) {
    	_score.add(s);
    }
}
