<%@page import="org.hibernate.Transaction"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="all_js_css_.jsp"%>

</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>

		<br>

		<h3>Edit your page</h3>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());

		Session s = FactoryProvider.getFactory().openSession();

		Note note = (Note) s.get(Note.class, noteId);

		Transaction tx = s.beginTransaction();

		tx.commit();
		s.close();
		%>


		<!-- this is form-start  -->

		<form action="UpdateServlet" method="post">
            
            <input value="<%=note.getId() %>" name="noteId" type="hidden" />
            
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					value="<%=note.getTitle() %>" required name="title" type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" />

			</div>

			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required name="content" class="form-control" id="content"
					placeholder="Enter your content here " style="height: 250px;"><%=note.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>

		</form>

		<!-- this is form-end -->


	</div>

</body>
</html>