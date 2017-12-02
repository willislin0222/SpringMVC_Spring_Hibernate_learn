<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�w����ƭק� - update_reservation_input.jsp</title></head>
<!-- �����J���U -->
<script src="<%=request.getContextPath()%>/resources/cal/js/jscal2.js"></script>
<script src="<%=request.getContextPath()%>/resources/cal/js/lang/cn.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/css/jscal2.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/css/border-radius.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/css/steel/steel.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/error.css" />
</head>

<body>

	<table border='1' cellpadding='5' cellspacing='0' width='520'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>�w����ƭק� - update_reservation_input.jsp</h3></td>
			<td><a href="<%=request.getContextPath()%>/select_page.jsp"><img src="<%=request.getContextPath()%>/resources/images/back1.gif" border="0">�^���� </a></td>	</tr></table>

    <h4>��ƭק�:</h4>


	<form:form action="update" method="POST" modelAttribute="reservationVO">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
            <tr>
		        <td>���u�s��:<font color=red><b>*</b></font></td>
		        <td><form:input type="text" path="res_no" id="res_no"	size="45" value="${reservationVO.res_no}" cssStyle="border:0px ; font-weight: bold;"/></td>
	        </tr>
	        <tr>
				<td>�|��:<font color=red><b>*</b></font></td>
				<td><form:select path="memberVO.mem_no" id="memberVO.mem_no" items="${listData}" itemValue="mem_no" itemLabel="mem_name" /></td>
			</tr>
			<tr>
				<td>�w�����:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="res_date" id="f_date1" size="40" readonly="true" value="${reservationVO.res_date}"/> 
				     <img align="top" src="<%=request.getContextPath()%>/resources/cal/images/btn_date_up.gif" id="f_btn1" width="25" height="20"/></td>
				<td><form:errors path="res_date" cssClass="error"/></td>
			</tr>
			<tr>
				<td width="10%">�w������:<font color=red><b>*</b></font></td>
				<td width="35%"><form:input type="text" path="res_content" id="res_content"	size="45" value="${reservationVO.res_content}"/></td>
				<td width="55%"><form:errors path="res_content" cssClass="error"/></td>
			</tr>
				<tr>
				<td>�w���ɶ�:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="res_time" id="res_time" size="45" value="${reservationVO.res_time}"/></td>
				<td><form:errors path="res_time" cssClass="error" /></td>
			</tr>
	        

		</table><br>
		<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
        <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
		<input type="submit" value="�e�X�ק�">
	</form:form>

    <br>�e�X�ק諸�ӷ��������|:<br><b>
    <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
    <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>

	<!-- �����J���U -->
	<script type="text/javascript">
		var cal = Calendar.setup({
			onSelect: function(cal) { cal.hide() },         
	        selectionType : Calendar.SEL_MULTIPLE,
	        weekNumbers  : true,
	        selection    : Calendar.dateToInt(new Date()), 

			// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

			//           1.�H�U����Ѥ��e������L�k��� (�]�i���ݭn������L���)
			//           disabled : function(date) {
			//                 var somedate1 = new Date();
			//                 return   (date.getYear() <  somedate1.getYear() || 
			//                          (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
			//                          (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate()));               
			//           },

			//           2.�H�U����Ѥ��᪺����L�k��� (�]�i���ݭn������L���)
			//           disabled : function(date) {
			//                 var somedate2 = new Date();
			//                 return   (date.getYear() >  somedate2.getYear() || 
			//                          (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
			//                          (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate()));               
			//           },

			//           3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
			//           disabled : function(date) {
			//                 var somedate1 = new Date("2016-04-05");
			//                 var somedate2 = new Date("2016-04-15");
			//                 return   (
			//                           (date.getYear() < somedate1.getYear() || (date.getYear() == somedate1.getYear() && date.getMonth() < somedate1.getMonth()) || (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate()))
			//                            ||
			//                           (date.getYear() > somedate2.getYear() || (date.getYear() == somedate2.getYear() && date.getMonth() > somedate2.getMonth()) || (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate()))
			//                          );               
			//           },

			showTime : true
		});

		cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d");
		//cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d %H:%M:%S"); //�t�ɶ��W�O
	</script>

</body>
</html>
