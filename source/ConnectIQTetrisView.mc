using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Math as Math;
using Toybox.System as System;
using Toybox.Timer as Timer;

class ConnectIQTetrisView extends Ui.View {
    var gameTimer;
    var tetrisGame;
    
	function initialize(tetrisGame) {
		debug("initialize");
		gameTimer = new Timer.Timer();
        gameTimer.start(method(:tick), 500, true);
        
        self.tetrisGame = tetrisGame;
        debug("tetrisGame=" + tetrisGame);
        tetrisGame.startGame();
	}

    //! Load your resources here
    function onLayout(dc) {
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    	debug("onShow");
    }

	function tick() {
	    tetrisGame.tick();
		Ui.requestUpdate();
	}

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);   
    	dc.clear();
    	    	
    	var xOffset = 20;
    	var yOffset = 2;
    	var width = 8;
    	var height = 8;
    	
  		for (var x = 0; x < tetrisGame.getX(); x++) {
    		for (var y = 0; y < tetrisGame.getY(); y++) {
    			if (tetrisGame.hasPieceAt(x, y)) {
    			    dc.setColor(tetrisGame.getColorAt(x, y), Gfx.COLOR_BLACK);   
    			    dc.drawRectangle(x * width + xOffset, y * height + yOffset, width, height);
    			}
    		}
    	}
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

}