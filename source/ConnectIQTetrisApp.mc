using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class ConnectIQTetrisApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
    	var tetrisGame = new Game.TetrisGame();
        return [ new ConnectIQTetrisView(tetrisGame), new ConnectIQTetrisInputDelegate(tetrisGame) ];
    }
}

class ConnectIQTetrisInputDelegate extends Ui.InputDelegate {
	var tetrisGame;
	
	function initialize(tetrisGame) {
		self.tetrisGame = tetrisGame;
	}
	
	function onKey(evt) {
		var key = evt.getKey();
		if (key == Ui.KEY_ESC) {
			tetrisGame.movePiece(Game.LEFT);
		} else if (key == Ui.KEY_MENU) {
			tetrisGame.movePiece(Game.RIGHT);
		} else if (key == Ui.KEY_ENTER) {
			tetrisGame.movePiece(Game.ROTATE);
		}
	}
}

class ConnectIQTetrisDelegate extends Ui.BehaviorDelegate {

	var tetrisGame;
	
	function initialize(tetrisGame) {
		self.tetrisGame = tetrisGame;
	}
	
 	function onSwipe(evt) {
 		debug("onSwipe");
 	}
 	
    function onBack() {
    	debug("onBack");
    	return true;
    }

    function onMenu() {
    	debug("onMenu");
    	tetrisGame.movePiece(Game.RIGHT);
        return true;
    }
    
    function onNextMode() {
    	debug("onNextPage");
    	tetrisGame.movePiece(Game.RIGHT);
    	return true;
    }
        
    function onNextPage() {
    	debug("onNextPage");
    	tetrisGame.movePiece(Game.ROTATE);
    	return true;
    }
    
    function onPreviousMode() {
    	debug("onPreviousMode");
    	return true;
    }
    	    
    function onPreviousPage() {
    	debug("onPreviousPage");
    	tetrisGame.movePiece(Game.LEFT);
    	return true;
    }
    

}