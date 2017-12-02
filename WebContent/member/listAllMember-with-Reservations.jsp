<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Ҧ��|�� - listAllMember-with-Reservations.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='805'>
	<tr bgcolor='orange' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��|�� - listAllMember-with-Reservations.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='0' bordercolor='red'>
	<c:forEach var="memberVO" items="${memberSvc.all}">
		<tr bgcolor='orange'>
			<th>�|���s��</th>
			<th>�|���W��</th>
			<th>�|��ID</th>
			<th>�|���K�X</th>
			<th>�|���ͤ�</th>
			<th>�|���q��</th>
			<th>�|���ۤ�</th>
		</tr>

		<tr bgcolor='yellow' align='center' valign='middle'>
			<td><font color=red><b>${memberVO.mem_no}</b></font></td>
			<td>${memberVO.mem_name}</td>
			<td>${memberVO.mem_id}</td>
			<td>${memberVO.mem_psw}</td>
			<td>${memberVO.mem_birthday}</td>
			<td>${memberVO.mem_mobile}</td>
			<td>${memberVO.mem_image}</td>
		</tr>

		<tr align='center' valign='middle'>
			<td colspan="3" bordercolor='#CCCCFF'>
			<table border='1' bordercolor='black' width='800'>
				<tr>
					<th>�w���s��</th>
					<th>�|���m�W</th>
					<th>���Τ��</th>
					<th>�w������</th>
					<th>�w���ɶ�</th>
				</tr>

				<c:forEach var="reservationVO" items="${memberVO.reservations}">
					<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no)
						? 'bgcolor=#CCCCFF':''}>
						<td>${reservationVO.res_no}</td>
						<td>${reservationVO.memberVO.mem_name}</td>
						<td>${reservationVO.res_date}</td>
						<td>${reservationVO.res_content}</td>
						<td>${reservationVO.res_time}</td>
					</tr>
				</c:forEach>
			</table>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
