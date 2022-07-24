<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar","\n"); %>    
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
	    	<table class="table">
	    		<tr>
	    			<td>제목</td>
	    			<td>${dto.title}</td>
	    		</tr>
	    		<tr>
	    			<td>작성자</td>
	    			<td>${dto.writer}</td>
	    		</tr>
	    		<tr>
	    			<td>작성일</td>
	    			<td>${fn:split(dto.indate, " ")[0]} </td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td>${fn:replace(dto.content,newLineChar,"<br/>")} </td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan="2" align="center">
	    				<a href="boardUpdateForm/${dto.idx}" class="btn btn-success btn-sm">수정</a>
	    				<a href="boardDelete/${dto.idx}" class=" btn btn-info btn-sm">삭제</a>
	    				<button type="button" class=" btn btn-cancle btn-sm" onclick="location.href='boardList'">목록</button>
	    			</td>
	    		</tr>
	    	</table>
	       </div>
	    <div class="panel-footer">푸터</div>
	  </div>
	</div>
</body>
</html>