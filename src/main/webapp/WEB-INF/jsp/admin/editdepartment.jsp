<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
  <title>Edit Department</title>
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
    </ul>
   
  </div>
</nav> 
    <div class="panel panel-default">
      <div class="panel-heading">
		<ul class="breadcrumb">
		  <li><a href="../admin.html">Home</a> <span class="divider"></span></li>
		  <li class="active">Edit Department</li>
		 </ul>
	  </div>
     
       <div class="panel-body">
      	<div class="panel panel-primary">
     		<div class="panel-heading">Department</div>
      		<div class="panel-body">
      			<form role="form"  class="form-inline" action = "../updatedepartment.html" method = "post">
			      	<div class="form-group">
					    <label for="text"  class="control-label col-sm-2"> Name</label>
					    <div class="col-sm-3"> 
						 	<input type = "hidden" name = "departmentID" value ="${department.id}"/>
						 	<input type="text" class="form-control" id="name" name = "departmentName" value = "${department.name }" required>
						 </div>
					 </div>
						  <div class="form-group">        
				     		<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-danger" name = "function" value = "department">Update Department</button>
						  </div>
						 </div>
						 <a href = "../deletedepartment/${department.id}.html"><button type="button" class="btn btn-default">Delete Complete Department</button></a>
				</form>
      		</div>
   		</div>
      	
      	<div class="panel panel-primary">
     		<div class="panel-heading">Programs</div>
	      <div class="panel-body">
	      <c:forEach items="${programs}" var="program">      
	      	<form role="form"  class="form-inline" action = "../updateprogram.html" method = "post">	
	      		<input type = "hidden" name = "departmentID" value ="${department.id}"/>
      			<input type = "hidden" name = "programID" value ="${program.id }"/>
		      	<div class="form-group">
				    <label for="text"  class="control-label col-sm-2">Name</label>
				    <div class="col-sm-3">
				  	  <input type="text" class="form-control" value ="${program.programName}" id="name" name = "programName" required>
				  	 </div>
				  </div>
				  <div class="form-group">        
		     		<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-danger" name = "function" value = "program">Update Program</button>
				  </div>
				</div>
				 <a href = "../deleteprogram.html?id=${program.id}&dID=${department.id}"><button type="button" class="btn btn-default">Delete Program</button></a>
			 </form>
			</c:forEach>
			<form role="form"  class="form-inline" action = "../addprogram.html" method = "post">	
      			<input type = "hidden" name = "departmentID" value ="${department.id}"/>
		      	<div class="form-group">
				    <label for="text"  class="control-label col-sm-2">Name</label>
				    <div class="col-sm-3">
				  	  <input type="text" class="form-control" id="name" name = "programName" required>
				  	 </div>
				  </div>
				  <div class="form-group">        
		     		<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default" name = "function" value = "program">Add New Program</button>
				  </div>
				</div>
			 </form>	
	      </div>
	    </div>
      	
      	<div class="panel panel-primary">
     		<div class="panel-heading">Additional Fields</div>
	      <div class="panel-body">
	      
    	<c:forEach items="${fields}" var="fields">
	      	<form role="form"  class="form-inline" action = "../updatefield.html" method = "post">
	      			<input type = "hidden" name = "departmentID" value ="${department.id}"/>
	      				<input type = "hidden" name = "fieldID" value ="${fields.id }"/>
	      		
			      	<div class="form-group">
					    <label for="text"  class="control-label col-sm-2">Name</label>
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" value = "${fields.nameOfField}" id="fieldname" name = "fieldname" required>
					  	 </div>
					  </div>
					  <div class="form-group">
						  <label for="sel1">Field Type</label>
						  <select class="form-control" id="fieldtype" name = "fieldtype">
						    <option value = "text" <c:if test = "${fields.fieldType eq 'text' }"><c:out value="selected"></c:out></c:if>>TEXT</option>
						    <option value = "file" <c:if test = "${fields.fieldType eq 'file' }"><c:out value="selected"></c:out></c:if>>FILE</option>
						    <option value ="number" <c:if test = "${fields.fieldType eq 'number' }"><c:out value="selected"></c:out></c:if>>NUMBER</option>
						  </select>
					  </div>
					  <label class="radio-inline"><input type="radio" value = "required" name="required"<c:if test = "${fields.requiredOrOptional eq 'required' }"><c:out value="checked"></c:out></c:if>>Required</label>
					  <label class="radio-inline"><input type="radio" value = "optional" name="required"<c:if test = "${fields.requiredOrOptional eq 'optional' }"><c:out value="checked"></c:out></c:if>>Optional</label>
					
					  <div class="form-group">        
			     		<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-danger"  name="function" value = "additionalField">Update Field</button>
					  </div>
				</div>
				<a href = "../deletefield.html?id=${fields.id}&dID=${department.id}"><button type="button" class="btn btn-default">Delete Field</button></a>
				</form>
			</c:forEach>
			<form role="form"  class="form-inline" action = "../addfields.html" method = "post">
	      		
	      			<input type = "hidden" name = "departmentID" value ="${department.id}"/>
	      		
			      	<div class="form-group">
					    <label for="text"  class="control-label col-sm-2">Name</label>
					    <div class="col-sm-3">
					  	  <input type="text" class="form-control" id="fieldname" name = "fieldname" required>
					  	 </div>
					  </div>
					  <div class="form-group">
						  <label for="sel1">Field Type</label>
						  <select class="form-control" id="fieldtype" name = "fieldtype">
						    <option value = "text">TEXT</option>
						    <option value = "file">FILE</option>
						    <option value ="number">NUMBER</option>
						  </select>
					  </div>
					  <label class="radio-inline"><input type="radio" value = "required" name="required" checked>Required</label>
					  <label class="radio-inline"><input type="radio" value = "optional" name="required">Optional</label>
					  <div class="form-group">        
			     		<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default"  name="function" value = "additionalField">Add New Field</button>
					  </div>
				</div>
				</form>
	      </div>
	    </div>
	    <a href = "../listdepartment.html"><button type="button" class="btn btn-danger"  name="function" value = "done">All Done !</button></a>
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
