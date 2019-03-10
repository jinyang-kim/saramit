<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/layout/import.jsp"></jsp:include>
    <script type="text/javascript">
    	function deleteBoard(boardNum) {
    		if(confirm("게시물을 삭제 하시겠습니까?")) {
    			var url = "<%=cp%>/board/delete.do?boardNum=" + boardNum + "&${query}";
    			location.href = url;
    		}
    	}
    </script>
</head>

<body>
    <!-- Wrap -->
    <div id="wrap" class="tb_wrap">
        <!-- Header -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
        <!-- //Header -->
        <!-- container -->
        <div id="container" class="tb_container">
            <!-- contents -->
            <div class="contents">
            	<div class="contents_header_bg board_list bottom">
            		<div class="bg_black"></div>
            	</div>
                <div class="inner">
                	<!-- pageTitle -->
                	<div class="pageTitle mt30 pb10">
                		<h3>자소서 피드백 - 상세</h3>
                	</div>
                	<!-- //pageTitle -->
                	<form name="feedback_form" method="post">
                		<div class="mt15 mb15">
	                		<table class="tb_kakao_row big">
	                			<colgroup>
	                				<col style="width:20%">
	                				<col style="width:30%">
	                				<col style="width:20%">
	                				<col style="width:30%">
	                			</colgroup>
	                			<tr>
	                				<th>제목</th>
	                				<td colspan="3">${dto.subject}</td>
	                			</tr>
	                			<tr>
	                				<th>작성자</th>
	                				<td>${dto.userName}</td>
	                				<th>이메일</th>
	                				<td>${dto.userEmail}</td>
	                			</tr>
	                			<tr>
	                				<th>작성일</th>
	                				<td>${dto.created}</td>
	                				<th>조회수</th>
	                				<td>${dto.hitCount}</td>
	                			</tr>
	                			<tr>
	                				<th>내용</th>
	                				<td colspan="3" style="height:480px;vertical-align:top;">
	                					${dto.content}
	                				</td>
	                			</tr>
	                		</table>
	                	</div>
	                	<div class="mt20 mb20">
	                		<c:if test="${empty preReadDto}">
	                			<button type="button" class="btn_classic btn-lightGray" style="color:#d6d6d6;" disabled="disabled">이전</button>
	                		</c:if>
	                		<c:if test="${not empty preReadDto}">
	                			<button type="button" class="btn_classic btn-lightGray" onclick="location.href='<%=cp%>/board/article.do?boardNum=${preReadDto.boardNum}&${query}'">이전</button>
	                		</c:if>
	                		<c:if test="${empty nextReadDto}">
	                			<button type="button" class="btn_classic btn-lightGray" style="color:#d6d6d6;" disabled="disabled">다음</button>
	                		</c:if>
	                		<c:if test="${not empty nextReadDto}">
	                			<button type="button" class="btn_classic btn-lightGray" onclick="location.href='<%=cp%>/board/article.do?boardNum=${nextReadDto.boardNum}&${query}'">다음</button>
	                		</c:if>
	                		<c:if test="${sessionScope.member.email == dto.userEmail || sessionScope.member.email == 'admin'}">
								<button type="button" class="btn_classic btn-red" style="float:right;" onclick="deleteBoard('${dto.boardNum}');">삭제하기</button>
							</c:if>
	                		<c:if test="${sessionScope.member.email == dto.userEmail}">
								<button type="button" class="btn_classic btn-white mr5" style="float:right;" onclick="javascript:location.href='<%=cp%>/board/update.do?boardNum=${dto.boardNum}&${query}';">수정하기</button>
							</c:if>
							<c:if test="${sessionScope.member.email != dto.userEmail}">
	                		<button type="button" class="btn_classic btn-black" style="float:right;" onclick="location.href='<%=cp%>/board/list.do?${query}'">목록보기</button>
	                		</c:if>
	                	</div>
                	</form>
                </div>
            </div>
            <!-- //contents -->
        </div>
        <!-- //container -->
        
        <!-- Footer -->
       	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
        <!-- //Footer -->
    </div>
    <!-- //Wrap -->
</body>
</html>