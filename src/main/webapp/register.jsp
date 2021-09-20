<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<%@include file="Components/Navbar.jsp"%>
<body>
	<div class="raw mt-5">

		<div class="col-md-4 offset-md-4">
			<div class="card">
			
			<%@include file="Components/message.jsp" %>
				<div class="card-body px-5">

					<div class="conttainer text-center">
					
					<img  src="img/reg_icon.png">
					
					
					</div>


					<h3 class="text-center my-3">Sign Up Hare!!!!</h3>
					<form action="RegisterSarvlet" method="post">

						<div class="mb-3">
							<label for="name">User Name</label> 
							<input  name="user_name" type="Text" class="form-control" id="name" placeholder="Enter your name">
						</div>
						<div class="mb-3">
							<label for="email">User Email</label> <input name="user_email" type="email"
								class="form-control" id="email" placeholder="Enter your Email">
						</div>

						<div class="mb-3">
							<label for="password">Enter Password</label> <input name="user_password"
								type="password" class="form-control" id="password"
								placeholder="Enter your Password">
						</div>
						<div class="mb-3">
							<label for="phone">Enter Phone number</label> <input name="user_phone" type="text"
								class="form-control" id="phone"
								placeholder="Enter your Phone number">
						</div>

						<div class="mb-3">
							<label for="address">Enter address</label>
							<textarea name="user_address"  class="form-control"
								placeholder="Enter your Address"></textarea>

						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>


						</div>


					</form>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
