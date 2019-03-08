<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="handyWorker.tutorialEdit" /></p>
<security:authorize access="hasRole('HANDYWORKER')">

	<form:form modelAttribute="tutorial" action="tutorial/handyworker/edit.do">
		<form:hidden path="id"/>
		<form:hidden path="version"/>
		
		<form:label path="title">
			<spring:message code="tutorial.title" />	
		</form:label>
		<form:input path="title"/>
		<form:errors cssClass="error" path="title"/>
		<br />

		<form:label path="summary">
			<spring:message code="tutorial.summary" />	
		</form:label>
		<form:textarea path="summary"/>
		<form:errors cssClass="error" path="summary"/>
		<br />
		
		<form:label path="picture">
			<spring:message code="tutorial.pictures" />	
		</form:label>
		<form:input path="picture" placeholder="hhtps://www.example.com" />
		<form:errors cssClass="error" path="picture" />
		<br />		
		
		
		
		<jstl:forEach var="section" items="tutorial.sections">
	
			<form:label path="title">
				<spring:message code="section.title" />	
			</form:label>
			<form:input path="title"/>
			<form:errors cssClass="error" path="title"/>
			<br />

			<form:label path="text">
				<spring:message code="section.text" />	
			</form:label>
			<form:textarea path="text"/>
			<form:errors cssClass="error" path="text"/>
			<br />
				
			<form:label path="picture">
				<spring:message code="section.pictures" />	
			</form:label>
			<form:input path="picture" placeholder="hhtps://www.example.com" />
			<form:errors cssClass="error" path="picture" />
			<br />
		<input type="submit" <jstl:if test="${section.id == 0}"><jstl:out value="disabled='disabled'"/></jstl:if>
		name="delete" value="<spring:message code="tutorial.delete" />" 
		onClick="return confirm('<spring:message code="section.verificationDelete" />')">
		</jstl:forEach>
				
	<input type="submit" name="save" value="<spring:message code="tutorial.save" />" />

	<input type="submit" <jstl:if test="${tutorial.id == 0}"><jstl:out value="disabled='disabled'"/></jstl:if>
		name="delete" value="<spring:message code="tutorial.delete" />" 
		onClick="return confirm('<spring:message code="tutorial.verificationDelete" />')">
	
	<input type="submit" name="cancel" value="<spring:message code="tutorial.cancel" />"
		onClick="javascript: relativeRedir('handy-worker/showProfile.do');" />	
				
</form:form>
		
</security:authorize>