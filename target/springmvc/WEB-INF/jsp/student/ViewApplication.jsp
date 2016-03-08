<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <title>View Application</title>
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
      <a class="navbar-brand" href="../student.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../student.html">Home</a></li>
      <li><a href="../../logout.html">Logout</a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>
    <div class="panel panel-default">
      <div class="panel-heading"> Application Details</div>
      <div class="panel-body">
      	<div class="panel panel-primary">
     		<div class="panel-heading">Application Information</div>
      		<div class="panel-body">
      			<table class="table ">
      				<tr><td>Department</td><td>${studentInfo.applications.program.department.name}</td></tr>
      				<tr><td>Program</td><td>${studentInfo.applications.program.programName}</td></tr>
      				<tr><td>Term</td><td>${studentInfo.applications.term}</td></tr>
      				<tr>
      					<td>Submitted On</td>
      					<td>
      						<c:forEach items="${studentInfo.applications.statusInfo}" var="statusInfo">
			    			 	<c:if test="${statusInfo.status.statusName eq 'New'}">
			    			 		<c:set value="${statusInfo.updatedTime}" var="date" ></c:set>
			    			 	</c:if>
			    			 </c:forEach>
			    			 <fmt:formatDate pattern="M/d/yyyy" value="${date }" />
      					</td>
      				</tr>
      				<tr><td>Current Status</td><td>${studentInfo.applications.currentStatus}</td></tr>
      			</table>
      		</div>
   		</div>
   		<div class="panel panel-primary">
     		<div class="panel-heading">Student Information</div>
      		<div class="panel-body">
      		<label style="text-align: center;width: 100%">Personal Information</label>
      			<table class="table">
      				<tr><td>FirstName</td><td>${studentInfo.firstName}</td></tr>
      				<tr><td>LastName</td><td>${studentInfo.lastName }</td></tr>
      				<tr><td>CIN</td><td>${studentInfo.cin }</td></tr>
      				<tr><td>PhoneNumber</td><td>${studentInfo.phoneNumber }</td></tr>
      				<tr><td>Email</td><td>${studentInfo.email }</td></tr>
      				<tr><td>Gender</td><td>${studentInfo.gender }</td></tr>
      				<tr><td>DOB</td><td><fmt:formatDate pattern="M/d/yyyy" value="${studentInfo.dob }" /></td></tr>
      				<tr><td>Citizenship</td><td>${studentInfo.citizenship }</td></tr>
      				<tr><td>International Student</td><td><c:if test="${studentInfo.internationalStudent == 1}">YES</c:if><c:if test="${studentInfo.internationalStudent == O}">NO</c:if></td></tr>
      			</table>
      			<hr/>
      			<label style="text-align: center;width: 100%">Educational BackGround</label>
      			<table class="table table-hover">
						 <thead>
					      <tr>
					        <th>CollegeName</th>
					        <th>StartYear</th>
					        <th>EndYear</th>
					        <th>Degree</th>
					        <th>Major</th>
					      </tr>
					    </thead>
		    			<tbody>
		    			<c:forEach items="${studentInfo.educationalBackground}" var="educationalBackground">
		    				<tr>
		    					<td>${educationalBackground.collegeName }</td>
		    					<td><fmt:formatDate pattern="M/d/yyyy" value="${educationalBackground.startYear }" /></td>
		    					<td><fmt:formatDate pattern="M/d/yyyy" value="${educationalBackground.endYear }" /></td>
		    					<td>${educationalBackground.degree }</td>
		    					<td>${educationalBackground.major }</td>
		    				</tr>
		    			</c:forEach>
		    			</tbody>
					</table>
					<hr/>
      			<label style="text-align: center;width: 100%">Academic Record</label>
      			<table class="table table-hover">
						 <thead>
					      <tr>
					        <th>Toefl Score</th>
					        <th>Gre Score</th>
					        <th>GPA</th>
					        <th>Transcript</th>
					      </tr>
					    </thead>
		    			<tbody>
		    				<tr>
		    					<td>${studentInfo.academics.toeflScore }</td>
		    					<td>${studentInfo.academics.greScore }</td>
		    					<td>${studentInfo.academics.gpa }</td>
		    					<td><a href ="../ViewFile/${studentInfo.academics.transcript }.html" target="_blank">${studentInfo.academics.transcript }</a></td>
		    				</tr>
		    			</tbody>
					</table>
					<label style="text-align: center;width: 100%">Additional Details</label>
					<table class="table table-hover">
						<thead>
					      <tr>
						      <c:forEach items="${addtionalFields }" var="addtionalField">
						      	<th>${addtionalField.nameOfField }</th>
						      </c:forEach>
					      </tr>
					    </thead>
		    			<tbody>
		    				<tr>
		    					<c:forEach items="${studentInfo.applications.additionalFieldValues}" var = "additionalFieldValue">
		    						<c:if test="${additionalFieldValue.additionalField.fieldType eq 'file'}">
		    							<td><a href ="../ViewFile/${additionalFieldValue.value }.html" target="_blank">${additionalFieldValue.value }</a></td>
		    						</c:if>
		    						<c:if test="${additionalFieldValue.additionalField.fieldType eq 'text' || additionalFieldValue.additionalField.fieldType eq 'number'}">
		    							<td>${additionalFieldValue.value }</td>
		    						</c:if>
		    					</c:forEach>
		    				</tr>
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
