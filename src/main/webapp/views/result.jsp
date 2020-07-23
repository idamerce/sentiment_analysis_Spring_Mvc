<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1" isELIgnored ="false"%>  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
 
 
<h1>Youi searched for : ${search} </h1>
 
<table class="table">
<tr>
 	<th>Name</th>  
 	<th>image</th>  
 	<th>Status</th>  
 	<th>Location</th>  
 	<th>ID</th>  
  	<th>Action</th>  
</tr>
<c:forEach var="user" items="${users}">
		 <tr>
			<td> <c:out value="${user.getName()}"/>  					</td>
			<td> <img src="${user.getOriginalProfileImageURL()}" style="width:30px;height:30px"/>  	</td>
			<td> <c:out value="${user.getStatusesCount()}"/>  			</td>
			<td> <c:out value="${user.getLocation()}"/>  				</td>
			<td> <c:out value="${user.getId()}"/>  						</td>
			<td> 
				
				 <!-- Button trigger modal -->
			 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exe${user.getId()}">  Surf </button> 
			 <form action="/getstatus">
				<!-- Modal -->
				<div class="modal fade" id="exe${user.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">select</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div> 
				      <div class="modal-body"> 
			 					<div class="form-group col-md-2">
			 				      	 <input t name="min_tweets" type="number" value="1" class="form-control" >
							    </div>
							    <div class="form-group col-md-2">
			 				      	 <input  name="max_tweets" type="number" value="${user.getStatusesCount()}"  class="form-control" >
							    </div>
							    <input type="hidden" name="user_name" value="${user.getName()}"/> 
							    <input type="hidden" name="user_id" value="${user.getId()}"/>  
			 	      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button class="btn btn-primary">get posts</button>
				      </div>
				    </div> 
				  </div>
				</div> 
			   </form>
			</td> 
 		</tr>
</c:forEach>
</table> 
 
 
 
 
  
 
 
</body>
</html>