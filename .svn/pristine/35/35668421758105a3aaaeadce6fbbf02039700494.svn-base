<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <title>List Departments</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="admin.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="admin.html">Home</a></li>
      <li><a href="../logout.html">Logout</a></li>
      <li><a href="#"></a></li>
    </ul>
   
  </div>
</nav> 
    <div class="panel panel-default">
      <div class="panel-heading">
		<ul class="breadcrumb">
		  <li><a href="admin.html">Home</a> <span class="divider"></span></li>
		  <li class="active">List Departments</li>
		 </ul>
	  </div>
      <div class="panel-body">
      	<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>ID</th>
		        <th>Department Name</th>
		        <th>Program Count</th>
		        <th>Operation</th>
		      </tr>
		    </thead>
    		<tbody>
    		<c:forEach items="${departments}" var="department">
    			<tr>
    			 <td>${department.id }</td>
    			 <td>${department.name }</td>
    			 	<c:set var="count" value="0"></c:set>
    				<c:forEach items="${programs }" var="program">
    					<c:if test="${program.department.id == department.id }">
    						<c:set var="count" value="${count+1}"></c:set>
    					</c:if>
    				</c:forEach>
    			<td>${count } </td>
    			<td>
    				<a href = "viewdepartment/${department.id}.html"><button type="button" class="btn btn-danger">View</button></a>
    				<a href = "editdepartment/${department.id}.html"><button type="button" class="btn btn-danger">Edit</button></a>
    				<a href = "deletedepartment/${department.id}.html"><button type="button" class="btn btn-danger">Delete</button></a>
    				
    			</td>
    			</tr>
    		</c:forEach>
    		</tbody>
  	   </table>
      </div>
    </div>
</div>
<footer class="footer">
      <div class="container">
        <p class="text-muted">California State University, Los Angeles. Graduate application program</p>
      </div>
</footer>
</body>
</html>
