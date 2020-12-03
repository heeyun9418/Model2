<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sun.org.apache.bcel.internal.generic.*" %>
<%@ page import="vo.Cart, vo.Dog,dao.DogDAO, java.util.List, java.text.SimpleDateFormat, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#listForm {
	width: 640px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 550px;
}

.tr_top {
	background: lime;
}

.div_empty {
	background: red;
	text-align: center;
}

.td_command {
	text-align: center;
}

#todayImageList {
	text-align: center;
}

#productImage {
	width: 150px;
	height: 150px;
	border: none;
}

#cartImage {
	width: 70px;
	height: 70px;
	border: none;
}

#select {
	text-align: center;
}

#commandList {
	text-align: center;
}

#upImage {
	width: 15px;
}

#downImage {
	width: 15px;
}
</style>
<script>
	function checkAll(theForm) {
		if (theForm.remove.length == undefined) {
			theForm.remove.checked = theForm.allCheck.checked;
		} else {
			for (var i = 0; i < theForm.remove.length; i++) {
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}

	function checkQty(kind, qty) {
		if (qty != 1) {
			location.href = "dogCartQtyDown.do?kind=" + kind;
		}
	}
</script>
</head>
<body>
	<c:if test="${startMoney != null }">
		<c:set var="startMoney" value="${startMoney}"></c:set>
	</c:if>
	<c:if test="${endMoney != null }">
		<c:set var="endMoney" value="${endMoney}"></c:set>
	</c:if>
	<section>
		<c:if test="${cartList != null && cartList.size() > 0 }">
			<h2>장바구니 목록</h2>
			<form method="post">
				<table>
					<tr id='select'>
						<td colspan="6">
							<select id="startMoney" name="startMoney">
								<option>=최하=</option>
								<c:choose>
									<c:when test="${startMoney == 1000 }">
										<option selected="selected">1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 2000 }">
										<option>1000</option>
										<option selected="selected">2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 3000 }">
										<option>1000</option>
										<option>2000</option>
										<option selected="selected">3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 4000 }">
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option selected="selected">4000</option>
									</c:when>
									<c:otherwise>
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:otherwise>
								</c:choose>
							</select>
							<select id="endMoney" name="endMoney">
								<option>=최고=</option>
								<c:choose>
									<c:when test="${endMoney == 1000 }">
										<option selected="selected">1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 2000 }">
										<option>1000</option>
										<option selected="selected">2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 3000 }">
										<option>1000</option>
										<option>2000</option>
										<option selected="selected">3000</option>
										<option>4000</option>
									</c:when>
									<c:when test="${startMoney == 4000 }">
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option selected="selected">4000</option>
									</c:when>
									<c:otherwise>
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input type="submit" value="검색" formaction="dogCartSearch.do"/>
						</td>
					</tr>
					<tr class="tr_top">
						<th><input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)"/></th>
						<th>번호</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
					
					<c:forEach var="cart" items="${cartList }" varStatus="status">
						<tr style="text-align:center;">
							<td><input type="checkbox" id="remove" name="remove" value="${cart.kind }"/></td>
							<td>${status.index+1 }</td>
							<td><img src="images/${cart.image }" id="cartImage"/></td>	
							<td>${cart.kind }</td>
							<td>${cart.price }</td>
							<td><a href="dogCartQtyUp.do?kind=${cart.kind }">⇧</a><br>
							${cart.qty }<br>
							<a href="javascript:checkQty('${cart.kind }',${cart.qty })">⇩</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" style="test-align:center;">
						총 금액 : ${totalMoney }원
						</td>
					</tr>
					<tr>
						<td colspan="6" style="test-align:center;">
							<input type="submit" value="삭제" formaction="dogCartRemove.do"/>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${cartList == null }">
			<section class="div_empty">
				개 정보가 없습니다
			</section>
		</c:if>
		<nav id="commandList">
			<a href="dogList.do">쇼핑 계속하기</a>
		</nav>
	</section>
</body>
</html>