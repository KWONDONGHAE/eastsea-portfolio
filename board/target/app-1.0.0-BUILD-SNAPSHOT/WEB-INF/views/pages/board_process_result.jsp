<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<c:set var="gubun" value="${gubun}" />
<div aria-live="polite" aria-atomic="true"
	style="position: relative; min-height: 200px;">
	<div class="toast" style="position: absolute; top: 0; right: 0;"
		data-delay="10000">
		<div class="toast-header">
			<img src="..." class="rounded mr-2" alt="..."> <strong
				class="mr-auto">Bootstrap</strong> <small>11 mins ago</small>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="toast-body">
			게시글이 <c:out value="${gubun}" /> 되었습니다.
		</div>
	</div>
</div>

<a href="/board_list">게시판 목록</a>

<script>
	$(document).ready(function() {
		$('.toast').toast('show');
	});
</script>

