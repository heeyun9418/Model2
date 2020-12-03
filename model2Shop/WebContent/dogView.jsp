<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.Dog"%>
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

img {
	width: 280px;
	height: 280px;
	border: none;
}

#content_main {
	height: 300px;
}

#content_left {
	width: 300px;
	float: left;
}

#content_right {
	width: 340px;
	float: left;
}

#commandList {
	text-align: center;
}

#desc {
	height: 170px;
	background: skyblue;
}
</style>
</head>
<body>
	<section id="listForm">
		<h2>${dog.kind }의상세정보</h2>
		<section id="content_main">
			<section id="content_left">
				<img src="images/${dog.image }" />
			</section>
			<section id="content_right">
				<strong>품종 : </strong> ${dog.kind }<br> 
				<strong>가격 : </strong>
				${dog.price }<br> 
				<strong>신장 : </strong> ${dog.height }<br>
				<strong>체중 : </strong> ${dog.weight }<br> 
				<strong>출생지 : </strong> ${dog.country }<br>
				<p id="desc">
					<strong>내용 : </strong> ${dog.content }<br>
				</p>
			</section>
		</section>
		<div style="clear: both"></div>
		<nav id="commandList">
			<a href="dogList.do">쇼핑 계속하기</a> <a
				href="dogCartAdd.do?id=${dog.id }">장바구니에 담기</a>
		</nav>
	</section>
</body>
</html>