<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판 세부 내용</title>

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
	<div class="center">
		<table width="300px" class="table table-hover">
			<tr>
				<td align="center">제목</td>
				<td><c:out value="${board.title}" /></td>
			</tr>
			<tr>
				<td align="center">메시지 내용</td>
				<td><pre><c:out value="${board.message}" /></pre></td>
			</tr>
			<tr align="center">
				<td>사진</td>
				<td><c:url value="get_image" var="url">
						<c:param name="id" value="${board.id}" />
					</c:url> <img class="img-thumbnail" src="<c:url value='${url}' />" /></td>
			</tr>
			<tr>
				<td align="center">작성자</td>
				<td><c:out value="${board.author}" /></td>
			</tr>
			<tr>
				<td align="center">직성일자</td>
				<td><c:out value="${board.created_date}" /></td>
			</tr>
		</table>
	</div>


	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
