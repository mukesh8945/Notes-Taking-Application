<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddNotes</title>
    <%@include file="all_js_css.jsp" %>

</head>
<body>

<div class="container ">
       <%@include file="navbar.jsp" %>
       <br>
       <h1>Please fill your notes-details: </h1>
       <br>
       
      <!--  Form -->
      
<form action="SaveNoteServlet" method="post">


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
    placeholder="Enter here"/>
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
    style ="height: 300px;"
    ></textarea>
  </div>
  
  <div class="container text-center">
    <button type="submit" class="btn btn-primary">Add</button>
  
  </div>
  
</form>
       
   </div>

</body>
</html>