<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<nav>
	<div align="center">
		<a href="${pageContext.request.contextPath}/"> <img
			src="<c:url value='/resources/static/img/spring.png' />" />
		</a>
	</div>
	<ul id="menu">
		<li><button type="button" class="btn btn-light"  onclick="location.href='${pageContext.request.contextPath}/' ">Home</button></li>
		<li><button type="button" class="btn btn-light"  onclick="location.href='${pageContext.request.contextPath}/board_list' ">게시글 목록</button></li>
		<li><button type="button" class="btn btn-light"  onclick="location.href='${pageContext.request.contextPath}/board_add' ">게시글 작성</button></li>
	</ul>
</nav>


