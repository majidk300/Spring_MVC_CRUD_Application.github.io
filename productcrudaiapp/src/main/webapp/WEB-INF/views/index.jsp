<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="./base.jsp"%>

</head>
<body>

	<div class="container mt-4">

		<div class="row">


			<div class="col-md-12">

				<h1 class="text-center">Welcome to Product App</h1>



				<table class="table mt-3">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${products }" var="p">
							<tr>
								<th scope="row">${p.id }</th>
								<td>${p.name }</td>
								<td>${p.description }</td>
								<td> &#x20B9; ${p.price }</td>
								<td>
								  <a href="delete/${p.id }"><i class="fa-solid fa-trash-can text-danger" style="font-size:20px;"></i></a>
								  <a href="update/${p.id }"><i class="fa-solid fa-pen-nib text-primary ml-2" style="font-size:20px;"></i></a>
								</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>

				<div class="container text-center mt-3">

					<a href="add-product" class="btn btn-outline-success">Add
						Product</a>

				</div>


			</div>


		</div>

	</div>

</body>
</html>