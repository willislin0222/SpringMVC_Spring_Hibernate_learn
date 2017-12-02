<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/error.css" />
</head>
<body bgcolor='white'>
	<table border='1' cellpadding='5' cellspacing='0' width='520'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><font color=red>( Spring4MVC-Spring4ORM-Hibernate5 MVC )</font></td></tr></table>

    <p>This is the Home page for IBM : Home</p>

    <h3>��Ƭd��:</h3>
    <%-- ���~��C --%>
    <div class="errorblock">${message}</div>
    <ul>
      <li><a href='<%=request.getContextPath()%>/reservation/listAllReservation.jsp'>List</a> all Reservations.  <br><br></li>
  
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/getOne_For_Display" >
           <b>��J�w���s�� (�p20171202-RES00000049):</b>
             <input type="text" name="res_no">
             <input type="submit" value="�e�X">
         </FORM>
      </li>

      <jsp:useBean id="reservationSvc" scope="page" class="com.reservation.model.ReservationService" />
   
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/getOne_For_Display" >
           <b>��ܹw���s��:</b>
           <select size="1" name="res_no">
             <c:forEach var="reservationVO" items="${reservationSvc.all}" > 
               <option value="${reservationVO.res_no}">${reservationVO.res_no}
             </c:forEach>   
           </select>
           <input type="submit" value="�e�X">
        </FORM>
      </li>
  
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/getOne_For_Display" >
           <b>��ܹw������m�W:</b>
           <select size="1" name="res_no">
             <c:forEach var="reservationVO" items="${reservationSvc.all}" > 
               <option value="${reservationVO.res_no}">${reservationVO.res_date}
             </c:forEach>   
           </select>
           <input type="submit" value="�e�X">
         </FORM>
      </li>
      
      <jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
      
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/listReservations_ByMemno" >
           <b><font color=orange>��ܷ|��:</font></b>
           <select size="1" name="mem_no">
             <c:forEach var="memberVO" items="${memberSvc.all}" > 
               <option value="${memberVO.mem_no}">${memberVO.mem_name}
             </c:forEach>   
           </select>
           <input type="submit" value="�e�X">
           <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
         </FORM>
      </li>
    </ul>


    <h3>�w���޲z</h3>

    <ul>
        <li><a href='<%=request.getContextPath()%>/reservation/addReservation'>Add</a> a new Reservation.</li>
    </ul>

	<h3><font color=orange>�����޲z</font></h3>

    <ul>
        <li><a href='<%=request.getContextPath()%>/member/listAllMember.jsp'>List</a> all Members. </li>
    </ul>


</body>

</html>
