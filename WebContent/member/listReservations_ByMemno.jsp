<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�|���w�� - listReservations_ByMemno.jsp</title>
</head>
<body bgcolor='white'>

<br>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|���w�� - listReservations_ByMemno.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�w���s��</th>
		<th>�|���m�W</th>
		<th>���Τ��</th>
		<th>�w������</th>
		<th>�w���ɶ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	
	<c:forEach var="reservationVO" items="${listReservations_ByMemno}" >
		<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${reservationVO.res_no}</td>
			<td>${reservationVO.memberVO.mem_name}</td>
			<td>${reservationVO.res_date}</td>
			<td>${reservationVO.res_content}</td>
			<td>${reservationVO.res_time}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/getOne_For_Update">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="res_no"value="${reservationVO.res_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			  </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/delete">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
