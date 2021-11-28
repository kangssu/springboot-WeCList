<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!-- 작품/클래스 리스트 -->
<div class="mypage__story">
	<h2>작품/클래스 관리</h2>
	<ul class="tab__manu">
		<li class="on"><a href="/mypage/shop/list">작품 관리</a></li>
		<li><a href="/mypage/class/list">클래스 관리</a></li>
	</ul>
	<div class="mypage__story__list">
		<table class="story__table">
			<tr>
				<th>No</th>
				<th>썸네일</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정/삭제</th>
			</tr>
				<tr>
					<td align="center">1</td>
					<td><img src="/photo/${sdto.thumbnail_file}"></td>
					<td><a href="#">제목이다!</a></td>
					<td>2021-11-28</td>
					<td>
						<button type="button" class="story_mod_btn" 
						onclick="">수정</button>
						<button type="button" class="story_del_btn">삭제</button>
					</td>
				</tr>
		</table>
		<div class="story__insert__bottom">
			<button type="submit" onclick="">등록하기</button>
		</div>
		
		<!-- 페이징 여기다가 아래 코드 지우고 넣기! class 동일하게줘야 css 먹음!!! -->
		<div class="product__pagination">
			<c:if test="${startPage>1}">
				<a href="list?currentPage=${startPage-1}">이전</a>
			</c:if>

			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<li class="select"><a class="select2" href="list?currentPage=${pp}">${pp}</a></li>
				</c:if>
				<c:if test="${currentPage!=pp}">
					<li class="active"><a href="list?currentPage=${pp}">${pp}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a href="list?currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
	</div>
</div>