module Game {

	
	class Point {
		
		var x, y;
		
		function initialize(x, y) {
			self.x = x;
			self.y = y;
		}
		
		function getX() {
			return self.x;
		}
		
		function getY() {
			return self.y;
		}
		
		function incrementY() {
			self.y++;
		}
		
		function decrementY() {
			self.y--;
		}
		
		function incrementX() {
			self.x++;
		}
		
		function decrementX() {
			self.x--;
		}
	}
}