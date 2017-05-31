<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<title>상품 등록 페이지</title>
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">

			<h1>상품 등록 페이지</h1>
			<br>
			<form action="${ctx }/product/register.do" method="post"
				name="productRegister" onsubmit="return checkIt()"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>제작 항목 <span>*</span></th>
						<td><div id="category"></div></td>
					</tr>
					<tr>
						<th>상품명 <span>*</span></th>
						<td><input id="productTitle" name="productTitle"
							class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>상품 이미지</th>
						<td><input id="image" name="image" class="btn btn-success"
							type="file" value="찾아보기"></td>
					<tr>
					<tr>
						<th>금액 <span>*</span></th>
						<td><input id="price" name="price" class="form-control"
							type="text" value=""></td>
					</tr>
					<tr>
						<th>제작 기간</th>
						<td><input id="period" name="period" class="form-control"
							type="text" value=""></td>
					</tr>
					<tr>
						<th>상품 내용 <span>*</span></th>
						<td><textarea id="productContent" name="productContent"
								class="form-control" rows="7" cols="50"></textarea>
					</tr>
				</table>
				<div align="center">
					<input id="registBtn" class="btn btn-success" type="button" value="등록하기">
					<input class="btn" type="reset" value="취소하기"
						onclick="javascript:window.location='${ctx }/post/list.do?boardId=${boardId }'">
				</div>
			</form>
			<br>

		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javaScript">

$(document).ready(function() {
	
	// DB에서 카테고리 리스트 불러오기
	$.ajax({
		url : "${ctx}/main/xml/categoryList.do",
		type : "post",
		dataType : "xml",
		success : function(xml) {
			var categoryId = "${categoryId}";
			var rs = '<select name="category" id="category" class="form-control">';
			var list = $(xml).find("category > type");
			console.log(list.size());
			list.each(function(){
				rs += '<option value"' + $(this).text() + '""';
				if(categoryId == $(this).text()){
					rs += 'selected="selected"';
				}
					rs += '>' + $(this).text() + '</option>';
			});
			rs += '</select>';
			$("#category").html(rs);
		},
		error: function(xml){
			$("#category").html('<select name="category" id="category" class="form-control">'
									+'<option value="가구" selected="selected">가구</option>'
									+'<option value="의류">의류</option>'
									+'<option value="악세사리">악세사리</option>'
									+'<option value="디지털">디지털</option>'
									+'<option value="주방">주방</option>'
									+'<option value="스포츠">스포츠</optioin>'
								 +'</select>');
		}
	});
	
	// 등록버튼 구현
	$("#registBtn").click(function(){
		console.log("----testing here-------");
		if(checkIt()){
			$.ajax({
				// 보낼 때
				url : "${ctx}/product/register.do",
				type : "post",
				data : $('#productRegister').serialize(),
				// 받을 때 
				dataType : "text",
				success : function(data) {
					if(data == "true"){
						location.href="/product/productDetail.jsp"; // 성공시 페이지 전환
					}
				},
				error: function(xml){
					console.log("실패 메시지 :\n"+xml.responseText);
				}
			});
		}
	});
	
	//필수 입력값 체크
	function checkIt() {

		var productRegister = document.productRegister;

		if (!productRegister.productTitle.value) {
			alert("상품명을 입력하세요");
			return false;
		}

		if (!productRegister.productContent.value) {
			alert("내용을 입력하세요");
			return false;
		}
		
		if(!productRegister.price.value){
			alert("금액을 입력하세요");
			return false;
		}
		
		if(!productRegister.period.value){
			alert("기간을 입력하세요");
			return false;
		}
		return true;
	}
});

</script>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>