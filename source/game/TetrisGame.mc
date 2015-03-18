using Toybox.Time as Time;

module Game {
	class TetrisGame {
		hidden var board;
		hidden var gameState;
		hidden var currentPiece;
		hidden var lastUpdate;
		hidden var pieceTypeFactory;
		
		function initialize() {
			board = new Board(10, 15);
			gameState = new GameState();
			pieceTypeFactory = new PieceTypeFactory();
		}
		
		function startGame() {
			if (!gameState.isPlaying()) {
				board.resetBoard();
				gameState.reset();
				gameState.start();
				currentPiece = null;
				lastUpdate = 0;
			}
		}
		
		function stopGame() {
			gameState.stop();
		}
		
		function movePiece(direction) {
			debug("moving piece " + direction);
			
			if (direction == null) {
				return;
			}
			
			if (currentPiece != null && gameState.isPlaying()) {
				if (direction == DOWN || direction == FALL) {
					if (!currentPiece.move(direction)) {
						currentPiece = null;
					}
				} else {
					currentPiece.move(direction);
				}
			}
		}
		
		function tick() {
			if (gameState.isPlaying()) {
				debug("playing");
				if (currentPiece == null) {
					var completedLines = board.getNumberOfRowsThatWillBeRemoved();
					board.removeCompletedLines();
					
					if (completedLines > 0) {
						// TODO gamestate stuff
					}
					
					currentPiece = nextPiece();
					
					if (board.willFit(currentPiece)) {
						board.addPiece(currentPiece, true);
					} else {
						//board.addPiece(currentPiece, true);
						stopGame();
					}
				} else {
					movePiece(DOWN);
				}
			}
		}
		
		hidden function nextPiece() {
			var piece = pieceTypeFactory.getNewPiece();
			return new TetrisPiece(piece, board);
		}
		
		hidden function currentTime() {
			return Time.now().value();
		}
		
		function getPieceAt(x, y) {
			return board.getPieceAt(x, y);
		}
		
		function hasPieceAt(x, y) {
			return getPieceAt(x, y) != null;
		}
		
		function getColorAt(x, y) {
			var pieceType = getPieceAt(x, y);
			return pieceTypeFactory.getColor(pieceType);		
		}

		function getX() {
			return board.getColumns();
		}
		
		function getY() {
			return board.getRows();
		}
	}
}