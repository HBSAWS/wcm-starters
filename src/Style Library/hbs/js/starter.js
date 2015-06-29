(function($){

var Starter = {
    ondomready:function() {
		Starter.starterfunction();
	},

	starterfunction: function(){
		//do something here
	},
	
    last:''
}



$(document).ready(Starter.ondomready);
window.Starter = Starter;

})(jQuery)