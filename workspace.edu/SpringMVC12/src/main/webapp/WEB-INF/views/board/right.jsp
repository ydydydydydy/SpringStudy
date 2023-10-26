<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 포맷팅 태그라이브러리 -->

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<div class="card" style="min-height: 500px; max-height: 1000px">
	<div class="card-body">
		<h4>BOOK SEARCH</h4>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="bookname" placeholder="Search">
			<div class="input-group-append">
				<button type="button" class="btn btn-secondary" id="search">GO</button>
			</div>
		</div>
		
		<div class="Loading-progress" style="display: none;">
			<!-- 책 정보 가져올 때 동안 보여줄 로딩창 -->
			<div class="spinner-border text-secondary" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		
		<div id="bookList" style="overflow: scroll; height: 500px; padding: 10px">
			여기에 검색된 책 목록을 출력하세요.
		</div>
	</div>
</div>