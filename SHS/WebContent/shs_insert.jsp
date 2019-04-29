<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생등록</title>
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
			text-align: right;
		}
		.div_input {
			padding: 3px 20px;
		}
		.div_input > label {
			float: left;
			line-height: 40px;
		}
		.shs_input {
			width: 270px;
			display: inline-block;
			height: 40px;
			font-size: 16px;
			color: #515151;
			outline: none;
			border: 1px solid #aaa;
			padding: 0 10px;
		}
		.btn_wrap {
			display: flex;
			padding: 15px 0;
			justify-content: space-evenly;
		}
		.err_msg {
			color: tomato;
			font-size: 14px;
			display: none;
			text-align: left;
			padding-left: 80px;
		}
	</style>
</head>
<body>
	<div class="content">
		<a href="index.jsp">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자과정 2기
			</div>
		</a>
		<div class="shs_manager"> - 학사등록 - </div>
		<form action="SHSInsert" id="frm_insert" name="frm_insert" method="POST">
			<div class="in_content">
				<div class="div_input">
					<label for="input_name">이름: </label>
					<input type="text" id="input_name" name="input_name" class="shs_input" placeholder="이름"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_age">나이: </label>
					<input type="text" id="input_age" name="input_age" class="shs_input" placeholder="나이"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_major">전공: </label>
					<input type="text" id="input_major" name="input_major" class="shs_input" placeholder="전공"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_phone">핸드폰번호: </label>
					<input type="text" id="input_phone" name="input_phone" class="shs_input" placeholder="핸드폰번호"><br>
					<span class="err_msg"></span>
				</div>
			</div>
			<div class="div_index btn_wrap">
				<a href="index" class="btn_index btn3">취소</a>
				<a href="#" class="btn_index btn1 submitBtn">등록</a>
			</div>
		</form>		
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<script type="text/javascript">
		$(function(){
			// input태그 focus() : border 효과
			$('.shs_input').focus(function(){
				$(this).css('border', '1px solid dodgerblue');
			});
			$('.shs_input').blur(function(){
				$(this).css('border', '1px solid #aaa');
			});
			
			// keyup()을 활용한 유효성 체크(input 값)
			$('#input_name').keyup(function(){
				nameCheck();
			});
			$('#input_age').keyup(function(){
				ageCheck();
			});
			$('#input_major').keyup(function(){
				majorCheck();
			});
			$('#input_phone').keyup(function(){
				phoneCheck();
			});
			
			// 등록버튼 클릭시 form 태그 안에 있는 input 태그의 값을 Servlet으로 전송
			$('.submitBtn').click(function(){
				
				if(!nameCheck()) {
					$('#input_name').focus();
					return false;
				}
				
				if(!ageCheck()) {
					$('#input_age').focus();
					return false;
				}
				
				if(!majorCheck()) {
					$('#input_major').focus();
					return false;
				}
				
				if(!phoneCheck()) {
					$('#input_phone').focus();
					return false;
				}
				
				// 유효성 체크 완료
				// 유효한 값만 존재
				
				// form 태그의 action 주소로 method방식을 통하여 데이터를 전송
				// Action: SHSInsert(Servlet)
				// Method: POST 방식
				$('#frm_insert').submit();
				
				
			});
		});
		
	</script>
</body>
</html>