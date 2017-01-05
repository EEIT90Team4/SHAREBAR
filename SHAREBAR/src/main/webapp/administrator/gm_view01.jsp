<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<style>

/* .st1{ */
/* border:1px solid black; */
/* border-collapse:collapse; */

/* } */
</style>
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- <script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript">
$(function(){
	$("#header").load("../header.jsp");
	
	$("#footer").load("../footer.jsp");
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台系統_會員管理</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>

<body>
<div id="header"></div>
	<div class="row">
		<div class="col-md-2"></div>
	    <div class="col-md-8">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
	
						<a class="navbar-brand" href="#">後台管理系統</a>
					</div>			
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	
	<div class="col-md-2"></div>
	
	<div class="col-md-2">
		<div class="list-group">
		  <a href="gm_view01.jsp" class="list-group-item active">會員管理</a>
		  <a href="gm_view02.jsp" class="list-group-item">物品管理</a>
		  <a href="gm_view03.jsp" class="list-group-item">遭檢舉品項</a>
		  <a href="gm_view04_1.jsp" class="list-group-item">客服信箱</a>
		  <a href="../category/CRUDClass.jsp" class="list-group-item">分類管理</a>	
		</div>
	</div>
	
	<div class="col-md-6">
<!-- 		    <div class="jumbotron"> -->
			
				
<!-- 每頁不同的內容從這裡開始 -->
	<div class="row">
		<div class="col-sm-6">		
			<form action="<c:url value="/administrator/SelectBlockMemberServlet"/>" method="get">
				<table>
					<tr>
						<td></td>
						<td align="right"><input type="submit" value="選取所有已封鎖會員" class="btn btn-default"></td>
					</tr>			
				</table>		
			</form>
		
			<div>&nbsp;</div>
			<div>&nbsp;</div>	
					
			<form action="<c:url value="/administrator/SelectByMemberNameServlet"/>" method="get">
				<table>
					<tr>
<!-- 						<td><label>會員帳號:&nbsp;</label></td> -->
						<td><input type="text" name="member_email" id="member_email" value="${param.member_email}"  class="form-control" placeholder="會員帳號"></td>			
						<td align="right"><input type="submit" value="搜尋帳號" class="btn btn-default"> ${errors.member_email} ${errors.system}</td>
					</tr>			
				</table>		
			</form>
		</div>
	

	
		<div class="col-sm-6">	
			<form action="<c:url value="/administrator/UpdateMemberBlockServlet"/>" method="get">
				<table>
					<tr>
						<td></td>
					</tr>
					<tr>
<!-- 						<td><label>會員編號:&nbsp;</label></td> -->
						<td><input type="text" name="member_no" value="${param.member_no}" class="form-control" placeholder="會員編號">${errors.member_no }</td>				
					</tr>
					<tr>
<!-- 						<td><label>封鎖日期:&nbsp;</label></td> -->
						<td><input type="text" name="member_block" value="${param.member_block}" class="form-control" placeholder="輸入日期:yyyy-mm-dd">${errors.member_block }</td>
						<td align="right"><input type="submit" value="封鎖會員" class="btn btn-danger">${errors.system}</td>
					</tr>	
				</table>		
			</form>
		
			<div>&nbsp;</div>
		
			<form action="<c:url value="/administrator/ClearMemberBlockServlet"/>" method="get">
				<table>
					<tr>
						<td></td>
					</tr>
					<tr>
<!-- 						<td><label>會員編號:&nbsp;</label></td> -->
						<td><input type="text" name="member_no" id="member_no" value="${param.member_no}" class="form-control" placeholder="會員編號"></td>	
						<td align="right"><input type="submit" value="解封會員" class="btn btn-success">${errors.member_no2}</td>
					</tr>			
				</table>		
			</form>
		</div>
	</div>	
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

	
<!-- 	<h3>搜尋會員結果</h3> -->
	<div>&nbsp;</div>
	<table class="table table-striped">	
<!-- 	<thead> -->
				<tr align="center">
					<td class="st1">會員編號</td>
					<td class="st1">封鎖日期</td>
					<td class="st1">會員帳號</td>
<!-- 					<td class="st1">&nbsp;&nbsp;會員密碼&nbsp;&nbsp;</td> -->
					<td class="st1">會員暱稱</td>
					<td class="st1">自我介紹</td>
					<td class="st1">認證狀態</td>
					
				</tr>
<!-- 	</thead> -->
			<c:if test="${not empty members}">
			<c:forEach var="element1" items="${members}">
				<c:url value="gm_view01.jsp" var="path">
					<c:param name="member_no" value="${element1.member_no}" />
					<c:param name="member_block" value="${element1.blockdate}" />
					<c:param name="member_email" value="${element1.email}" />
					<c:param name="member_nickname" value="${element1.nickname}" />					
				</c:url>
			
				<tr>	
					<td class="st1" align="center"><a href="${path}">${element1.member_no}</a></td>
					<td class="st1" align="center">${element1.blockdate}</td>
					<td class="st1">${element1.email}</td>
<%-- 					<td class="st1" align="center">${element1.password}</td> --%>
					<td class="st1" align="center">${element1.nickname}</td>
					<td class="st1" align="center">${element1.description}</td>
					<td class="st1" align="center">${element1.certification}</td>			
				</tr>
			</c:forEach>
			</c:if>	
			

<%-- 				<c:url value="gm_view01.jsp" var="path"> --%>
<%-- 					<c:param name="member_no" value="${member.member_no}" /> --%>
<%-- 					<c:param name="member_block" value="${member.blockdate}" /> --%>
<%-- 					<c:param name="member_email" value="${member.email}" /> --%>
<%-- 					<c:param name="member_nickname" value="${member.nickname}" />					 --%>
<%-- 				</c:url> --%>
			<c:if test="${not empty member}">
				<tr>	
					<td class="st1" align="center">${member.member_no}</td>
					<td class="st1" align="center">${member.blockdate}</td>
					<td class="st1">${member.email}</td>
					<td class="st1" align="center">${member.password}</td>
					<td class="st1" align="center">${member.nickname}</td>
					<td class="st1" align="center">${member.description}</td>
					<td class="st1" align="center">${member.certification}</td>			
				</tr>
			</c:if>

	</table>

	
		
		
	
	
	

<!-- 每頁不同的內容到這裡結束 -->
<!-- 			</div> -->
	</div>

</body>
</html>