<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>

<%@include file="all_js_css_.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>

		<br>

		<h2>Please fill your note details</h2>
		<br>


		<!-- this is form-start  -->

		<form action="SaveNoteServlet" method="post">

			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> 
				<input required name="title"
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" />

			</div>

			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required name="content" class="form-control" id="content"
					placeholder="Enter your content here " style="height: 250px;"></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>

		<!-- this is form-end -->


	</div>

</body>
</html>