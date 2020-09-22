<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="index.jsp" />


</head>
<body>
	<div class="form-group">
		<label for="uiId">아이디</label> <input type="text" class="form-control"
			id="uiId" aria-describedby="emailHelp">

	</div>
	<div class="form-group">
		<label for="uiPassword">비밀번호</label> <input type="password"
			class="form-control" id="uiPassword">
	</div>


	<div class="form-group">
		<label for="uiName">이름</label> <input type="text" class="form-control"
			id="uiName">
	</div>

	<div class="form-group">
		<label for="uiAge">나이</label> <input type="number"
			class="form-control" id="uiAge">
	</div>

	<div class="form-group">
		<label for="uiBirth">생년월일</label> <input type="date"
			class="form-control" id="uiBirth">
	</div>

	<div class="form-group">
		<label for="uiPhone">전화번호</label> <input type="number"
			class="form-control" id="uiPhone"> <small id="emailHelp"
			class="form-text text-muted">숫자만 입력해 주세요</small>
	</div>


	<div class="form-group">
		<label for="uiEmail">이메일</label> <input type="text"
			class="form-control" id="uiEmail">
	</div>


	<div class="form-group">
		<label for="uiNickname">닉네임</label> <input type="text"
			class="form-control" id="uiNickname">
	</div>


	<button type="button" class="btn btn-primary" onclick="dosignup()">회원가입</button>


	<script>
		function dosignup() {

			if ($('#uiId').val().trim().length == 0) {

				alert('아이디를 입력해 주세요');
				$('#uiId').focus();
				return;
			}

			if ($('#uiId').val().trim().length < 4) {

				alert('아이디는 4글자  이상 입력해 주세요');
				$('#uiId').focus();
				return;
			}

			if ($('#uiPassword').val().trim().length == 0) {

				alert('비밀번호를 입력해 주세요');
				$('#uiPassword').focus();
				return;
			}

			if ($('#uiPassword').val().trim().length < 4) {

				alert('비밀번호는 4글자 이상 입력해 주세요');
				$('#uiPassword').focus();
				return;
			}

			if ($('#uiName').val().trim().length == 0) {

				alert('이름을 입력해 주세요');
				$('#uiName').focus();
				return;
			}

			if ($('#uiName').val().trim().length < 2) {

				alert('이름을 2글자 이상 입력해 주세요');
				$('#uiName').focus();
				return;
			}

			if ($('#uiAge').val().trim().length == 0) {

				alert('나이를 입력해 주세요');
				$('#uiAge').focus();
				return;
			}

			if (isNaN($('#uiAge').val()) || $('#uiAge').val() < 2
					|| $('#uiAge').val() > 150) {
				alert('나이를 확인해 주세요');
				$('#uiAge').focus();
				return;
			}

			if ($('#uiBirth').val().trim().length == 0) {

				alert('생년월일을 입력해 주세요');
				$('#uiBirth').focus();
				return;
			}

			if ($('#uiPhone').val().trim().length > 11) {

				alert('전화번호가 너무 깁니다');
				$('#uiPhone').focus();
				return;
			}

			if ($('#uiNickname').val().trim().length == 0) {

				alert('닉네임을 입력해 주세요');
				$('#uiNickname').focus();
				return;
			}

			if ($('#uiNickname').val().trim().length < 2) {

				alert('닉네임을 2글자 이상 입력해 주세요');
				$('#uiNickName').focus();
				return;
			}

			var params = {

				uiId : $('#uiId').val(),
				uiPassword : $('#uiPassword').val(),
				uiName : $('#uiName').val(),
				uiAge : $('#uiAge').val(),
				uiBirth : $('#uiBirth').val(),
				uiPhone : $('#uiPhone').val(),
				uiEmail : $('#uiEmail').val(),
				uiNickname : $('#uiNickname').val(),
				cmd : "insert"

			}

			$.ajax({
				url : '/ajax/user',
				method : 'POST',
				data : JSON.stringify(params),
				contentType : 'application/json',
				success : function(res) {
					if (res.result == 1) {
						alert('회원가입이 완료되었습니다.');
						location.href = "/login.jsp";
					}

				},
				error : function(err) {

				}
			})

		}
	</script>


</body>
</html>