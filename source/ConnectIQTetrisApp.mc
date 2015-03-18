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
        return [ new ConnectIQTetrisView(tetrisGame), new ConnectIQTetrisDelegate(tetrisGame) ];
    }
}

class ConnectIQTetrisDelegate extends Ui.BehaviorDelegate {

	var tetrisGame;
	
	function initialize(tetrisGame) {
		self.tetrisGame = tetrisGame;
	}

    function onBack() {
    	debug("onBack");
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
    }
    	    
    function onPreviousPage() {
    	debug("onPreviousPage");
    	tetrisGame.movePiece(Game.LEFT);
    	return true;
    }
    

}