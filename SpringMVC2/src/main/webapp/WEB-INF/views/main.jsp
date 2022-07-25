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
 	<script type="text/javascript">
	 	$(document).ready(function(){
	 		loadList();
	 	});
	 	function loadList(){ 
	 		//서버와 통신 : 게시판 리스트 가져오기
	 		$.ajax({
	 			url:"boardList",
	 			type:"get",
	 			dataType:"json",
	 			success:makeView,  //콜백함수
	 			error: function(){ alert("error");  }
	 		});
	 	}
	 	function makeView(data){
	 		var listHtml="<table class='table table-boardered'>";
	 		listHtml+="<tr>";
	 		listHtml+="<td>번호</td>";
	 		listHtml+="<td>제목</td>";
	 		listHtml+="<td>작성자</td>";
	 		listHtml+="<td>작성일</td>";
	 		listHtml+="<td>조회수</td>";
	 		listHtml+="</tr>";
	 		$.each(data, function(index,obj){
	 			listHtml+="<tr>";
		 		listHtml+="<td>"+obj.idx+"</td>";
		 		listHtml+="<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
		 		listHtml+="<td>"+obj.writer+"</td>";
		 		listHtml+="<td>"+obj.indate.split(' ')[0]+"</td>";
		 		listHtml+="<td id='cnt"+obj.idx+"'>"+obj.count+"</td>";
		 		listHtml+="</tr>";
		 		
		 		
		 		listHtml+="<tr id='c"+obj.idx+"' style='display:none'>";
		 		listHtml+="<td>내용</td>";
		 		listHtml+="<td colspan='4'>";
		 		listHtml+="<textarea id='ta"+obj.idx+"' readonly rows='7' class='form-control'>"+obj.content+"</textarea>";
		 		listHtml+="</br>";
		 		listHtml+="<span id='updateBtn"+obj.idx+"'><button onclick='goUpdateForm("+obj.idx+")'>수정</button></span>&nbsp;";
		 		listHtml+="<button onclick='goDelete("+obj.idx+")'>삭제</button>";
		 		listHtml+="</td>";
		 		listHtml+="</tr>";
		 		
		 		
	 		})
	 		listHtml+="<tr>";
	 		listHtml+="<td colspan='5'>";
	 		listHtml+="<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
	 		listHtml+="</td>";
	 		listHtml+="</tr>";
	 		listHtml+="</table>";
	 		$("#view").html(listHtml);
	 		$("#view").css("display","block");
	 		$("#wrform").css("display","none");
	 	}
	 	function goForm(){
	 		$("#view").css("display","none");
	 		$("#wrform").css("display","block");
	 	}
	 	function goList(){
	 		$("#view").css("display","block");
	 		$("#wrform").css("display","none");
	 	}
	 	function goInsert(){
	 		//var title=$("#title").val();
	 		//var content=$("#content").val();
	 		//var writer=$("#writer").val();
	 		
	 		var formData=$("#frm").serialize();//직렬화
	 		
	 		$.ajax({
	 			url:"boardInsert",
	 			type:"post",
	 			data:formData,
	 			success: loadList,
	 			error : function() { alert('error'); } 
	 		});
	 		//초기화
	 		$("#clear").trigger("click")
	 	}
	 	function goContent(idx){
	 		if($("#c"+idx).css("display")=="none"){
	 			$("#c"+idx).css("display","table-row");
	 			$("#ta"+idx).attr("readonly",true)
				
	 			$.ajax({
	 			url:"boardContent",
	 			type:"get",
	 			data:{"idx":idx},
	 			success: function(data){
	 				$("#ta"+idx).val(data.content);
	 			},
	 			error: function(){ alert("error");}
	 			});
	 			
	 		}else{
	 			$("#c"+idx).css("display","none");
	 			$.ajax({
		 			url:"boardCnt",
		 			type:"get",
		 			data:{"idx":idx},
		 			dataTyep:"json",
		 			success: function(data){
		 				$("#cnt"+idx).text(data.count);
		 			},
		 			error: function(){ alert("error");}
		 			});
	 		}
	 	}
	 	function goDelete(idx){
	 		$.ajax({
	 			url : "boardDelete", // board/idx
	 			type : "get",
	 			data : {"idx":idx},
	 			success : loadList,
	 			error : function(){ alert("error");}
	 		});
	 	}
	 	
	 	function goUpdateForm(idx){
	 		$("#ta"+idx).attr("readonly",false);
	 		var title=$("#t"+idx).text();
	 		var newInput="<input type='text' id='newTitle"+obj.idx+"'cclass='form-control' value=':"+title+"'/>";
	 		$("#t"+idx).html(newInput);
	 		
	 		var newButton="<button onclick='goUpdate("+obj.idx+")'>등록</button>";
	 		$("#updateBtn"+idx).html(newButton);
	 	}
	 	
		function goUpdate(idx){
	 		var title = $("#newTitle"+idx).val();
	 		var content =$("#ta"+idx).val();
	 		$.ajax({
	 			url:"boardUpdate",
	 			type:"post",
	 			data:{"idx":idx, "title": title, "content":content},
	 			success: loadList,
	 			error:function(){alert("error");}
	 		});
	 	}
	 	
		
	 
	 	
	 	
	 	
 	</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <h2>제목</h2>
	  <div class="panel panel-default">
	  	<div class="panel-heading">BOARD</div>
	    <div class="panel-body" id="view">바디</div>
	    <div class="panel-body" id="wrform" style="display: none">글쓰기
	       <form id="frm">
	    	<table class="table" >
	    		<tr>
	    			<td>제목</td>
	    			<td><input type="text"  id="title" name="title" class="form-control"/></td>
	    		</tr>
	    		<tr>
	    			<td>작성자</td>
	    			<td><input type="text" id="writer" name="writer" class="form-control"/></td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td><textarea row="7" id="content" name="content" class="form-control"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center">
	    				<button type="button" onclick="goInsert()" class="btn btn-success btn-sm">등록</button>
	    				<button type="reset" id="clear" class=" btn btn-cancle btn-sm">취소</button>
	    				<button type="button" onclick="goList()" class=" btn btn-cancle btn-sm">목록</button>
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