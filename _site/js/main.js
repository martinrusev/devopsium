"use strict";
$(function ()
{	

	_.templateSettings = {
  		interpolate: /\{\{(.+?)\}\}/g
	};

	var qtip_options = {
		content: {
				attr: 'data-tooltip' // Tell qTip2 to look inside this attr for its content
		},
		style: { classes: 'qtip-bootstrap'},
		 position: {
			my: 'bottom center',
			at: 'top center'
		}
	}

	
	$(".with-tooltip").qtip(qtip_options);

	// $.get("https://api.github.com/repos/martinrusev/edgium/contents/packages", function(data) {
	// 	var packages_list = $('.packages-list');

	// 	_.each(data, function(element){

	// 		var template = _.template("<li> {{ name }}</li>");
	// 		var compiled = template({name: element.name});	
			
	// 		//packages_list.append(compiled)
	// 	});	


    	
	// });


});