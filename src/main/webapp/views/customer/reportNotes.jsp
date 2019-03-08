
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="report.notes.list" /></p>

<security:authorize access="hasRole('CUSTOMER')">

 	
	<display:table pagesize="5" name="notes" id="row" class="displaytag"
			requestURI="${requestURI}"> 
			
	<display:column property="moment" titleKey="note.moment"/>
	
	<display:column property="mandatoryComment" titleKey="note.mandatoryComment"/>
		
	<display:column titleKey="note.comments">
				<jstl:set var="optionalCommentsSize" value="${row.optionalComments.size()}" />
				<spring:url var="commentsUrl" value="note/customer/showComments.do?noteId={notId}">
							<spring:param name="notId" value="${row.id}"/>
				</spring:url>
				<a href="${commentsUrl}">
							<spring:message var ="viewComments1" code="note.viewComments" />
							<jstl:out value="${viewComments1}(${commentsSize})" />		
				</a>
	</display:column>
		
	</display:table>
	
	<spring:url var="createNoteUrl" value="note/customer/create.do?reportId={reportId}">
					<spring:param name="reportId" value="${reportId}"/>
	</spring:url>
	
	<a href="${createNoteUrl}">
		<spring:message code="note.create" />			
	</a>
</security:authorize>