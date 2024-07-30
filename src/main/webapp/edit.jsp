<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditPage</title>
    <%@include file="all_js_css.jsp" %>

</head>
<body>
   <div class="container">
       <%@include file="navbar.jsp" %>
       <br>
       
       <h1 style='text-align:center;'>
         Edit your note
       </h1>
       <br>
       <%
       int todoId=Integer.parseInt(request.getParameter("todo_id").trim());
        Session s = FactoryProvider.getFactory().openSession();
	    Transaction tx =  s.beginTransaction();
		TODO todo = s.get(TODO.class, todoId);
		
       %>
       <form action="UpdateServlet" method="post">
       <input value="<%=todo.getId() %>" name="todo_Id" type="hidden"/>
  <div class="mb-3">
	    <label for="title" 
	    class="form-label">Note Title</label>
	    <input 
	    name="title"
	    required 
	    type="text" 
	    class="form-control" 
	    id="title" 
	    aria-describedby="emailHelp"
	    placeholder="Enter here"
	    value="<%= todo.getTitle() %>"
	    />
    
  </div>
  
  
  <div class="mb-3">
    <label for="content" 
    class="form-label">Note Content</label>
    <textarea 
    name="content"
    required 
    id = "content" 
    placeholder="Enter your content here"
    class ="form-control"
    style ="height: 300px;"><%= todo.getContent() %>
    </textarea>
  </div>
  
  <div class="container text-center">
    <button type="submit" class="btn btn-success">Save</button>
  
  </div>
  
</form>
       
       </div>
</body>
</html>