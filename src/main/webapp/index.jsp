<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>


<html>
<head>
<title>Mycart-Home</title>
</head>

			<!-- including css and js cdn -->
			
<%@include file="Components/common_css_js.jsp"%>

			<!-- end including css and js cdn -->
<body>
					<!-- navbar -->
					
	<%@include file="Components/Navbar.jsp"%>
	
					<!--end  navbar -->
	
	<div class="container-fluid">
		<div class="row mt-4 mx-4">

			<%
			 String cat = request.getParameter("category");
			
			//out.println(cat);
			
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;
			if(cat==null || cat.trim().equals("all")){
				list = dao.getAllProducts();
			}
			 else
				{
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductById(cid);
				} 
			CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdo.getCategories(); 
			
			%>

	<!-- show category -->
	
			<div class="col-md-2">
				<div class="list-group mt-4 ">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"> All Product </a>
					
					<h1>
						<%-- <%=clist.size()%> --%>
					</h1>
					
					<%
					for (Category c : clist) {
					%>
									<!-- URL Re_wiriting -->
					<a href="index.jsp?category=<%= c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
					}
					%>

				</div>
			</div>

	<!-- show product -->
			<div class="col-md-10">
				<div class="row mt-4">

		<!-- COL:12 -->
					<div class="col-md-12">
						<div class="card-columns ">
			<!-- traversing Product -->
							<%
							for (Product p : list) {
							%>

							<!-- product card -->
							<div class="card product-card ">
								<div class="container text-center">
									<img src="img/Products/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top" alt="Card image cap">
								</div>
								
								<div class="card-body">
									<h5 class="card-title">
										<%=p.getpName()%></h5>
									<p class="card-text">
										<%=Helper.get10Word(p.getpDesc())%>
									</p>
								</div>



								<div class="card-footer text-center ">
									<button class="btn btn-success text-warning px-md-5 "
										style="margin-bottom: 4px">

										<h5>
											&#8377;<%=p.getPriceAfterApplyingDiscount()%>/-
										</h5>
										<span class="text-white discount-label">&#8377;<%=p.getpPrice()%>/-
										</span> <span><%=p.getpDiscount()%>% Off </span>
									</button>
									<br>
									<button class="btn custom-bg text-white"onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
									<button class="btn custom-bg text-white">Buy now</button>
								</div>
							</div>


							<%
							}
							if (list.size() == 0) 
							{
							out.println("<h3> No Item In this Category</h3>");
							}
							%>


						</div>



					</div>

					<%-- <h1>
				Number of Product is
				<%=list.size()%></h1>
			<%
			for (Product product : list) {

				out.println(product.getpPhoto() + "<br>");
				out.println(product.getpName() + "<br><br>");

			}
			%> --%>


				</div>

			</div>

		</div>
	</div>

</body>
</html>
