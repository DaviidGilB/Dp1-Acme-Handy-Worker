<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="anonymous.createHandyWorker" /></p>

<security:authorize access="isAnonymous()">

<script type="text/javascript">

  function phonenumberval() {
	  
  var phoneNumber;
  phoneNumber = document.getElementById("phoneNumber").value;

		
  var res = false;
 
  if (/(\+[0-9]{1,3})(\([0-9]{1,3}\))([0-9]{4,})$/.test(phoneNumber)) {
    res = true;
  }
  if (/(\+[0-9]{3})([0-9]{4,})$/.test(phoneNumber)) {
	    res = true;
  }
  if(phoneNumber == ""){
	  alert("<spring:message code="anonymous.alertSave" />");
  }
  if(res == false && phoneNumber != "") {
	  
    confirm("<spring:message code="anonymous.confirmationPhone" />");
  }
 
}
  </script>


<form:form modelAttribute="handyWorker" action="anonymous/createHandyWorker.do">
    <!--Hidden Attributes -->
	<form:hidden path ="id"/>
	<form:hidden path ="version"/>
	
	<form:hidden path ="hasSpam"/>
	<form:hidden path ="boxes"/>
	<form:hidden path ="socialProfiles"/>
	
	<form:hidden path ="userAccount.authorities"/>
	<form:hidden path ="userAccount.isNotLocked"/> 
	
	<form:hidden path ="score"/>
	<form:hidden path ="endorsements"/>
	<form:hidden path ="make"/>
	<form:hidden path ="applications"/>
	<form:hidden path ="finder"/>
	<form:hidden path ="tutorials"/>
	<form:hidden path ="curriculum"/>
	

	<!-- Actor Attributes -->
	<form:label path="name">
		<spring:message code="handyWorker.name" />
	</form:label>
	<form:input path="name" placeholder="Paco" />
	<form:errors cssClass="error" path="name"/>
	<br />
	
	
	<form:label path="middleName">
		<spring:message code="handyWorker.middleName" />
	</form:label>
	<form:input path="middleName" placeholder="Perito" />
	<form:errors cssClass="error" path="middleName"/>
	<br />

	
	<form:label path="surname">
		<spring:message code="handyWorker.surname" />
	</form:label>
	<form:input path="surname" placeholder="Perez" />
	<form:errors cssClass="error" path="surname"/>
	<br />
	
	
	<form:label path="photo">
		<spring:message code="handyWorker.photo" />
	</form:label>
	<form:input path="photo" placeholder="https://www.exampleDomain.com"/>
	<form:errors cssClass="error" path="photo"/>
	<br />
	
	
	<form:label path="email">
		<spring:message code="handyWorker.email" />
	</form:label>
	<form:input path="email" placeholder="example@gmail.com" />
	<form:errors cssClass="error" path="email"/>
	<br />


	<form:label path="phoneNumber">
		<spring:message code="handyWorker.phoneNumber" />
	</form:label>
	<form:input path="phoneNumber" placeholder="+34(245)3145"/>
	<form:errors cssClass="error" path="phoneNumber"/>
	<br />

	
	<form:label path="address">
		<spring:message code="handyWorker.address" />
	</form:label>
	<form:input path="address"/>
	<form:errors cssClass="error" path="address"/>
	<br />
	
	
	<form:label path="userAccount.username">
		<spring:message code="handyWorker.username" />
	</form:label>
	<form:input path="userAccount.username" />
	<form:errors cssClass="error" path="userAccount.username"/>
	<br />
	
	
	<form:label path="userAccount.password">
		<spring:message code="handyWorker.password" />
	</form:label>
	<form:password path="userAccount.password" />
	<form:errors cssClass="error" path="userAccount.password"/>
	<br /> 
	
	
		
	<input type="submit" name="save" value="<spring:message code="handyWorker.save" />" 
	onclick="phonenumberval()" /> 
	
	<a href="#" style="text-decoration: none;">
    	<input type="button" value="<spring:message code="handyWorker.cancel" />" />
	</a>
	
	</form:form>
	
</security:authorize>