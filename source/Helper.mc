using Toybox.System as Sys;


var DEBUG = true;
var HW_DEBUG = false;

function debug(s){
    // prints 's' only if DEBUG is true
    if(DEBUG){
        Sys.println(s);
    }
}