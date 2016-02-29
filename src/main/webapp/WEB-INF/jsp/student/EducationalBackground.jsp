<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <a class="navbar-brand" href="admin.html">Graduate Application Program</a>
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
	      <form:form role="form"  class="form-inline" action = "newEducationalBackground.html" modelAttribute="educationBackground" method = "post">
	      		<input type = "hidden" name = "departmentID" value ="${departmentID }"/>
	      		<input type = "hidden" name = "studentID" value ="${studentID }"/>
	      		
			      	<div class="form-group">
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="collegeName" name = "collegeName" placeholder="College Name" required>
					  	 </div>
					  </div>
					  <div class="form-group">
					  <label for="text"  class="control-label col-sm-2">Start Year</label>
					    <div class="col-sm-3">
					  	  <input type="date" class="form-control" id="startYear" name = "startYear" placeholder="Start Year" required>
					  	 </div>
					  </div>
					<div class="form-group">
					<label for="text"  class="control-label col-sm-2">End Year</label>
					    <div class="col-sm-3">
					  	  <input type="date" class="form-control" id="endYear" name = "endYear" placeholder="End Year" required>
					  	 </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="major" name = "degree" placeholder="degree" required>
					  	 </div>
					  </div>
					<div class="form-group">
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="major" name = "major" placeholder="Major" required>
					  	 </div>
					  </div>					
					  <div class="form-group">        
			     		<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-danger"  name="function" value = "college"	>Add College</button>
					  </div>
				</div>
				</form:form>
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
