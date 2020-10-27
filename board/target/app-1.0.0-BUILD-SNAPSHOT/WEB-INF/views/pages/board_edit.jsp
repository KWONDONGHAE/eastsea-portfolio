<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판 세부 내용 수정</title>

<link rel="stylesheet"
	href="webjars/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.center {
	width: 600px;
	margin: 0 auto;
}
</style>
</head>
<body>
<body>
	<div class="center">
		<form action="/board_edit_process?id=${board.id}" method="post"
			enctype="multipart/form-data">
			<div class="center">
				<br /> <br />
				<h3>메시지 수정</h3>

				<div class="form-group">
					<label for="title">메시지 제목</label> <input type="text"
						class="form-control" id="title" name="title"
						aria-describedby="emailHelp" value="${board.title}" required></input>
					
					<small id="emailHelp" class="form-text text-muted">게시할 메시지
						제목을 입력하시오.</small>
				</div>
				<div class="form-group">
					<label for="message">메시지 내용</label>
					<textarea rows="10" cols="30" class="form-control" id="message" name="message" required>${board.message}</textarea>		
				</div>

				<div class="form-group">
					<label for="photo">사진 선택</label> <input type="file"
						class="form-control" id="photo" name="photo">
					<c:url value="get_image" var="url">
						<c:param name="id" value="${board.id}" />
					</c:url>
					<img class="img-thumbnail" src="<c:url value='${url}' />" />

				</div>

				<div class="form-group">
					<label for="author">작성자</label> <input type="text"
						class="form-control" id="author" name="author"
						placeholder="작성자 이름" value="${board.author}">
				</div>
				<hr />
				<button type="submit" class="btn btn-outline-secondary">수정</button>

			</div>
		</form>
	</div>
	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>


</html>
