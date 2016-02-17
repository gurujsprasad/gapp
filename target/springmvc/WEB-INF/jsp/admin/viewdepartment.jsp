<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <title>View Department</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style type="text/css">
 .panel-primary {
    border-color: #948D8C;
}
  .panel-primary>.panel-heading {
    color: #fff;
    background-color: #948D8C;
    border-color: #F9F9F9;
}
  </style>
</head>
<body>

<div class="container">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../admin.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../admin.html">Home</a></li>
      <li><a href="../../logout.html">Logout</a></li>
      <li><a href="#"></a></li>
    </ul>
   
  </div>
</nav> 
    <div class="panel panel-default">
      <div class="panel-heading">
		<ul class="breadcrumb">
		  <li><a href="../admin.html">Home</a> <span class="divider"></span></li>
		  <li><a href="../listdepartment.html">List Departments</a> <span class="divider"></span></li>
		  <li class="active">View Department</li>
		 </ul>
	  </div>
      <div class="panel-body">
      	<div class="panel panel-primary">
     		<div class="panel-heading">Department</div>
      		<div class="panel-body">${department.name}</div>
   		</div>
      	<div class="panel panel-primary">
	      <div class="panel-heading">Programs</div>
	      <div class="panel-body">
	      <table>
	      	<c:forEach items="${programs}" var="program">
	      	<tr><td>
      			<c:out value="${program.programName }"></c:out>
      		</td></tr>
      		</c:forEach>
      	</table>
	      </div>
	    </div>
      	<div class="panel panel-primary">
      		<div class="panel-heading">Additional Fields</div>
     			<div class="panel-body">
     				<table class="table table-striped">
					    <thead>
					      <tr>
					        <th>Field Name</th>
					        <th>Type</th>
					        <th>Required/Optional</th>
					      </tr>
					    </thead>
					    <tbody>
					      	<c:forEach items="${additionalFields}" var="addtionalField">
					      		<tr>
						      	<td><c:out value="${addtionalField.nameOfField }"></c:out></td>
						      	<td><c:out value="${addtionalField.fieldType }"></c:out></td>
						      	<td><c:out value="${addtionalField.requiredOrOptional }"></c:out></td>
						      	 </tr>
					      	</c:forEach>
					     
      				</table>
     			</div>
   	 	</div>    	
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
