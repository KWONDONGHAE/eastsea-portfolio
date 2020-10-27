<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판 추가</title>
<style>
.center {
	width: 600px;
	margin: 0 auto;
}
</style>
<link rel="stylesheet"
	href="webjars/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<form:form action="/board_add_process" method="post" modelAttribute="boardform"
		enctype="multipart/form-data">
		<div class="center">
			<br />
			<br />
			<h3>메시지 추가</h3>
			<div class="form-group">
				<label for="title">메시지 제목</label> 
							<form:input type="text"
					class="form-control" path="title"
					aria-describedby="emailHelp"></form:input>
					<form:errors path="title"></form:errors>
					<small id="emailHelp"
					class="form-text text-muted">게시할 메시지 제목을 입력하시오.</small>
			</div>
			<div class="form-group">
				<label for="message">메시지 내용</label>
				<form:textarea rows="10" cols="30" class="form-control" path="message"></form:textarea>
				<form:errors path="message"></form:errors>		
			</div>		
			<div class="form-group">
				<label for="photo">사진 선택</label> <input type="file"
					class="form-control" id="photo" name="photo">
			</div>
			<hr />
			<button type="submit" class="btn btn-outline-secondary">저 장</button>

		</div>

	</form:form>

	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
