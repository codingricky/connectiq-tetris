module Game {
	class GameState {
		hidden var playing;
		hidden var delay;
		
		function initialize() {
			playing = false;
			delay = 750;
		}
		
		function updateDelay() {
		}
		
		function reset() {
			playing = false;
		}
		
		function start() {
			playing = true;
		}
		
		function stop() {
			reset();
		}
		
		function isPlaying() {
			return playing;
		}
		
		function getDelay() {
			return delay;
		}
	}
}