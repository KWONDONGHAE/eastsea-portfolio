<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
.container {
	display: flex;
	width: 100vw;
	height: 100vh;
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
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<div class="container">
	<div class="item1" align="left">
			<button type="button" class="btn btn-light"
				onclick="location.href='/board_list'">게시판목록으로</button>	
	</div>
	<div class="item2">
		<c:set var="gubun" value="${gubun}" />
		<div aria-live="polite" aria-atomic="true"
			style="position: relative; min-height: 200px;">
			<div class="toast"
				style="position: absolute; top: center; right: center;"
				data-delay="10000">
				<div class="toast-header">
					<strong class="mr-auto">수 정 사 항</strong>
					<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">
					게시글이
					<c:out value="${gubun}" />
					되었습니다.
				</div>
			</div>
		</div>
	</div>
</div>
<div class="item3"></div>
<script>
	$(document).ready(function() {
		$('.toast').toast('show');
	});
</script>

