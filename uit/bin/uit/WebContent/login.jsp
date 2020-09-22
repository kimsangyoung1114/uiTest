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
		<label for="uiId">아이디</label> <input type="email" class="form-control"
			id="uiId" placeholder='아이디는 영문 또는 숫자로 4글자 이상입니다.' autofocus> 
			
	</div>
	<div class="form-group">
		<label for="uiPassword">비밀번호</label> <input type="password"
			class="form-control" id="uiPassword"
			placeholder='비밀번호는 영문 또는 숫자로  4글자 이상입니다.'>
	</div>
	<button type="button" class="btn btn-primary" onclick="doLogin()">로그인</button>
	<a href="/signup.jsp"><button type="submit" class="btn btn-primary">회원가입</button></a>

</body>
<script>

	function doLogin() {

		if ($('#uiId').val().trim().length == 0) {

			alert('아이디를 입력해 주세요.');
			$('#uiId').focus();
			return;
		}

		if ($('#uiPassword').val().trim().length == 0) {

			alert('비밀번호를 입력해 주세요.');
			$('#uiPassword').focus();
			return;
		}

		var params = {
			uiId : $('#uiId').val(),
			uiPassword : $('#uiPassword').val()

		}
		params.cmd = "login";
		$.ajax({

			url : 'ajax/user',
			method : 'POST',
			data : JSON.stringify(params),
			contentType : 'application/json',
			success : function(res) {

				if (res.result != null) {

					alert('로그인 완료');
					location.href = '/';

				}
				else if($('#uiId').val().trim().length < 4) {

					alert('아이디는 4글자  이상 입력해 주세요');

				}
				else if($('#uiPassword').val().trim().length < 4) {

					alert('비밀번호는 4글자 이상 입력해 주세요');

				} else {

					alert('아이디와 비밀번호를 확인해 주세요.');
				}

			}

		});

	}
</script>
</html>