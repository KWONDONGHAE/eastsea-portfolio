<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/">게시판</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

		</ul>
		<!-- 로그인 버튼 -->
		<sec:authorize access="isAnonymous()">
			<c:url var="loginUrl" value="/login" />
			<ul class="nav navbar-nav navbar-right">
				<li><button type="button" class="btn btn-light"  onclick="location.href='${ loginUrl }' ">LogIn</button></li>
			</ul>
		</sec:authorize>
		<!-- 로그아웃 버튼 -->
		<table>
			<sec:authorize access="isAuthenticated()">
				<c:set var="messageForLoginedUser" value="님 환영합니다." />
				<c:out
					value="${pageContext.request.userPrincipal.name}${messageForLoginedUser }" />
				<c:url var="logoutUrl" value="/logout" />
				<form action="${logoutUrl}" method="post"
					class="navbar-form navbar-right">
					<button type="submit" class="btn btn-default">로그아웃</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</sec:authorize>
		</table>
	</div>
</nav>
