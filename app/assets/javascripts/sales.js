

$(document).on('turbolinks:load', function(evt){
	
	/*
	Provides customers suggestion on search by name
	*/
    $("#customersSearchByNameInput").autocomplete({
	    source: function(request, response){
	    	request["by"] = "name";
	    	$.ajax({
		     	url: "/customers",
		     	dataType: "json",
		     	data: request,
		        success: function(result){
		    				response(result);
		    			 }
	    	});
	    },
	    focus: function( event, ui ) {
			        $("#customerId").html( ui.item.id );
			        $("#customersSearchByNameInput").val( ui.item.name );
			        $("#customersSearchByPhoneInput").val( ui.item.phone_numbers[0] );
			        return false;
			   },
	    select: function( event, ui ) {
			        $("#customerId").html( ui.item.id );
			        $("#customersSearchByNameInput").val( ui.item.name );
			        $("#customersSearchByPhoneInput").val( ui.item.phone_numbers[0] );
			        return false;
			    }   
    })
   .autocomplete("instance")._renderItem = function( ul, item ) {
       return $( "<li>" )
        .append( "<div>" + item.name + "</div>" )
        .appendTo( ul );
		};

	/*
	Provides customers suggestion on search by phone number
	*/
	$("#customersSearchByPhoneInput").autocomplete({
	    source: function(request, response){
	    	request["by"] = "phone";
	    	$.ajax({
		     	url: "/customers",
		     	dataType: "json",
		     	data: request,
		        success: function(result){
		    				response(result);
		    			 }
	    	});
	    },
	    focus: function( event, ui ) {
			        $("#customerId").html( ui.item.id );
			        $("#customersSearchByNameInput").val( ui.item.name );
			        $("#customersSearchByPhoneInput").val( ui.item.phone_numbers[0] );
			        return false;
			   },
	    select: function( event, ui ) {
			        $("#customerId").html( ui.item.id );
			        $("#customersSearchByNameInput").val( ui.item.name );
			        $("#customersSearchByPhoneInput").val( ui.item.phone_numbers[0] );
			        return false;
			    }   
    })
   .autocomplete("instance")._renderItem = function( ul, item ) {
       return $( "<li>" )
        .append( "<div>" + item.name + "</div>" )
        .appendTo( ul );
		}

	}


	
);