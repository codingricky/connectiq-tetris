module Game {

	enum {
		LEFT, RIGHT, ROTATE, DOWN, FALL
	}

	class TetrisPiece {
	
		hidden var pieceType;
		hidden var board;
		hidden var centrePoint;
		hidden var blocks;
		hidden var maxRotate;
		hidden var rotation;
	
		function initialize(pieceType, board) {
			self.blocks = new [4];
			self.pieceType = pieceType;
			self.board = board;
			var columns = board.getColumns();
			self.centrePoint = new Point(columns/2, 1);
			self.rotation = 0;
			initializePieces();
		}
		
		function getCentrePoint() {
			return centrePoint;
		}
		
		function getRelativePoints() {
			return blocks;
		}
		
		function getType() {
			return pieceType;
		}
		
		hidden function initializePieces() {
			if (pieceType == I_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(-1, 0);
				blocks[2] = new Point(1, 0);
				blocks[3] = new Point(2, 0);
				maxRotate = 2;
			} else if (pieceType == L_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(-1, 0);
				blocks[2] = new Point(-1, 1);
				blocks[3] = new Point(1, 0);
				maxRotate = 4;
			} else if (pieceType == J_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(-1, 0);
				blocks[2] = new Point(1, 0);
				blocks[3] = new Point(1, 1);
				maxRotate = 4;
			} else if (pieceType == Z_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(-1, 0);
				blocks[2] = new Point(0, 1);
				blocks[3] = new Point(1, 1);
				maxRotate = 2;
			} else if (pieceType == S_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(1, 0);
				blocks[2] = new Point(0, 1);
				blocks[3] = new Point(-1, 1);
				maxRotate = 2;
			} else if (pieceType == O_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(0, 1);
				blocks[2] = new Point(-1, 0);
				blocks[3] = new Point(-1, 1);
				maxRotate = 1;
			} else if (pieceType == T_PIECE) {
				blocks[0] = new Point(0, 0);
				blocks[1] = new Point(-1, 0);
				blocks[2] = new Point(1, 0);
				blocks[3] = new Point(-1, 1);
				maxRotate = 4;
			}
		}
		
		function rotateClockwise() {
			if (maxRotate > 1) {
				rotation++;
				if (maxRotate == 2 && rotation == 2) {
					rotateClockwiseNow();
					rotateClockwiseNow();
					rotateClockwiseNow();
				} else {
					rotateClockwiseNow();
				}
			}
			
			rotation = rotation % maxRotate;
		}
		
		function rotateAntiClockwise() {
			rotateClockwise();
			rotateClockwise();
			rotateClockwise();
		}
		
		hidden function rotateClockwiseNow() {
			for (var i = 0; i < 4; i++) {
				var temp = blocks[i].x;
				
				blocks[i].x = -blocks[i].y;
				blocks[i].y = temp;
			}
		}
		
		function move(direction) {
		
			var result = true;
			if (direction == FALL) {
				var loop = true;
				
				while (loop) {
					board.removePiece(self);
					centrePoint.incrementY();
					
					if (board.willFit(self)) {
						board.addPiece(self, false);
					} else {
						centrePoint.decrementY();
						board.addPiece(self, false);
						loop = false;
						result = false;
					}
				}
			} else {
					board.removePiece(self);
					doMove(direction);
					
					if (board.willFit(self)) {
						board.addPiece(self, true);
					} else {
						undoMove(direction);
						board.addPiece(self, true);
						result = false;
					}
			}
			
			return result; 
		}
		
		hidden function doMove(direction) {
			if (direction == LEFT) {
				centrePoint.decrementX();
			} else if (direction == RIGHT) {
				centrePoint.incrementX();
			} else if (direction == DOWN) {
				centrePoint.incrementY();
			} else if (direction == ROTATE) {
				rotateClockwise();
			}
		}
		
		hidden function undoMove(direction) {
			if (direction == LEFT) {
				centrePoint.incrementX();
			} else if (direction == RIGHT) {
				centrePoint.decrementX();
			} else if (direction == DOWN) {
				centrePoint.decrementY();
			} else if (direction == ROTATE) {
				rotateAntiClockwise();
			}
		}
		
	}
}