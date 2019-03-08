<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p>
	<spring:message code="complaints.report" />
</p>

<security:authorize access="hasRole('REFEREE')">

	<display:table pagesize="5" name="reports" id="row" class="displaytag"
		requestURI="report/referee/list.do">


		<display:column titleKey="report.edit">
			<jstl:if test="${row.finalMode == false}">
				<spring:url var="updateReport"
					value="report/referee/edit.do?reportId={reportId}">
					<spring:param name="reportId" value="${row.id}" />
					<spring:param name="complaintId" value="${complaintId}" />
				</spring:url>

				<a href="${updateReport}"> <spring:message code="report.edit" />
				</a>
			</jstl:if>
		</display:column>

		<display:column property="moment" titleKey="report.moment" />

		<display:column property="description" titleKey="report.description" />

		<display:column titleKey="referee.attachments">
			<jstl:set var="attachmentsSize" value="${row.attachments.size()}" />
			<spring:url var="attachmentsUrl"
				value="/attachment/referee/listRep.do?reportId={reportId}">
				<spring:param name="reportId" value="${row.id}" />
			</spring:url>
			<a href="${attachmentsUrl}"> <spring:message
					var="viewAttachments1" code="referee.viewAttachments" /> <jstl:out
					value="${viewAttachments1}(${attachmentsSize})" />
			</a>
		</display:column>


		<display:column titleKey="report.notes">
			<jstl:set var="notesSize" value="${row.notes.size()}" />
			<spring:url var="notesUrl" value="/note/referee/list.do?reportId={reportId}">
				<spring:param name="reportId" value="${row.id}" />
			</spring:url>
			<a href="${notesUrl}"> <spring:message var="viewNotes1"
					code="report.viewNotes" /> <jstl:out
					value="${viewNotes1}(${NotesSize})" />
			</a>
		</display:column>

	</display:table>

</security:authorize>


