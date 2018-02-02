$(document).on 'turbolinks:load', ->

	$(".customerSearch").map ->
		obj = $(this)
		searchBy = obj.attr("by")

		(obj.autocomplete
			source: (request, response) ->
				$.ajax
					url: '/customers'
					dataType: 'json'
					data: request
					success: (data) ->
						response data
					error: response []

			focus: (event, ui) ->
				$("#customerId").html( ui.item.id )
				$("#customersSearchByNameInput").val(ui.item.name)
				$("#customersSearchByPhoneInput").val(ui.item.phone_numbers[0])
				return false

			select: (event, ui) ->
				$("#customerId").html( ui.item.id )
				$("#customersSearchByNameInput").val(ui.item.name)
				$("#customersSearchByPhoneInput").val(ui.item.phone_numbers[0])
				return false

		).autocomplete("instance")._renderItem = (ul, item) ->
			return $("<li>").append("<div>"+item.name+"</div>").appendTo(ul);
