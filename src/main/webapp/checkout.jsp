
<%
User userchk = (User) session.getAttribute("current-user");
if (userchk == null) {
	session.setAttribute("message", "You are not logged in!! login First to access Checkout Page");
	response.sendRedirect("login.jsp");
	return;
}
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>


<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<%@include file="Components/common_css_js.jsp"%>

<body>
	<%@include file="Components/Navbar.jsp"%>


	<div class="container">

		<div class="row mt-5">
			<!-- carT DETALS -->
			<!-- card -->
			<div class="col-md-8">

				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your select Item</h3>

						<div class="cart-body"></div>

					</div>

					<div></div>
				</div>
			</div>



			<!-- fORM DETAILS -->
			<!--CARD -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your Shiping details</h3>

						<form action="#!">
							<!-- For name -->
							<div class="form-group">
								<label for="name">your Name</label> <input
									value=" <%=userchk.getUserName()%>" type="text"
									class="form-control" id="name" placeholder="Enter Name">
							</div>
							<!-- For Email -->
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value=" <%=userchk.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<!-- For Address -->
							<div class="form-group">
								<label for="address">your Shiping Address</label> <input
									size="150" value=" <%=userchk.getUserAddress()%>" type="text"
									class="form-control" id="address"
									placeholder="Enter Your Address">
							</div>

							<hr>




							<div class="container text-center">
								<!-- Total amount -->
								<input  id="payment_field" type="text" class="form-control my-2" placeholder="Enter amount hare">

								<button  class=" btn btn-success  btn-block  " onclick="paymentStart1()">Pay now</button>
									
								<!-- <button formaction="#!"   class=" btn btn-outline-success ">Order Now</button> -->
								<br>
								<button formaction="index.jsp" class=" btn btn-outline-primary ">Continue Shopping</button>

							</div>


						</form>


					</div>



				</div>

			</div>

		</div>

	</div>



</body>
</html>