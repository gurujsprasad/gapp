<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <title>Student Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <!-- <style type="text/css">
  	html{
  	background-image: url('../img/bg-image.jpg');
  	}
  </style> -->
</head>
<body>

<div class="container">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="student.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="student.html">Home</a></li>
      <li><a href="../logout.html">Logout</a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>
  
 
    <div class="panel panel-default">
      <div class="panel-heading"> Welcome, ${user.firstName } !!</div>
      <div class="panel-body">
	      <c:if test="${message != '' and message != null }">
	      	<p>You have no applications at this time, Click on  <a href = "StudentApplication.html">Apply</a> to submit an application</p>
	      </c:if>
	      <c:if test="${studentInfo.size() > 0}">
	      	<p>You have, <c:out value="${studentInfo.size()}"></c:out> applications in processing</p>
	      	<a href = "StudentApplication.html"><button type="button" class="btn btn-danger">New Application</button></a>
	      		<table class="table table-hover">
				    <thead>
				      <tr>
				        <th>Department</th>
				        <th>Program</th>
				        <th>term</th>
				        <th>Status</th>
				        <th>Submitted On</th>
				        <th>Operation</th>
				      </tr>
				    </thead>
		    		<tbody>
		    		<c:forEach items="${studentInfo}" var="student">
		    			<tr>
		    				<c:forEach items="${student.applications.statusInfo}" var="statusInfo">
			    			 	<c:if test="${statusInfo.status.statusName eq 'New'}">
			    			 		<c:set value="${statusInfo.updatedTime}" var="date" ></c:set>
			    			 	</c:if>
			    			 </c:forEach>
			    			 
			    			 <td>${student.applications.program.department.name}</td>
			    			 <td>${student.applications.program.programName }</td>
			    			 <td>${student.applications.term}</td>	
			    			 <td>${student.applications.currentStatus}</td>
			    			 <td><fmt:formatDate pattern="M/d/yyyy" value="${ date }" /></td>
			    			 	
			    			 <td>
			    			 	<c:if test="${student.applications.currentStatus eq 'Saved'}">
			    			 		<a href= "StudentEditApplication/${student.id }.html">EDIT</a>
			    			 	</c:if>
			    			 	<a href= "StudentViewApplication/${student.id }.html">VIEW</a>
			    			 </td>
		    			</tr>
		    		</c:forEach>
		    		</tbody>
		  	   </table> 
	      </c:if>
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
