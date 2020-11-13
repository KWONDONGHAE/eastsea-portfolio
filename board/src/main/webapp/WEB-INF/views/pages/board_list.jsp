<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판 목록</title>
<link rel="stylesheet"
	href="webjars/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style>
.my {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
}

.flex {
	display: flex;
	justity-content: flex-end;
}

select {
	float: right;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h3>게시판 목록</h3>
		<table class="table table-hover">
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td>사진</td>
				<td>작성자</td>
				<td>작성일자</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach var="board" items="${boardList}">
				<tr align="center">
					<td><c:url value="board_details" var="url">
							<c:param name="id" value="${board.id}" />
						</c:url> <c:out value="${board.id}" /></td>
					<td><c:url value="board_details" var="url">
							<c:param name="id" value="${board.id}" />
						</c:url> <a href="${url}"> <c:out value="${board.title}" />
					</a></td>
					<td>
					<c:if test="${fn:startsWith(board.content_type, 'image')}">
							<c:url value="board_details" var="url">
								<c:param name="id" value="${board.id}" />
							</c:url>
							<a href="${url}"> <c:url value="get_image" var="image_url">
									<c:param name="id" value="${board.id}" />
								</c:url> <img src="<c:url value='${image_url}' />" width="40px"
								height="40px" />
							</a>
						</c:if>		 
					 </td>
					<td><c:out value="${board.author}" /></td>
					<td><c:out value="${board.created_date}" /></td>
					<td><c:url value="board_edit" var="url">
							<c:param name="id" value="${board.id}" />
						</c:url> <a href="${url}">
							<button class="my">수정</button>
					</a> &nbsp; <c:url value="board_delete" var="url">
							<c:param name="id" value="${board.id}" />
						</c:url> <a href="${url}">
							<button class="my">삭제</button>
					</a></td>
				</tr>
			</c:forEach>
		</table>

		<form>
			<select name="displayItems" onchange="this.form.submit()">
				<option>페이지 표시할 메세지 수</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>
		</form>

		<!--  페이징 -->
		<div align="center">
			<c:set var="pageCounts" value="${pageCounts}" />
			<c:set var="currentPage" value="${currentPage}" />
			

			<span> <c:url value="/board_list" var="url_first">
					<c:param name="displayItems" value="${displayItems}" />
					<c:param name="gubun" value="first" />
					<c:param name="pageCounts" value="${pageCounts}" />
					<c:param name="currentPage" value="${currentPage}" />
				</c:url> <a href="${url_first}" class="btn btn-outline-secondary">처음</a>
			</span> <span> <c:url value="/board_list" var="url_previous">
					<c:param name="displayItems" value="${displayItems}" />
					<c:param name="gubun" value="previous" />
					<c:param name="pageCounts" value="${pageCounts}" />
					<c:param name="currentPage" value="${currentPage}" />
				</c:url> <a href="${url_previous}" class="btn btn-outline-secondary">이전</a>
			</span> <span class="badge badge-secondary"> ${currentPage+1} /
				${pageCounts} </span> <span> <c:url value="/board_list"
					var="url_next">
					<c:param name="displayItems" value="${displayItems}" />
					<c:param name="gubun" value="next" />
					<c:param name="pageCounts" value="${pageCounts}" />
					<c:param name="currentPage" value="${currentPage}" />
				</c:url> <a href="${url_next}" class="btn btn-outline-secondary">다음</a>
			</span> <span> <c:url value="/board_list" var="url_last">
					<c:param name="displayItems" value="${displayItems}" />
					<c:param name="gubun" value="last" />
					<c:param name="pageCounts" value="${pageCounts}" />
					<c:param name="currentPage" value="${currentPage}" />
				</c:url> <a href="${url_last}" class="btn btn-outline-secondary">마지막</a>
			</span>
		</div>
		
	</div>
	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
