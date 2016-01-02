namespace Part\Page;

class Main {
		/**
		 * 404 Not found:
		 */
		private static function notfound(location) {
		    if(!file_exists(location)){
		        header("HTTP/1.1 404 Not Found");
		        header("Date: ".date("D, d M Y h:i:s T"));
		        header("Content-Type: text/html; charset=iso-8859-1");
		        header("X-Powered-By: P language");
		        echo file_get_contents("/etc/part/page/404.html", true);
		        die();
		    }
		}
		
			/**
		 * 403 Forbidden:
		 */
		private static function forbidden() {
			header("HTTP/1.1 403 Forbidden");
			header("Date: ".date("D, d M Y h:i:s T"));
			header("Content-Type: text/html; charset=iso-8859-1");
			header("X-Powered-By: P language");
			echo file_get_contents("/etc/part/page/403.html", true);
			die();
		}
		
		/**
		 * Set content:
		 */
		private static function content(location, type_header) {
		    var plang;
		    header("Content-Type: ".type_header."; charset=iso-8859-1");
		    let plang = file_get_contents(location, true);
		    echo plang;
		}
		/**
		 * Get config file:
		 */
		private static function config(section, config) {
			var setting;
		    let setting = parse_ini_file("part.ini",true);
		    return setting[section][config];
		}
}