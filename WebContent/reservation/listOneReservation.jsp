<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.reservation.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>預約資料 - listOneReservation.jsp</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>預約資料 - ListOneReservation.jsp</h3>
		              <a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" width="100" height="32" border="0">回首頁</a></td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>預約編號</th>
		<th>會員姓名</th>
		<th>雇用日期</th>
		<th>預約項目</th>
		<th>預約時間</th>
	</tr>
	<tr align='center' valign='middle'>
		<td>${reservationVO.res_no}</td>
		<td>${reservationVO.memberVO.mem_name}</td>
		<td>${reservationVO.res_date}</td>
		<td>${reservationVO.res_content}</td>
		<td>${reservationVO.res_time}</td>
	</tr>
</table>

</body>
</html>
