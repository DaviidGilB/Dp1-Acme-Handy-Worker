<%--
 * action-2.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="administrator.customersAboveAverage.title" /></p>	<!-- Tiles --> <!-- A�adir -->

<security:authorize access="hasRole('ADMIN')">

	<display:table pagesize="5" name="customers" id="row" class="displaytag"
			requestURI="/customersAboveAverage/admin/list.do">			
			
			<display:column property="name" titleKey="administrator.customerAboveAverage.name" />	<!--A�adir -->
			
			<display:column property="middleName" titleKey="administrator.customerAboveAverage.middleName" />	<!--A�adir -->
			
			<display:column property="surname" titleKey="administrator.customerAboveAverage.surname" />		<!--A�adir -->
			
			<display:column property="photo" titleKey="administrator.customerAboveAverage.photo" />		<!--A�adir -->
			
			<display:column property="email" titleKey="administrator.customerAboveAverage.email" />		<!--A�adir -->
			
			<display:column property="phoneNumber" titleKey="administrator.customerAboveAverage.phoneNumber" />		<!--A�adir -->
			
			<display:column property="address" titleKey="administrator.customerAboveAverage.address" />		<!--A�adir -->
			
			<display:column property="hasSpam" titleKey="administrator.customerAboveAverage.hasSpam" />		<!--A�adir -->
			
			<display:column property="score" titleKey="administrator.customerAboveAverage.score" />			<!--A�adir -->

	</display:table>
			
</security:authorize>
