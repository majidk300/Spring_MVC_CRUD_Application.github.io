<%@page import="java.text.DateFormat"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes: Note Taker</title>

<%@include file="all_js_css_.jsp"%>

</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>

		<br>

		<h3 class="text-uppercase">All Notes :</h3>

		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();

				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top pt-2" src="img/notepad.png"
						style="max-width: 100px; padding-left: 18px;" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
                        <span><b class="text-primary"><%=DateFormat.getDateInstance().format(note.getAddedDate())%></b></span>

						<div class="container" style="text-align:right">

							<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
						</div>


					</div>
				</div>


				<%
				}

				s.close();
				%>

			</div>

		</div>




	</div>

</body>
</html>