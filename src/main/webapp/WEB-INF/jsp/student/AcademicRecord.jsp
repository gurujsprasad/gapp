<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
  <title>Academic Record</title>
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
      <div class="panel-heading"> Academic Record</div>
      <div class="panel-body">
      		
      			<form role="form"  class="form-horizontal" action = "AcademicRecord.html" method = "post" enctype="multipart/form-data">
      		      <div class="form-group">
			      	<label for="text"  class="control-label col-sm-2">GRE</label>
					    <div class="col-sm-3">
					  	  <input  name="greScore" type="text" class="form-control" id="greScore" placeholder="GRE Score" <c:if test="${academicRecord != null }">value='${academicRecord.greScore }'</c:if> required/>
					  	 </div>
					  </div>
					  <div class="form-group">
					  <label for="text"  class="control-label col-sm-2">TOEFL</label>
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="toeflScore" name="toeflScore" placeholder="Toefl Score" <c:if test="${academicRecord != null }">value='${academicRecord.toeflScore }'</c:if> required/>
					  	 </div>
					  </div>
					<div class="form-group">
					<label for="text"  class="control-label col-sm-2">GPA</label>
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="gpa" name="gpa" placeholder="GPA" required <c:if test="${academicRecord != null }">value='${academicRecord.gpa }'</c:if>/>
					  	 </div>
					  </div>
					  <c:if test="${academicRecord != null }">
				      	<div class="alert alert-success">
							<a href = "ViewFile/${academicRecord.transcript }.html" target = "_blanck"><b>${ academicRecord.transcript}</b></a>, trascript has been uploaded. You can replace with new file if required !! 
						</div>
				      </c:if>
					  <div class="form-group">
					  <label for="text"  class="control-label col-sm-2">Transcript</label>
					    <div class="col-sm-3">
					  	  <input type="file" class="form-control" id="transcript" name="transcript" <c:if test="${academicRecord == null }">required</c:if> />
					  	 </div>
					  </div>				
					  <div class="form-group">        
			     		<div class="col-sm-offset-2 col-sm-10">
			     			
			     			<c:if test = "${academicRecord == null}">
			     				<button type="submit" class="btn btn-danger"  name="function" value = "college">Add Academic Record</button>
			     			</c:if>
			     			<c:if test = "${academicRecord != null}">
			     				<button type="submit" class="btn btn-info"  name="function" value = "college">Update Academic Record</button>
			     			</c:if>
      					</div>
				</div>
				</form>
				<hr>
				<a href = "AdditionalDetails.html"><button type="button" class="btn btn-danger"  name="function" value = "done">Save & Continue</button></a>
			<!-- 	<a href = "SubmitApplication.html"><button type="button" class="btn btn-danger"  name="function" value = "done">Submit Application</button></a> -->
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
