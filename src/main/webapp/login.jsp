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
			<div class="card mt-3">
				<div class="card-header custom-bg text-white">
				<h3 class="text-center my-3">Login  Hare!!!!</h3>
				</div>
				
				<%@include file="Components/message.jsp" %>
				<div class="card-body px-5">
				
					<form action="LoginSarvlet" method="post">
						<div class="mb-3">
						<div class="mb-3">
							<label for="email">User Email</label> <input name="email"
								type="email" class="form-control" id="email"
								placeholder="Enter your Email">
						</div>

						<div class="mb-3">
							<label for="password">Enter Password</label> <input
								name="password" type="password" class="form-control"
								id="password" placeholder="Enter your Password">
						</div>
						
						<a href="register.jsp" class="text-center d-block m-3">If not Register click hare</a>
					
						<div class="container text-center">
							<button class="btn btn-outline-success custom-bg text-white">Login</button>
							<button class="btn btn-outline-warning">Reset</button>


						</div>

					</div>
					</form>

				</div>

			</div>
		</div>
	</div>
</body>
</html>