<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<h6>Category</h6>
			<nav class="sdb_holder">
				<ul>
					<li><a href="#">Furniture</a></li>
					<!-- <ul>
						<li><a href="#">의자</a></li>
						<li><a href="#">책상</a></li>
					</ul>  -->
					<li><a href="#">Accessory</a></li>
					<li><a href="#">Kitchen</a></li>
					<li><a href="#">Digital</a></li>
					<li><a href="#">Clothing</a></li>
					<li><a href="#">Sport </a></li>
				</ul>
			</nav>
		</div>

		<div id="content" class="two_third">
			<h1>${ctx }상품페이지</h1>

			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control">
								<option value="id">제목</option>
								<option value="name">내용</option>
								<option value="name">상품 명</option>
								<option value="name">제작자</option>
							</select> <input input name="search" class="search-box-input" type="text"
								value="" placeholder="Search Here" />
							<button class="fa fa-search" type="submit" title="Search">
								<em>Search</em>
							</button>
						</fieldset>
					</div>
				</form>
				
				<button class="fa fa-search" name="" type="submit" title="Search">
								<em>Image Search</em>
							</button>
			</div>
			</br>
			<ul class="nospace listing">
				<li class="clear">
					<%-- <c:forEach items="${ box_list }" var="literature"> --%>
					<div class="content" align="center">
						<table class="table">
							<tr>
								<div class="imgl borderedbox">
									<img src="${ctx }/views/images/img1.jpg" />
								</div>
							</tr>
							<tr class="nospace btmspace-15">
								<td>상품 이름</td>
								<td><a class="literature" href="${ctx}/product/detail.do?productId=${product.id }">${product.title }</a></td>
							</tr>
							<tr class="nospace btmspace-15">
								<td>가격</td>
								<td class="creatorId">${product.price}원</td>
							</tr>
						</table>
					</div> <%-- </c:forEach> --%>
				</li>
			</ul>
		</div>
		</main>
	</div>
</div>



<%@ include file="/views/common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>