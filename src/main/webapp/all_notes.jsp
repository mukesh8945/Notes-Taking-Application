<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewAllNotes</title>
    <%@include file="all_js_css.jsp" %>

</head>
<body>
   <div class="container">
       <%@include file="navbar.jsp" %>
   		<br>
   		<h1 class="test-uppercase">All Notes:</h1>
   		
   		<div class="row">
   		    <div class="col-12">
   		    
   		<!--Scriplet tag  -->
   		<%
   		Session s = FactoryProvider.getFactory().openSession();
   		Query q = s.createQuery("from TODO");
   		List<TODO> list = q.list();
   		for(TODO todo:list){
   			//out.println(todo.getId()+" : "+todo.getTitle()+"<br>");
   		%>
   		   <div class="card m-3" >
			  <img class="card-img-top m-3" style="max-width: 30px" src="img/notes.png" alt="ToDo">
			  <div class="card-body px-4">
			    <h5 class="card-title"><%= todo.getTitle() %></h5>
			    <p class="card-text"><%= todo.getContent() %></p>
			    <p><b class ="text-success"><%=todo.getAddedDate() %></b></p>
			    <div class="container text-center ">
			    <a href="DeleteServlet?todo_id=<%=todo.getId() %>" class="btn btn-danger">Delete</a>
			    <a href="edit.jsp?todo_id=<%=todo.getId() %>" class="btn btn-primary">Update</a>
			    </div>
			    
			  </div>
			</div>
   		<% 
   		}
   		
   		%>
   		    
   		    </div>
   		

</body>
</html>