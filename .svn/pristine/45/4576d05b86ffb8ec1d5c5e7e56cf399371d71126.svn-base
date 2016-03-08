<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
  <title>Additional Information</title>
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
      <div class="panel-heading">Additional Details</div>
      <div class="panel-body">
     
      <table class="table table-hover">
						<thead>
					      <tr>
						      <c:forEach items="${additionalfields }" var="addtionalField">
						      	<th>${addtionalField.nameOfField }</th>
						      </c:forEach>
					      </tr>
					    </thead>
		    			<tbody>
		    				<tr>
		    					<c:forEach items="${additionalFieldValues}" var = "additionalFieldValue">
		    						<c:if test="${additionalFieldValue.additionalField.fieldType eq 'file'}">
		    							<td><a href ="ViewFile/${additionalFieldValue.value }.html" target="_blank">${additionalFieldValue.value }</a></td>
		    						</c:if>
		    						<c:if test="${additionalFieldValue.additionalField.fieldType eq 'text' || additionalFieldValue.additionalField.fieldType eq 'number'}">
		    							<td>${additionalFieldValue.value }</td>
		    						</c:if>
		    					</c:forEach>
		    				</tr>
					</table>
			<c:if test="${ additionalfields.size() > 0}">
			<form role="form"  class="form-horizontal" action = "AdditionalDetails.html" method = "post" enctype="multipart/form-data">
				<c:set value="0" var="fileCount" property="page"></c:set>
				<c:forEach items="${ additionalfields}" var="field">
					<div class="form-group">
					  <label for="text"  class="control-label col-sm-2">${field.nameOfField}<c:if test="${field.requiredOrOptional eq 'required'}"><span style="color: red;">*</span></c:if></label>
				      <div class="col-sm-3">
				        <c:if test="${field.fieldType eq 'text' || field.fieldType eq 'number'}">
				        	<c:set value="text" var="type" scope="page"></c:set>
				        	<c:set value="${field.nameOfField}" var="name" scope="page"></c:set>
				        </c:if>
						<c:if test="${field.fieldType eq 'file'}">
							<c:set value="file" var="type" scope="page"></c:set>
							<c:set value="files[]" var="name" scope="page"></c:set>
							<c:set value="${fileCount+1 }" var="fileCount" property="page"></c:set>
						</c:if>
						<c:if test="${field.requiredOrOptional eq 'required'}">
							<c:set value="required" var="required" scope="page"></c:set>
						</c:if>				  	  	
				  	  	<input type="${type}" class="form-control" id="${name}" name="${name}" ${required} />
				  	  	<c:set value="" var="required" scope="page"></c:set>
				  	  </div>
					</div>			
				</c:forEach>
				<div class="form-group">        
		     		<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-danger"  name="function" value = "college">Save Additional Details</button>
				  </div>
				</div>	  
			</form>
			</c:if>
			
			<c:if test="${ additionalfields.size() == 0}">
				<p> You are Good to Go, Click on Submit button to submit your applications !!!! </p>
				<a href = "SubmitApplication.html"><button type="button" class="btn btn-success"  name="function" value = "done">Submit Application</button></a>
			</c:if>
			
				<hr>
				<c:if test= "${additionalFieldValues != null}">
				<a href = "student.html"><button type="button" class="btn btn-info"  name="function" value = "done">Save & Continue Later</button></a>
					<a href = "SubmitApplication.html"><button type="button" class="btn btn-success"  name="function" value = "done">Submit Application</button></a>
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
