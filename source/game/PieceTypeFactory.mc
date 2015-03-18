using Toybox.Math as Math;
using Toybox.Graphics as Gfx;

module Game {
	enum {
		L_PIECE, J_PIECE, I_PIECE, Z_PIECE, S_PIECE, O_PIECE, T_PIECE
	}
	
	class PieceTypeFactory {
		
		var pieces;
		var pieceToColorMap;
		
		function initialize() {
			pieces = new [7];
			pieces[0] = L_PIECE;
			pieces[1] = J_PIECE;
			pieces[2] = I_PIECE;
			pieces[3] = Z_PIECE;
			pieces[4] = S_PIECE;
			pieces[5] = O_PIECE;
			pieces[6] = T_PIECE;
			
			pieceToColorMap = {};
			pieceToColorMap[L_PIECE] = Gfx.COLOR_BLUE;
			pieceToColorMap[J_PIECE] = Gfx.COLOR_WHITE;
			pieceToColorMap[I_PIECE] = Gfx.COLOR_RED;
			pieceToColorMap[Z_PIECE] = Gfx.COLOR_GREEN;
			pieceToColorMap[S_PIECE] = Gfx.COLOR_YELLOW;
			pieceToColorMap[O_PIECE] = Gfx.COLOR_PURPLE;
			pieceToColorMap[T_PIECE] = Gfx.COLOR_ORANGE;
		}
		
		function getColor(piece) {
			return pieceToColorMap[piece];
		}
	
		function getMaxNumberOfPieces() {
			return pieces.size;
		}

		function getPiece(index) {
			return pieces[index];
		}
		
		function getNewPiece() {
			return Math.rand() % 7;
		}
	}
}