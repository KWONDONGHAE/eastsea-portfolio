<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<head>

<link
	href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap"
	rel="stylesheet">
<style>
.font {
	font-family: 'Staatliches', cursive;
}
</style>
</head>
<div class="font">

	<h2>게시판</h2>
	<ul>
		<li>스프링을 이용한 게시판</li>
		<li>springframework</li>
		<li>tiles</li>
		<li>grid</li>
		<li>java</li>
		<li>mysql</li>
		<li>ID : eastsea@naver.com</li>
		<li>Password : 134679</li>
	</ul>
	<sec:authorize access="isAnonymous()">
		<c:url var="loginUrl" value="/login" />
		<ul class="nav navbar-nav navbar-right">
			<li><button type="button" class="btn btn-light"
					onclick="location.href='${ loginUrl }' ">LogIn</button></li>
		</ul>
	</sec:authorize>
	<!-- 로그아웃 버튼 -->
	<table>
		<sec:authorize access="isAuthenticated()">
			<c:set var="messageForLoginedUser" value="님 환영합니다." />
			<c:out
				value="${pageContext.request.userPrincipal.name}${messageForLoginedUser }" />
		</sec:authorize>
	</table>
</div>