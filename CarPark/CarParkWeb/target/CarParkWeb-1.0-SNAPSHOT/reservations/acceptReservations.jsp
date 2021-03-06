<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>


<f:message key="reservationsSubMenu.myReservations" var="title" />
<s:layout-render name="/layout.jsp" title="${title}" 
                 mainMenu="${actionBean.mainMenu}" subMenu="${actionBean.subMenu}">
    
    <s:layout-component name="content">
          <s:useActionBean beanclass="cz.muni.fi.pa165.vozovypark.web.ReservationsActionBean" var="actionBean"/>  
        <br/>
        <table>
            <thead>
            <tr>
                <td><s:label name="reservation.id" /></td>
                <td><s:label name="reservation.from" /></td>
                <td><s:label name="reservation.to" /></td>
                <td><s:label name="reservation.start" /></td>
                <td><s:label name="reservation.end" /></td>
                <td><s:label name="reservation.confirmed" /></td>
                <td><s:label name="reservation.car" /></td>
                <td><s:label name="reservation.employee" /></td>
                <td></td>
            </tr>
            </thead>
            <c:forEach items="${actionBean.unconfirmedReservations}" var="res">
                <tr>
                    <td>${res.id}</td>
                    <td><s:format formatPattern="dd.MM.YYYY" value="${res.dateFrom}" /></td>
                    <td><s:format formatPattern="dd.MM.YYYY" value="${res.dateTo}" /></td>
                    <td><s:format formatPattern="dd.MM.YYYY" value="${res.startDate}" /></td>
                    <td><s:format formatPattern="dd.MM.YYYY" value="${res.returnDate}" /></td>
                    <td class="confirmed"><img align="center" src="${pageContext.request.contextPath}${(res.confirmed)?'/images/available.png' :  '/images/unavailable.png'}"  /></td>
                    <td><c:out value="${res.car.spz}" /></td>
                    <td><c:out value="${res.employee.name}" /></td>
                    <td><s:link beanclass="cz.muni.fi.pa165.vozovypark.web.ReservationsActionBean" event="confirm"><s:param name="resDTO.id" value="${res.id}"/><f:message key="reservation.confirm"/></s:link> </td>
              
                </tr>
            </c:forEach>            
        </table>
    </s:layout-component>
</s:layout-render>
