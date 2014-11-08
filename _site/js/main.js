"use strict";
$(function ()
{	

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


	$('.packages-table').DataTable( {
		"paging":   false,
		"ordering": false,
		"oLanguage": {"sSearch": "",},
		"info":     false
	});
	$('.dataTables_filter').find('input').attr("placeholder", "Search");


});