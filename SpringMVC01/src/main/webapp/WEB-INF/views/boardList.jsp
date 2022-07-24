<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<table class="table table-bordered table-hover">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>조회수</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			 
	    	<c:forEach var="dto" items="${list}">
	    		<tr>
	    			<td>${dto.idx}</td>
					<td><a href="boardContent?idx=${dto.idx}">${dto.title}</a></td>
					<td>${dto.count}</td>
					<td>${dto.writer}</td>
					<td>${fn:split(dto.indate," ")[0]}</td>
				</tr>
			</c:forEach>
			</table>
			<a href="boardForm " class="btn btn-primary btn-sm">글쓰기</a>
	    </div>
	    <div class="panel-footer">푸터</div>
	  </div>
	</div>
</body>
</html>