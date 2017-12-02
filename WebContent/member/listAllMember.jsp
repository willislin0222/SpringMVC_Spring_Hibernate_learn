<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Ҧ��|�� - listAllMember.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='orange' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��|�� - listAllMember.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�|���s��</th>
		<th>�|���W��</th>
		<th>�|��ID</th>
		<th>�|���K�X</th>
		<th>�|���ͤ�</th>
		<th>�|���q��</th>
		<th>�|���ۤ�</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�߳������u</th>
	</tr>
	
	<c:forEach var="memberVO" items="${memberSvc.all}">
		<tr align='center' valign='middle'>
			<td>${memberVO.mem_no}</td>
			<td>${memberVO.mem_name}</td>
			<td>${memberVO.mem_id}</td>
			<td>${memberVO.mem_psw}</td>
			<td>${memberVO.mem_birthday}</td>
			<td>${memberVO.mem_mobile}</td>
			<td>${memberVO.mem_image}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/getOne_For_Update_Member">
			    <input type="submit" value="�ק�" disabled="disabled"> 
			    <input type="hidden" name="mem_no" value="${memberVO.mem_no}"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/delete_Member">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="mem_no" value="${memberVO.mem_no}"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/listReservations_ByMemno">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="mem_no" value="${memberVO.mem_no}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listReservations_ByMemno")!=null){%>
       <jsp:include page="listReservations_ByMemno.jsp" />
<%} %>

</body>
</html>
