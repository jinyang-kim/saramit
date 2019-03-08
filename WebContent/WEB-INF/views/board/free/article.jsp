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
</head>
	<style>
		.freeBody {
    		background-color: #F5F6F7;
    		min-height: 830px;
    	}
    	
    	.freeBody .freeContainer{
    		width:700px;
  			padding-top:30px;
  			margin : 0 auto;
  			min-height: 830px;
    	}
    	
    	.freeBody .freeContainer .board{
    		min-height: 600px;
    		background-color: #fff;
    		border: 1px solid #e4e4e4;
    		margin-top : 20px;
    	}
    	
    	.freeBody .freeContainer .board .innerDiv{
    		border-bottom: 1px solid #e4e4e4;
    		width: 100%;
    		padding: 5px 0 5px;
    	}
		.ui-widget-header {
  			background: #4c4c4c;
  			color: #fff;
  		}
    </style>
    <script type="text/javascript">
    $(function(){
    	$("#btn_update").click(function(){
    		$("#dlg_update").dialog({
    			title:"확인메세지",
    			width:350,
    			height:140,
    			modal:true,
    			hide:"explode"
    		});
    		$("#update_ok").click(function(){
				location.href="<%=cp%>/board/free/update.do?page=${page}&num=${dto.boardNum}";
			});
			$("#update_cancel").click(function(){
				$("#dlg_update").dialog("close");
			});
    	});
    	$("#btn_delete").click(function(){
    		$("#dlg_delete").dialog({
    			title:"확인메세지",
    			width:350,
    			height:140,
    			modal:true,
    			hide:"explode"
    		});
    		$("#delete_ok").click(function(){
				location.href="<%=cp%>/board/free/delete.do?page=${page}&num=${dto.boardNum}";
			});
			$("#delete_cancel").click(function(){
				$("#dlg_delete").dialog("close");
			});
    	});
    	
    	
    });
    </script>
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
				<div class="freeBody">
					<div class="freeContainer">
						<h1 style="text-align: left; padding: 5px 8px">자유게시판</h1>
						<div class="board" align="center" style="text-align: center">
							<h2 style="text-align: center; padding: 5px 8px; background-color: #4c4c4c; color: #fff">글보기</h2> 
								<div class="innerDiv" style="padding-top: 15px; text-align: left;">
									<b style="margin-left: 60px;">제 &nbsp;목 : </b><input type="text" name="subject" value="${dto.subject}"style="margin-left:5px; width: 55%; font-weight:bold; height: 30px; border: none; outline: none;" readonly="readonly">
									<b>조회수 :&nbsp;</b>${dto.hitCount}
								</div>
								<div class="innerDiv" style=" text-align: left;">
									<b style="margin-left: 60px;">작성자 : </b><input type="text" name="writer" value="${dto.name}" readonly="readonly" style="border: none; outline: none; width:55%; font-weight: bold;">
									<b>작성일 :&nbsp;${dto.created}</b>
									
								</div>
								<div class="innerDiv">
									<textarea style="width:80%; height: 350px; outline: none; border: none;" maxlength="1000" name="content" readonly="readonly">${dto.content}</textarea>
								</div>
									<div align="left" style="border-bottom:1px solid #e4e4e4; height:30px; padding-top:10px; line-height: 20px;"><p style="padding-left:60px;">
									<b>이전 글 : </b><a style="cursor: pointer" onclick="javascript:location.href='${prev_url}'">${prevDto.subject}</a></p></div>
									<div align="left" style="border-bottom:1px solid #e4e4e4; height:30px; padding-top:10px; line-height: 20px;"><p style="padding-left:60px;">
									<b>다음 글 : </b><a style="cursor: pointer" onclick="javascript:location.href='${next_url}'">${nextDto.subject}</a></p></div>
								<div style="margin-top: 10px; height: 45px;">
									<c:if test="${dto.userEmail == sessionScope.member.email}">
									<button type="button" class="btn btn-black" id="btn_update">수정하기</button>&nbsp;
									</c:if>
									<c:if test="${dto.userEmail == sessionScope.member.email or sessionScope.member.email=='admin'}">
									<button type="button" class="btn btn-black" id="btn_delete">삭제하기</button>&nbsp;
									</c:if>
									<button type="button" class="btn btn-black" onclick="javascript:location.href='${list_url}';">목록으로</button>
								</div>
						</div>
					</div>
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
    <div id="dlg_update" style="display:none;" align="center">
    	<h3>해당 게시물을 수정하시겠습니까?</h3>
	    <div style="margin-top:30px;">
	    <button class="btn btn-black" id="update_ok">확인</button>
	    <button class="btn btn-black" id="update_cancel">취소</button>
	    </div>
    </div>
    <div id="dlg_delete" style="display:none;" align="center">
    	<h3>해당 게시물을 삭제하시겠습니까?</h3>
    	<div style="margin-top:30px;">
    	<button class="btn btn-black" id="delete_ok">확인</button>
    	<button class="btn btn-black" id="delete_cancel">취소</button>
    	</div>
    </div>
</body>
</html>