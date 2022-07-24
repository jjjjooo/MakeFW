<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- 부트스트랩 CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <!-- 부트스트랩 CDN -->
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <h2>제목</h2>
	  <div class="panel panel-default">
	  	<div class="panel-heading">BOARD</div>
	    <div class="panel-body">
	       <form action="boardInsert" method="post">
	    	<table class="table" >
	    		<tr>
	    			<td>제목</td>
	    			<td><input type="text" name="title" class="form-control"/></td>
	    		</tr>
	    		<tr>
	    			<td>작성자</td>
	    			<td><input type="text" name="writer" class="form-control"/></td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td><textarea row="7" name="content" class="form-control"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center">
	    				<button type="submit" class="btn btn-success btn-sm">등록</button>
	    				<button type="reset" class=" btn btn-cancle btn-sm">취소</button>
	    			</td>
	    		</tr>
	    	</table>
	       </form>
	       </div>
	    <div class="panel-footer">푸터</div>
	  </div>
	</div>
</body>
</html>