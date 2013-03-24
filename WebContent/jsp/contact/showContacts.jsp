<%@include file="taglib_includes.jsp" %>
<%@include file="../header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script type="text/javascript" src="js/contacts.js"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
		<form action="searchContacts.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="800">
			<tr>
				<td><spring:message code="search.person"/></td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="<spring:message code="Btn.search.person"/>"/>
					&nbsp;&nbsp;<input type="button" value="<spring:message code="Btn.new.person"/>" onclick="javascript:go('saveContact.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="800">
		<tr bgcolor="lightblue">
			<th>ID</th>
			<th><spring:message code="App.Name"/></th>			
			<th><spring:message code="App.Address"/></th>
			<th><spring:message code="App.Address"/>"2"</th>
				
			<th><spring:message code="App.Mobile"/></th>
			<th><spring:message code="App.Action"/></th>
		</tr>
		<c:if test="${empty SEARCH_CONTACTS_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_CONTACTS_RESULTS_KEY}">
			<c:forEach var="contact" items="${SEARCH_CONTACTS_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${contact.id}"></c:out></td>
				<td><a href="updateContact.do?id=${contact.id}"><c:out value="${contact.name}"></c:out></a></td>
				<td><c:out value="${contact.address}"></c:out> </td>
				<td><c:out value="${contact.address2}"></c:out> </td>
				<td><c:out value="${contact.mobile}"></c:out></td>
				<td>
					&nbsp;<a href="updateContact.do?id=${contact.id}"><spring:message code="Btn.Edit"/></a>
					&nbsp;&nbsp;<a href="javascript:deleteContact('deleteContact.do?id=${contact.id}');"><spring:message code="Btn.Delete"/></a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>