<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출석부</title>
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Jua&subset=korean');
		* {
			font-family: 'Jua', sans-serif;
			box-sizing: border-box;
		}
		body, ul {
			margin: 0;
			padding: 0;
		}
		a {
			color: inherit;
			text-decoration: none;
		}
		ul {
			list-style: none;
		}
		.content {
			width: 390px;
			height: 600px;
			border: 2px solid black;
			margin: 50px auto 0;
			background-color: #eee;
			border-radius: 5px;
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
						0 2px 10px 0 rgba(0,0,0,0.12);
			position: relative;
		}
		.shs_title {
			padding-top: 50px;
			text-align: center;
			font-size: 30px;
			color: black;
		}
		.shs_manager {
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			color: #454552;
			font-size: 20px;
		}
		.btn_index {
			padding: 10px 12px;
			background-color: yellowgreen;
			color: white;
			width: 90px;
			display: inline-block;
			border-radius: 10px;
			font-size: 17px;
		}
		.btn_index:hover {
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
						0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.div_index {
			padding-bottom: 30px;
			text-align: center;
		}
		.btn2 {
			background-color: orange;
		}
		.btn3 {
			background-color: salmon;
		}
		.in_content {
			width: 330px;
			margin: 0 auto;
		}
		table {
			font-size: 20px;
			border-collapse: collapse;
			width: 330px;
			margin-bottom: 20px;
		}
		.table_title {
			background-color: yellowgreen;
			height: 25px;
			border: 0px;
		}
		.table_data {
			background-color: white;
			height: 25px;
			font-size: 17px;
		}
		.table_data:hover {
			background-color: lightyellow;
		}
		th {
			padding: 5px;
		}
		td {
			text-align: center;
			padding: 5px 0px;
		}
		tr {
			border-bottom: 1px dashed #bbbbbb; 
		}
		.uBtn {
			color: dodgerblue; 
		}
		.dBtn {
			color: tomato;
		}
		.modal_wrap {
			width: 390px;
			height: 600px;
			margin: 0 auto;
			border: 2px solid black;
			background-color: rgba(0,0,0,0.4);
			overflow: hidden;
			position: absolute;
			top: -2px;
			left: -2px;
			border-radius: 5px;
			padding: 20px;
			display: none;
		}
		.alert_wrap {
			width: 100%;
			color: #515151;
			background-color: white;
			text-align: center;
			padding: 25px 15px;
			border-radius: 5px;
			border: 2px solid black;
			margin-top: 200px;
		}
		.modal_text {
			display: block;
			font-size: 20px;
			text-align: center;
			margin-bottom: 10px;
		}
		.modal_btn {
			padding: 5px 25px;
			color: white;
			border-radius: 5px;
			font-size: 17px;
		}
		.modal_cBtn {
			background-color: orange;
		}
		.modal_dBtn {
			background-color: yellowgreen;
		}
		.name {
			color: dodgerblue;
		}
	</style>
</head>
<body>
	<div class="content">
		<div class="modal_wrap">
			<div class="alert_wrap">
				<span class="modal_text">
					 "<span class="name"></span>" 학생을 <br>
					 정말 삭제하시겠습니까?
				</span>
				<a href="#" class="modal_btn modal_cBtn">취소</a>
				<a href="#" class="modal_btn modal_dBtn">삭제</a>
			</div>
		</div>
		
		<div class="shs_title">
			<a href="index.jsp">
				JAVA기반 스마트하이브리드<br>
				개발자과정 2기
			</a>
		</div>
		<div class="shs_manager"> - 출석부 - </div>
		<div class="in_content">
		
		<!-- jstl & el (HTML에서 java코드를 효율적으로 사용하기 위한 코드)-->
		<!-- jstl : 제어문, 포맷팅 담당 -->
		<!-- el : 출력담당 -->
		
			<table>
				<tr class="table_title">
					<th>ID</th>
					<th>이름</th>
					<th>Tel.</th>
					<th colspan="2">관리</th>
				</tr>
				<c:if test="${shslist.size() == 0}">
					<tr class="table_data">
						<td colspan="5">등록된 학생이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${shslist}" var="mDto"> <!-- ${shslist} : el태그(출력담당) -->
					<tr class="table_data">
						<td class="sid">${mDto.sid}</td>
						<td class="sname">${mDto.sname}</td>
						<td>${mDto.sphone}</td>
						<td><a href="SHSUpdate?id=${mDto.sid}" class="uBtn">수정</a></td>
						<td><a href="#" class="dBtn">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="div_index">
			<a href="index" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var id, name;
			
			$('.dBtn').click(function(){
				id = $(this).closest('tr').find('.sid').text();
				name = $(this).closest('tr').find('.sname').text();
				$('.name').text(name);
				$('.modal_wrap').css('display', 'block');
				//alert(id + ", " + name);
			});
			
			$('.modal_cBtn').click(function(){
				$('.modal_wrap').css('display', 'none');
			});
			
			$('.modal_dBtn').click(function(){
				location.href="SHSDelete?id=" + id;
			});

		});
	</script>
</body>
</html>