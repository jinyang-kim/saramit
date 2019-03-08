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
            <div style="height:61px"></div>
            <!-- contents -->
            <div class="contents">
                <div>
                   <div style="width:100%; margin:20px; auto; font-size:20px;">
                   	<h3>마이페이지</h3>
                   	<hr size="50"; width="1300px"; align="left";>
                   </div>
             <c:if test="${level == 2}">      
                   <div class=resume_control style="width:40%; margin:50px; float:left;">
                   	<div class="mb10">
	                   	<h3 style="display:inline-block;">이력서 관리</h3>
	                   	<a href="#" style="float:right">더보기</a>
                   	</div>
                   	<ul>
                   	<c:forEach var="dto" items="${dto}" varStatus="status">
                   	<li><a href="#">${dto.title}</a></li>
                   	</c:forEach>
                   	</ul>
                	</div>
                   	
                   	<div class=apply style="width:40%; margin:50px; float:left;">
                   	<div class="mb10">
	                   	<h3 style="display:inline-block;">지원사항</h3>
	                   	<a href="#" style="float:right">더보기</a>
                   	</div>
                	<ul>
                   	<%for(int i=0; i<5; i++) {%>
                   	<li><a href="#">지원사항입니다</a></li>
                   	<%} %>
                   	</ul>
                   </div>
              </c:if>   
                   <div class="t_center mt20 mb20">
	                   <a href="<%=cp%>/member/update.do" class="btn_classic btn-black">정보수정</a>
	                   <a href="<%=cp%>/member/delete.do" class="btn_classic btn-red ml20">회원탈퇴</a>
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