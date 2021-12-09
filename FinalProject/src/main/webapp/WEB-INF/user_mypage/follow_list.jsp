<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="<%=request.getContextPath()%>" />
<script type="text/javascript">
	$(function(){
		loginok="${sessionScope.loginok}"; //로그인 여부
		from_id="${sessionScope.id}"; //로그인 아이디 가져옴
		//alert(loginok+","+myid); //확인됨
		
		//팔로우 이벤트!(추가)
		$(".m_btn_follow").click(function(){
			var to_id=$(this).attr("id");
			alert(id); //아이디 불러옴
			
			//로그인 한 이후에 팔로우 가능!
			if(loginok==""){
				alert("회원만 가능합니다!");
				location.href ="/users/login";
			}else{
				$.ajax({
					type:"post",
					dataType:"text",
					url:"/author/finsert",
					data:{"to_id":to_id,"from_id":from_id},
					success:function(data){
						alert("작가를 팔로우 하였습니다!");
						location.reload();
					}
				});
			}
		});
		
		//팔로잉 이벤트!(취소)
		$(".m_btn_following").click(function(){
			//var follow_cnt=$(this).val();
			//alert(follow_cnt); //숫자불러옴!
			var from_id="${sessionScope.id}";
			var to_id=$(this).attr("id");
			//alert(to_id);
			
			//팔로우!
			$.ajax({
				type:"post",
				dataType:"text",
				url:"/author/fdelete",
				data:{"from_id":from_id,"to_id":to_id},
				success:function(data){
					alert("작가 팔로우를 취소하였습니다!");
					location.reload();
				}
			});
		});
	});
</script>
<div class="mypage__choice">
	<h2>관심리스트</h2>
	<ul class="tab__manu">
		<li><a href="#">찜 내역</a></li>
		<li class="on"><a href="/mypage/class/list">팔로우하는 작가</a></li>
	</ul>
	<div class="my_choice_follow_count">
		<p><i class="fa fa-bell-o" aria-hidden="true"></i>팔로우한 작가는 총 <b>${FollowCount}</b>명 입니다.</p>
	</div>
	<div class="follow_all_list">
		<c:if test="${FollowCount==0}">
			<div class="follow_count_zero">
				<span>아직 팔로우한 작가가 없으신가요?<br>
				지금 바로 WeCList의 작가들을 만나보세요!</span><br>
				<button type="button" class="follow_page_change" onclick="location.href='/author/list'">작가 구경하러가기</button>
			</div>
		</c:if>
		<c:if test="${FollowCount>0}">
			<c:forEach var="fdto" items="${followTrue}" varStatus="status">
				<c:forEach var="adto" items="${list}">
					<c:if test="${fdto.to_id==adto.id}">
						<div class="follow_box_1">
							<img src="/img/pro.jpg" class="author_img_1">
							<h5>${adto.irum}</h5>
							<c:choose>
								<c:when test="${fn:contains(followTrue, dto.id)}">
									<button type="button" class="m_btn_following" id="${adto.id}">
										<i class="fa fa-check" aria-hidden="true"></i> 팔로잉
									</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="m_btn_follow" id="${adto.id}">
										<i class='fa fa-plus' aria-hidden='true'></i>
										팔로우
									</button>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:if>
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