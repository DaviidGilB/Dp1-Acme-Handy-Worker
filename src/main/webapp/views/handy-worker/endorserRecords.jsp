<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="endorserRecord.handyWorker.title" /></p>	

<security:authorize access="isAuthenticated()">
	
	<display:table pagesize="5" name="endorserRecords" id="row" class="displaytag" 
					requestURI="/endorserRecord/handyWorker/list.do">
					
					<!-- Autorizaci�n para que solo el handy worker pueda editar -->
					<security:authorize access="hasRole('HANDYWORKER')">
						<spring:url var="editUrl" value="endorserRecord/handyWorker/edit.do?endorserRecordId={recordId}">
							<spring:param name="recordId" value="${row.id}" />
						</spring:url>
						
						<a href="${editUrl}">
							<spring:message code="endorserRecord.handyWorker.editEndorserRecord" />	
						</a>
					</security:authorize>
					<!-- Fin de la Autorizaci�n -->
					
					
					<!-- Full Name -->
					<display:column property="fullName" titleKey="endorserRecord.fullName" />
					
					<!-- Email -->
					<display:column property="email" titleKey="endorserRecord.email" />
					
					<!-- Phone Number -->
					<display:column property="phoneNumber" titleKey="endorserRecord.phoneNumber" />	
					
					<!-- linkLinkedInProfile -->
					<display:column property="linkLinkedInProfile" titleKey="endorserRecord.linkLinkedInProfile" />
					
					<!-- View Comments -->
					<display:column titleKey="endorserRecord.comments">	
							<jstl:set var="commentsSize" value="${row.comments.size()}" />
							
							<spring:url var="commentsUrl" value="/comment/handyWorker/list.do?endorserRecordId={recordId}">
									<spring:param name="recordId" value="${row.id}"/>
							</spring:url>
							
							<a href="${commentsUrl}">
									<spring:message var ="viewComments1" code="endorserRecord.viewComments" />	
									<jstl:out value="${viewComments1}(${commentsSize})" />		
							</a>
					</display:column>
	</display:table>
	
	<!-- Autorizaci�n para que solo el handy worker pueda crear -->
	<security:authorize access="hasRole('HANDYWORKER')">
			<spring:url var="create" value="endorserRecord/handyWorker/create.do?recordId={recordId}">
					<spring:param name="recordId" value="${row.id}" />
			</spring:url>
						
			<a href="${editUrl}">
					<spring:message code="endorserRecord.handyWorker.createEndorserRecord" />
			</a>
	</security:authorize>
	<!-- Fin de la Autorizaci�n -->	
	
</security:authorize>
					