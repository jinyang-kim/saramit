<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<style>
.list {
	width: 80%;
	border: 1 solid#
}
</style>
<jsp:include page="/WEB-INF/views/layout/import.jsp"></jsp:include>

<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}
</script>
</head>

<body>
	<!-- Wrap -->
	<div id="wrap">
		<!-- Header -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
		<!-- //Header -->
		<!-- container -->
		<div id="container">
			<div style="height: 61px"></div>
			<!-- contents -->
			<div class="contents" style="margin:20px;"> 
				<div class="body_title" style="width: 100%; margin: 20px auto; font-size: 20px;">
					<h3>합격자소서 보기</h3>
				</div>
				<hr>
				<div class="t_center mt20 mb20">
					<form name="searchForm" action="<%=cp%>/pass_board/list.do"
						method="post">
						<select name="searchKey" class="searchField"
							style="width: 120px; height: 50px">
							<option value="companyName">회사명</option>
							<option value="field">지원분야</option>
						</select> <input type="text" name="searchValue" class="box_TF"
							style="width: 300px; height: 50px">
						<button type="button" class="btn" onclick="searchList()"
							style="height: 50px">검색</button>
					</form>
				</div>

				<div style="font-size: 10px;">
					<ul>
						<li style="text-align:left;width:50%">검색결과: ${dataCount}개(${page} / ${total_page} 페이지)</li>
						<li style="">&nbsp;</li>
					</ul>
				</div>
				<!-- 
                <div class="list">
                	<ul class="">
                		<li>번호</li>
                		<li>제목</li>
                		<li>회사명</li>
                		<li>지원분야</li>
                		<li>구분</li>
                	</ul>
                </div>
                 -->
				<table class="tb_basic" style="height:40px;width:80%">
					<tr align="center" height="35"
						style="border-bottom: 1px solid #cccccc;">
						<th width="50">번호</th>
						<th width="120">제목</th>
						<th width="100">회사이름</th>
						<th width="100">지원분야</th>
						<th width="70">구분</th>
						<th width="80">등록일</th>
						<th width="50">조회수</th>
					</tr>

<c:forEach var="dto" items="${list}">
					<tr align="center" height="35"
						style="border-bottom: 1px solid #cccccc;">
						<td>${dto.listNum}</td>
						<td>${dto.title}</td>
						<td>${dto.companyName}</td>
						<td>${dto.field}</td>
						<td>${dto.gubun}</td>
						<td>${dto.created}</td>
						<td>${dto.hitCount}</td>
					</tr>
</c:forEach>					
				</table>

				<table class="tb_basic" style="width:80%;height:40px;">
					<tr height="35">
						<td align="center"><c:if test="${dataCount==0 }">
			               	등록된 게시물이 없습니다.
			         		</c:if> <c:if test="${dataCount!=0 }">
			               		${paging}
			         		</c:if></td>
					</tr>
				</table>

				<div class="t_right" style="width:100px;height:40px">
					<button type="button" class="btn_classic btn-black"
						onclick="javascript:location.href='<%=cp%>/pass_board/created.do';">자소서 등록</button>
				</div>

				<!-- //contents -->
			</div>
			<!-- //container -->

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
			<!-- //Footer -->
		</div>
	</div>
	<!-- //Wrap -->
</body>
</html>