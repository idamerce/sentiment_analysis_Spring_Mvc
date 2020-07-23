<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1" isELIgnored ="false"%>  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <%@ page import="jee.TweetWithSentiment" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="jee.tweets_twetssenti_analyserCore.*" %>
 <%@ page import="twitter4j.User" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
 
<body> 
<h1> status of: ${user_name} </h1>
 
<table class="table">
<tr>
 	<th>id</th>  
 	<th>Post</th>   
 	<th>Created At</th> 	
 	<th>Action</th>   
</tr>
<c:forEach var="statu" items="${status}">
		 <tr>
			<td>  <c:out value="${statu.getId()}"/>  </td> 
			<td>  <c:out value="${statu.getText()}"/>  </td>
			<td>  <c:out value="${statu.getCreatedAt()}"/>  </td>
			<td>  
				 <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".this${statu.getId()}">Analyse</button>
				
				<div class="modal fade this${statu.getId()}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-sm"> 
				    <div class="modal-content"> 
				        <div class="modal-header" style="display:inline-block">
							 <h3 class="modal-title" id="exampleModalLabel">Analyse Result</h3> 
						</div>
						<div class="modal-body">
 							 <c:set var="statu" value="${statu.getText()}" scope="page" /> 
							 			    <%
				 			 					 SentimentAnalyzer sentimentAnalyzer = new SentimentAnalyzer();  
							 					 String statu = (String) pageContext.getAttribute("statu");  
							 					// System.out.println(statu); 
							 					 TweetWithSentiment  tweetsentiment  = sentimentAnalyzer.findSentiment(statu) ;  
							 		    		 try{   
								 		    		  String sentiment = tweetsentiment.getCssClass()+"";  
								 		    		   if(sentiment.equals("Positive") || sentiment.equals("Very Positive") ){
								 		    		   %> <h4 style="color:green;">  
								 		    		   <%} else { %> <h3 style="color:red;">  <%} %>
								 		    		   This tweet is : <%=sentiment%>  </h4>  
						
							 		    		   <% }catch(Exception e) {  %>   
													<%-- <%=e.getMessage()%> <%="---> statu"+statu %> 	<%="-->senti "+ tweetsentiment.getLine()%>	--%>			 		    				
							 		    			<h4 style="color:red">This tweet does not have a sens</h4> 
							 		         <%}%>
							 		         
				 			 	      </div>
						 <!-- <div class="modal-footer">
								        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				 		 </div>  -->
					</div>
				  </div>
				</div>    
		   </td> 
</tr>
</c:forEach>
</table> 
 

 
  
 
 
 
 
 
</body>
</html>