<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <title>Student Information</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
    <script type="text/javascript" src="../javascript/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
	    $('#department').change(function(){
	    	var departmentID = $( "#department").val();
	    	$.ajax({
	            url: '../student/GetProgram.html',
	            data: ({
	                    departmentID : departmentID,
	                }),
	                success: function(data){ $('#program').html(data); }
	        });	 
	    });
	});
	</script>
</head>
<body>

<div class="container">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="admin.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<c:if test = "${application != null }">../</c:if>student.html">Home</a></li>
      <li><a href="<c:if test = "${application != null }">../</c:if>../logout.html">Logout</a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>
  
 
    <div class="panel panel-default">
      <div class="panel-heading"> Course and Student Information</div>
      <div class="panel-body">
	      <form action = "<c:if test = "${application != null }">../</c:if>StudentInformation.html" method = "post" role="form"  class="form-horizontal">
	      	<c:if test="${studentInfo != null }">
	      		<input type = "hidden" value = "studentExist" name = "checkStudent"/>
	      		<input type = "hidden" value = "${studentInfo.id}" name = "studentID"/>
	      	</c:if>
	      	<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Department</label>
			    <div class="col-sm-3">
			    <c:choose>
			     <c:when test="${application != null }">
			     	<input type = "hidden" id = "department" name = "department" value = "${application.program.department.id}"/>
			     	<c:out value="${application.program.department.name }"></c:out>
			     </c:when>
			     <c:otherwise>
				     <select id = "department" name = "department" class="form-control" required>
			      		<option></option>
			      		<c:forEach items="${departments }" var="department" >
			      			<option value="${department.id }">${department.name}</option>
			      		</c:forEach>
			      	 </select>
			     </c:otherwise>
			    </c:choose>
			  	  
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Program</label>
			    <div class="col-sm-3">
			     <c:choose>
			     <c:when test="${application != null }">
			     	<select id = "program" name = "program" class="form-control" required>
			     		<c:forEach items="${programs }" var="program">
			     			<option value = "${program.id }" <c:if test="${application.program.id == program.id }">selected</c:if> >${program.programName }</option>
			     		</c:forEach>
			     	</select>
			     </c:when>
			     <c:otherwise>
				     <select id = "program" name = "program" class="form-control" required></select>
			     </c:otherwise>
			    </c:choose>
			  	  
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Term</label>
			    <div class="col-sm-3">
				    <c:choose>
				     <c:when test="${application != null }">
				     	<input type = "text" name = "term" value = "${application.term }" id = "term" class="form-control" required>
				     </c:when>
				     <c:otherwise>
					     <input type = "text" name = "term" id = "term" class="form-control" required>
				     </c:otherwise>
				    </c:choose>
			  	 </div>
			</div>
			<hr/>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">First Name</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "firstName" id = "firstName" class="form-control" required <c:if test="${firstTime == 0 }">value='${user.firstName }'</c:if> <c:if test="${studentInfo != null and firstTime != 0}">value='${studentInfo.firstName }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Last Name</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "lastName" id = "lastName" class="form-control" required <c:if test="${firstTime == 0 }">value='${user.lastName }'</c:if><c:if test="${studentInfo != null  and firstTime != 0}">value='${studentInfo.lastName }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">CIN</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "cin" id = "cin" class="form-control" <c:if test="${studentInfo != null }">value='${studentInfo.cin }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Phone</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "phone" id = "phone" class="form-control" required <c:if test="${studentInfo != null }">value='${studentInfo.phoneNumber }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Email</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "email" id = "email" class="form-control" required <c:if test="${firstTime == 0 }">value='${user.email }'</c:if> <c:if test="${studentInfo != null  and firstTime != 0}">value='${studentInfo.email }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Gender</label>
			    <div class="col-sm-3">
			  	  Male<input type = "radio" name = "gender" id = "gender" value ='male' checked <c:if test="${studentInfo != null && studentInfo.gender eq 'male'}">checked</c:if>>
			  	  FeMale<input type = "radio" name = "gender" id = "gender" value= 'female' <c:if test="${studentInfo != null && studentInfo.gender eq 'female'}">checked</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Date Of Birth</label>
			    <div class="col-sm-3">
			  	  <input type = "date" name = "dob" id = "dob" class="form-control" required <c:if test="${studentInfo != null }">value='<fmt:formatDate pattern="yyyy-MM-dd" value="${studentInfo.dob}" />'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Citizenship</label>
			    <div class="col-sm-3">
			  	  <input type = "text" name = "citizenship" id = "citizenship" class="form-control" required <c:if test="${studentInfo != null }">value='${studentInfo.citizenship }'</c:if>>
			  	 </div>
			</div>
			<div class="form-group">
			    <label for="text"  class="control-label col-sm-2">Student Type</label>
			    <div class="col-sm-3">
			  	   <select id = "studentType" name = "studentType" class="form-control">
		      		<option value = '0' <c:if test="${studentInfo != null && studentInfo.internationalStudent eq '0'}">selected</c:if>>US Citizen</option>
		    		<option value = '1' <c:if test="${studentInfo != null && studentInfo.internationalStudent eq '1'}">selected</c:if>>International Student</option>
		      	  </select>
			  	 </div>
			</div>
			  <div class="form-group">        
	     		<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-danger" name = "function" value = "studentInformation">Save & Continue</button>
			 	 </div>
			  </div>
	      </form>
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
