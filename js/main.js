"use strict";
$(function ()
{	

	var qtip_options = {
		content: {
        		attr: 'data-tooltip' // Tell qTip2 to look inside this attr for its content
    	},
		style: { classes: 'qtip-bootstrap' , "width": 400 },
		 position: {
			at: 'top center'
		}
	}

	
	$(".with-tooltip").qtip(qtip_options);


});