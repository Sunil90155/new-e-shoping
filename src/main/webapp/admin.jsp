<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in!!");
	response.sendRedirect("login.jsp");

} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not admin!!!Do not access this page");
		response.sendRedirect("login.jsp");
	}
}
%>

<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cdao.getCategories();

//getting count

Map<String,Long> m =Helper.getCounts(FactoryProvider.getFactory());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="Components/Navbar.jsp"%>

	<div class="container custom-admin">
		<div class="container-fluid mt-3">
						
						<!-- Massage -->
			<%@ include file="Components/message.jsp"%>
			
		</div>

		<div class="row mt-3">


			<!-- First colomn -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">

						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/team.png">

						</div>

						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>
				</div>
			</div>

			<!-- 2 colomn -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/list.png">

						</div>
						<h1><%=list.size() %></h1>
						<h1 class="text-uppercase text-muted">categories</h1>

					</div>
				</div>
			</div>

			<!-- 3 colomn -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/delivery-box.png">

						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

	</div>

												<!-- Secand-raw -->

	<div class="container custom-admin">
		<div class="row mt-3">


			<!--  Second-raw First colomn -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-Modal">
					<div class="card-body text-center">

						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/inventory_categories.png">

						</div>

						<!-- <h1>245655</h1> -->
						<p class="mt-2">click hare to add new category</p>
						<h1 class="text-uppercase text-muted">Add categories</h1>

					</div>
				</div>
			</div>

			<!--  Second-raw 2 colomn -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-Modal">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/add_Product_plus.png">

						</div>
						<!-- <h1>26535</h1> -->
						<p class="mt-2">click hare to add new Products</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>

					</div>
				</div>
			</div>

		</div>
	</div>
										<!--end of  Secand row -->
										
										<!-- third-row -->

	<div class="container custom-admin">
		<div class="row mt-3">


			<!--  Second-raw First colomn -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-Modal">
					<div class="card-body text-center">

						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/delete-categories-128.png">

						</div>

						<!-- <h1>245655</h1> -->
						<p class="mt-2">click hare to Delet  category</p>
						<h1 class="text-uppercase text-muted">Delete categories</h1>

					</div>
				</div>
			</div>

			<!--  Second-raw 2 colomn -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-Modal">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/garbage-vector-icon-png_276833.jpg">
						</div> 
						<!-- <h1>26535</h1> -->
						<p class="mt-2">click hare to Delete Products</p>
						<h1 class="text-uppercase text-muted">Delete Products</h1>
						
					</div>
				</div>
			</div>

		</div>
	</div>
										
										
										
										
										<!-- End of third raw -->



										<!-- add category modal -->

								<!-- Modal -->
	<div class="modal fade" id="add-category-Modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
										<!-- MODAL BODY -->
				<div class="modal-body">
					<form action="ProductOpeationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required="required"></input>
						</div>

						<div class="form-group">
							<textarea style="height: 150px" name="catDescription"
								class="form-control" placeholder="Enter category Description"
								rows="" cols=""></textarea>
						</div>
						
										<!-- add Product category modal -->
						<div class="container text-center">
							<button class="btn btn-outline-success">Add category</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>

					</form>
					...
				</div>

			</div>
		</div>
	</div>
											<!--end add category modal -->



											<!-- add Products modal -->

	<div class="modal fade" id="add-product-Modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form action="ProductOpeationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addProduct">

			<!-- Product Name -->
						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter Product Name" required="required"></input>
						</div>

   			  <!-- Product dESCREPTION -->
						<div class="form-group">
							<textarea style="height: 90px" name="pDesc" class="form-control"
								placeholder="Enter Product Description" rows="" cols=""></textarea>
						</div>
 			
 			<!-- Product price -->
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product Price" required="required"></input>
						</div>
			
			<!-- Product Discount-->	
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Product Discount" required="required"></input>
						</div>

			<!-- Product Quantity-->
						<div class="form-group">
							<input type="number" class="form-control" name="pQuntity"
								placeholder="Enter Product Quantity" required="required"></input>
						</div>

											<!-- Product category -->
						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
												
				<!-- Product Image -->
						<div class="form-group">

							<label for="pPic">Select Picture of Product</label> <br> <input
								type="file" name="pPic" required="required">
						</div>
				<!-- Add Product button  -->
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>

													<!--end of add Products modal -->
</body>
</html>