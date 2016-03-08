<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <title>Educational Background</title>
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
      <div class="panel-heading"> Educational Background</div>
      <div class="panel-body">
      <c:if test="${educationalBackgrounds != null  }">
					<table class="table table-hover">
						 <thead>
					      <tr>
					        <th>CollegeName</th>
					        <th>StartYear</th>
					        <th>EndYear</th>
					        <th>Degree</th>
					        <th>Major</th>
					        <th>Operation</th>
					        
					      </tr>
					    </thead>
		    			<tbody>
		    			<c:forEach items="${educationalBackgrounds}" var="educationalBackground">
		    				<tr>
		    					<td>${educationalBackground.collegeName }</td>
		    					<td><fmt:formatDate pattern="M/d/yyyy" value="${educationalBackground.startYear }" /></td>
		    					<td><fmt:formatDate pattern="M/d/yyyy" value="${educationalBackground.endYear }" /></td>
		    					<td>${educationalBackground.degree }</td>
		    					<td>${educationalBackground.major }</td>
		    					<td><a href = "DeleteEducationalBackground/${educationalBackground.id }.html"><button type="button" class="btn btn-info"  name="function" value = "done">Delete</button></a></td>
					       		
		    				</tr>
		    			</c:forEach>
		    			</tbody>
					</table>
				</c:if>
	      <form:form role="form"  class="form-inline" action = "EducationalBackground.html" modelAttribute="educationBackground" method = "post">
			      	<div class="form-group">
					    <div class="col-sm-3">
					  	  <input  name="collegeName" type="text" class="form-control" id="collegeName" placeholder="CollegeName Required" required/>
					  	 </div>
					  </div>
					  <div class="form-group">
					  <label for="text"  class="control-label col-sm-2">Start Year<span style="color: red;">*</span></label>
					    <div class="col-sm-3">
					  	  <input type="date" class="form-control" id="startYear" name="startYear" placeholder="Start Year" required/>
					  	 </div>
					  </div>
					<div class="form-group">
					<label for="text"  class="control-label col-sm-2">End Year<span style="color: red;">*</span></label>
					    <div class="col-sm-3">
					  	  <input type="date" class="form-control" id="endYear" name="endYear" placeholder="End Year" required />
					  	 </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="major" name="degree" placeholder="Degree Required" required />
					  	 </div>
					  </div>
					<div class="form-group">
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="major" name="major" placeholder="Major Required"  required/>
					  	 </div>
					  </div>					
					  <div class="form-group">        
			     		<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-info"  name="function" value = "college">Add College</button>
					  </div>
				</div>
				</form:form>
				<hr>
				<a href = "AcademicRecord.html"><button type="button" class="btn btn-danger"  name="function" value = "done">Save & Continue</button></a>
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
