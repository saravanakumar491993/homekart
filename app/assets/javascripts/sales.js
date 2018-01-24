

$(document).on('turbolinks:load', function(evt){
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
			        this.val( ui.item.name );
			        return false;
			   },
	    select: function( event, ui ) {
			        this.val( ui.item.name );
			        return false;
			    }   
    })
   .autocomplete("instance")._renderItem = function( ul, item ) {
       return $( "<li>" )
        .append( "<div>" + item.name + "</div>" )
        .appendTo( ul );
		};


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
			        this.val( ui.item.name );
			        return false;
			   },
	    select: function( event, ui ) {
			        this.val( ui.item.name );
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