<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<br>
<h2>● 제작자 정보</h2>
<nav class="sdb_holder">
	<ul>
		<li><img src="${ctx }/main/file/download.do?fileName=${product.maker.image}" /></li>
		<br>
		<li><p style="color: #000000">제작자 아이디 &nbsp; :  &nbsp; ${product.maker.id }</p></li>
		<li><p style="color: #000000">제작자 소개  &nbsp; : </p></li>
		<li><p style="color: #000000">${product.maker.introduce }</p></li>
		<li><p style="color: #000000">가격정보  &nbsp; : &nbsp; ${product.price }원</p></li>
		<li><p style="color: #000000">작업기간  &nbsp; : &nbsp; ${product.period } 일</p></li>
		<br>
		<li><a href="${ctx }/member/myPage.do?makerId=${product.maker.id }" class="bbtn btn-primary">프로필 바로가기</a></li>
	</ul>
</nav>



