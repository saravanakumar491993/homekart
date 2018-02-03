order_detail_index = 0

# Handler for sales controller new action load.
$(document).on 'turbolinks:load', ->

	return unless page.controller() == 'sales' && page.action() == 'new'

	order_detail_index = 0;

	$(".customerSearch").map ->
		obj = $(this)

		obj.autocomplete
			source: (request, response) ->
				request["by"] = obj.attr("by")
				$.ajax
					url: '/customers'
					dataType: 'json'
					data: request
					success: (data) ->
						response data
					error: response []
			focus: (event, ui) ->
				$("#customersSearchByNameInput").val(ui.item.name)
				return false
			select: chooseCustomer
				
		obj.autocomplete("instance")._renderItem = (ul, item) ->
			return $("<li>").append("<div>"+item.name+"</div>").appendTo(ul);

	SetOrderDetailsForm()


# choose a customer from the suggestion.
chooseCustomer = (event, ui) ->
	$("#customerId").html( ui.item.id )
	$("#customersSearchByNameInput").val(ui.item.name)
	$("#customersSearchByPhoneInput").val(ui.item.phone_numbers[0])
	return false


# clone ans set the order details form.
SetOrderDetailsForm = () ->
	order_detail_index++
	rootEle = $("#order_detail_div").clone()
	
	order_detail = rootEle.find("#order_detail_index")
	order_detail.prop('id', "order_detail_index_#{order_detail_index}")
	order_detail.html(order_detail_index)

	rootEle.find("#order_detail_form").prop('id', "order_detail_form_#{order_detail_index}")
	rootEle.find("#order_detail_order_id").prop('id', "order_detail_order_id_#{order_detail_index}")
	rootEle.find("#order_detail_product_id").prop('id', "order_detail_product_id_#{order_detail_index}")
	rootEle.find("#order_detail_amount").prop('id', "order_detail_amount_#{order_detail_index}")
	rootEle.find("#order_detail_mrp").prop('id', "order_detail_mrp_#{order_detail_index}")
	rootEle.find("#order_detail_discount").prop('id', "order_detail_discount_#{order_detail_index}")

	order_detail_product_name = rootEle.find("#order_detail_product_name")
	order_detail_product_name.attr("order_detail_index", order_detail_index)
	order_detail_product_name.prop('id', "order_detail_product_name_#{order_detail_index}")

	order_detail_quantity = rootEle.find("#order_detail_quantity")
	order_detail_quantity.attr("order_detail_index", order_detail_index)
	order_detail_quantity.prop('id', "order_detail_quantity_#{order_detail_index}")

	$("#order_detail_table").append(rootEle.html())

	searchProductInput = $("#order_detail_product_name_#{order_detail_index}")
	searchProductInput.focus()
	searchProductInput.autocomplete
		source: (request, response) ->
			request["by"] = "name"
			$.ajax
				url: '/products'
				dataType: 'json'
				data: request
				success: (data) ->
					response data
				error: response []
		focus: (event, ui) ->
			order_detail_id = $(this).attr("order_detail_index")
			$("#order_detail_product_name_#{order_detail_index}").val(ui.item.product_name)
			retrun false
		select: chooseProduct
	
	searchProductInput.autocomplete("instance")._renderItem = (ul, item) ->
			return $("<li>").append("<div>"+item.product_name+"</div>").appendTo(ul);

	$("#order_detail_quantity_#{order_detail_index}").on 'change', ->
		 computeOrderAmount($(this).attr("order_detail_index"))


# choose a product from the suggestion.
chooseProduct = (event, ui) ->
	order_detail_id = $(this).attr("order_detail_index")
	$("#order_detail_product_name_#{order_detail_index}").val(ui.item.product_name)
	$("#order_detail_product_id_#{order_detail_index}").val(ui.item.product_id)
	$("#order_detail_mrp_#{order_detail_index}").val(ui.item.mrp)
	$("#order_detail_discount_#{order_detail_index}").val(ui.item.discount)
	$("#order_detail_form_#{order_detail_index}").attr("product", ui.item)
	computeOrderAmount(order_detail_id)
	return false

computeOrderAmount = (order_index) ->
	order_form = $("#order_detail_form_#{order_index}")
	quantity = $("#order_detail_quantity_#{order_index}")
	amount = $("#order_detail_amount_#{order_index}")
	mrp = $("#order_detail_mrp_#{order_index}")

	if order_form.attr("product") and quantity.val()
		amount.val(quantity.val() * mrp.val())
		SetOrderDetailsForm()