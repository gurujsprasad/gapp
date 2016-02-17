<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <title>GAPP Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.html">Graduate Application Program</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home.html">Home</a></li>
      <li><a href="users/registration.html">User Registration</a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>
  
 
    <div class="panel panel-default">
      <div class="panel-heading"> Login </div>
      <c:if test="${message != null && message != ''}">
       		<div class="alert alert-danger">
  				<c:out value="${message }"></c:out>
  				<c:set var="message" value="" scope="session"></c:set>
			</div>
       </c:if>
      <div class="panel-body">
      	<form role="form"  class="form-horizontal" action = "home.html" method = "post">
	      	<div class="form-group">
			    <!-- <label for="email"  class="control-label col-sm-2">Email address:</label> -->
			    <div class="col-sm-3">
			  	  <input type="text" placeholder="Email ID" class="form-control" id="email" name = "email" required>
			  	 </div>
			  </div>
			  <div class="form-group">
			    <!-- <label for="email"  class="control-label col-sm-2">Password:</label> -->
			    <div class="col-sm-3">
			  	   <input type="password"  placeholder="Password" class="form-control" id="password" name = "password" required>
			  	 </div>
			  </div>
			  <div class="form-group">        
	     		<div class="col-sm-offset-0.5 col-sm-10">
					<button type="submit" class="btn btn-danger">Login</button>
					<button type="reset" class="btn btn-danger">Clear</button>
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
