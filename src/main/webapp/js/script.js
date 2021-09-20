function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");

	if (cart == null) {
		//not cart yet
		let products = [];

		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }

		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("Product is added for the first time")
		showToast("Product is added for the first time")


	} else {
		//cart is allready present
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == pid)
		//console.log(oldProduct)

		if (oldProduct) {
			//we have to increage the quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})


			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product Quantity is Increased")
			showToast(oldProduct.productName + "Product Quantity is Increased")


		} else {

			//we have  add the Product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log(" new Product Added")
			showToast("New Product Added To Cart")
		}
	}
	updateCart();
}


//update cart

function updateCart() {

	let cartString = localStorage.getItem("cart");

	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {

		console.log("cart is empty !!")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart dose not have Any itmes </h3>");
		$(".checkout-btn").attr('disabled', true);
		$(".paynow-btn").attr('disabled', true);

	} else {
		// there is something in cart to show 
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`);

		let table = `
						<table class= 'table' >
						<thead class='thead-light' >
						
								<tr>
								<th>Item </th>
								<th>Item Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total Price</th>
								<th>Action</th>
								
								</tr>
						</thead>
			
			
					`;


		let totalPrice = 0;


		cart.map((item) => {


			table += `
						
						<tr>
									<td> ${item.productPhoto}</td>
									<td> ${item.productName}</td>
									<td> ${item.productPrice}</td>
									<td> ${item.productQuantity}</td>
									<td> ${item.productQuantity * item.productPrice}</td>
									<td> <button  onclick= "deleteItemFromCart(${item.productId})" class='btn btn-danger btn-sm'>Remove</button></td>
								</tr>
						`
			totalPrice += item.productPrice * item.productQuantity;
		}
		)
		table = table + `
		<tr><td colspan='6' class='text-right font-weight-bold'  >  Total Price : ${totalPrice} /- </td></tr>
		</table`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled', false);
		$(".paynow-btn").attr('disabled', false);
		console.log("removed")
	}

}


//delet Item
function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem("cart"))
	let newcart = cart.filter((item) => item.productId != pid)
	localStorage.setItem("cart", JSON.stringify(newcart)) ///////////isme cart nhi likha tha to deletkarene par bhi waise hi rahta thA
	updateCart();
	showToast("Item Is Remove form Cart")
}

$(document).ready(function() {
	updateCart();

}
)


function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);

	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}

function goToCheckOut() {


	window.location = "checkout.jsp"
}


// First Requst-TO the server to create order

function goToCheckOut() {


	window.location = "checkout.jsp"
}


const paymentStart1=()=> {
	console.log("Payment  Started...");

	let amount = $("#payment_field").val();

	console.log(amount);

	if (amount == '' || amount == null) 
	{

		alert ("amount is Required !!");
		return;

	}
	//code 
	//We will use ajex to send request to server to create order-jquery
	
	$.ajax(
		
		{
			url:'/user/create_order',
			data:JSON.stringify({amount:amount,info:'order_reqvest'}),
			contentType:'application/json',
			type:'POST', 
			dataType:'json',
			success:function(response){
				//invoked when success
				
				 console.log(response)
				
			},
			error:function(error){
				//invoked when error
				
			console.log(error)	
			alert ("Somthing went worng ")
			
				
			}
			
			
			
		}
		
		
		
	)
	
};


















