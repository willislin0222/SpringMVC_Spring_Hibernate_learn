<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>

<%
    ReservationService reservationSvc = new ReservationService();
    List< ReservationVO> list = reservationSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>所有員工資料 - listAllReservation.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>所有預約資料 - ListAllReservation.jsp <b><font color=red>${success}</font></b></h3>
		          <a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" width="100" height="32" border="0">回首頁</a></td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>預約編號</th>
		<th>會員姓名</th>
		<th>雇用日期</th>
		<th>預約項目</th>
		<th>預約時間</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="reservationVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${reservationVO.res_no}</td>
			<td>${reservationVO.memberVO.mem_name}</td>
			<td>${reservationVO.res_date}</td>
			<td>${reservationVO.res_content}</td>
			<td>${reservationVO.res_time}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/getOne_For_Update">
			     <input type="submit" value="修改">
			     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			  </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/delete">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
