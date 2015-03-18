module Game {
	class Board {
		hidden var maxX, maxY;
		hidden var matrix;
		hidden var emptyBlock;
		
		function initialize(maxX, maxY) {
			self.maxX = maxX;
			self.maxY = maxY;
			resetBoard();
		}
		
		function getColumns() {
			return maxX;
		}
		
		function getRows() {
			return maxY;
		}	
		
		function resetBoard() {
			matrix = new [maxX];
			for (var i = 0; i < maxX; i++) {
				matrix[i] = new [maxY];
			}
			emptyBlock = null;
		}
		
		function getPieceAt(x, y) {
			return matrix[x][y];
		}
		
		function addPiece(piece) {
			setPiece(piece, piece.getType());
		}
		
		function removePiece(piece) {
			setPiece(piece, emptyBlock);
		}
	
		function removeRow(row) {
			for (var tempRow = row; tempRow > 0; tempRow--) {
				for (var tempCol = col; tempCol < getColumns(); tempCol++) {
					var pieceType = matrix[tempCol][tempRow - 1];
					matrix[tempCol][tempRow] = pieceType;
				}
			}
			
			for (var tempCol = 0; tempCol < maxX; tempCol++) {
				matrix[tempCol][0] = emptyBlock;
			}
		}
	
		function willFit(piece) {
			var result = true;
			
			if (piece != null) {
				var centre = piece.getCentrePoint();
				var blocks = piece.getRelativePoints();
				
				for (var i = 0; i < 4 && result; i++) {
					var x = centre.getX() + blocks[i].getX();
					var y = centre.getY() + blocks[i].getY();					
					if (x < 0 || x >= maxX || y < 0 || y >= maxY) {
						result = false;
					}
					
					if (result && matrix[x][y] != emptyBlock) {
						result = false;
					}
				}
			}
			
			return result;
		}
		
		function removeCompletedLines() {
			var completedLines = 0;
			
			for (var row = maxY - 1; row >= 0; row--) {
				if (isRowComplete(row)) {
					removeRow(row);
					
					row++;
					completedLines++;
				}
			}
			return completedLines;
		}
		
		function getNumberOfRowsThatWillBeRemoved() {
			return getRowsReadyForRemoval().size();
		}
		
		function getRowsReadyForRemoval() {
			// TODO Create an ArrayList class???
			var completedRows = [maxY];
			
			var completedRowsCount = 0;
			for (var row = maxY - 1; row >= 0; row--) {
				if (isRowComplete(row)) {
					completedRows = row;
					completedRowsCount++;
				}
			}
			
			var newArray = [completedRowsCount];
			for (var i = 0; i < completedRowsCount; i++) {
				newArray[i] = compeltedRows[i];
			}
			
			
			return newArray;
		}
	
		hidden function isRowComplete(row) {
			for (var cols = 0; cols < maxY; cols++) {
				if (matrix[cols][row] == emptyBlock) {
					return false;
				}
			}
			return true;
		}
	
		hidden function setPiece(piece, pieceType) {		
			if (piece != null) {
				var centre = piece.getCentrePoint();
				var blocks = piece.getRelativePoints();
					
				for (var i = 0; i < 4; i++) {
					var x = centre.x + blocks[i].x;
					var y = centre.y + blocks[i].y;						
					matrix[x][y] = pieceType;
				}
			}
		}
	}
	
}