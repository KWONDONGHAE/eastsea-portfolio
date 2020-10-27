<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>로그인</title>
<style>

body {
	width: 500px;
	align: center;

.container {
	display: flex;
	width: 100vw;
	height: 100vh;
	align-items: center;
}

.item1 {
	flex: 1;
}

.item2 {
	flex: 4;
}

.item3 {
	flex: 1;

}
</style>
</head>
<body>
	<h3>로그인</h3>
	<div class="form-group">
		<form action="<c:url value='/user/login' />" method="post">
			<div class="form-group form-group-lg">
				<div class="form-group">
					<label>사용자명</label> <input type="text" name="email"
						class="form-control" placeholder="이메일">
				</div>
				<div class="form-group">
					<label>비밀번호</label> <input type="password" name="password"
						class="form-control" placeholder="비밀번호">
				</div>
				<div class="form-group">
					<input type="hidden" name="${ _csrf.parameterName }"
						value="${ _csrf.token }">
				</div>
				<div class="form-action">
					<input type="submit" class="btn btn-primary btn-lg" value="로그인">
				</div>
			</div>
		</form>
	<div class="container">
		<div class="item1"></div>
		<div class="item2">
			<h3 align="center">로그인</h3>
			<div class="form-group">
				<form action="<c:url value='/user/login' />" method="post">
					<div class="form-group form-group-lg">
						<div class="form-group">
							<label>사용자명</label> <input type="text" name="email"
								class="form-control" placeholder="이메일">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" name="password"
								class="form-control" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="hidden" name="${ _csrf.parameterName }"
								value="${ _csrf.token }">
						</div>
						<div class="form-action">
							<input type="submit" class="btn btn-primary btn-lg" value="로그인">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="item3"></div>
	</div>
</body>

