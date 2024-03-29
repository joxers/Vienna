<%@include file="taglib_includes.jsp" %>

<html>
<head>
	<script type="text/javascript" src="js/contacts.js"></script>
	<title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="350" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
	<tr>
		<td align="center"><h3>Tambah Anggota</h3></td>
	</tr>
	<tr valign="top" align="center">
    <td align="center">
 		<form:form action="saveContact.do" method="post" commandName="contact/newContact">
	    	
				<table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">	
					<tr>
						<td width="100" align="right"><spring:message code="App.Name"/></td>
						<td width="150">
						<form:input path="name"/></td>
						<td align="left">
						<form:errors path="name" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					
					<tr>
						<td width="100" align="right"><spring:message code="dob"/></td>
						<td><form:input path="dob"/></td>
						<td align="left"><form:errors path="dob" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Gender</td>
						<td>						
							<form:select path="gender">
					            <form:option value="P" label="Pria"/>
					            <form:option value="W" label="Wanita"/>
					        </form:select>						
						</td>
						<td>
						</td>						
					</tr>
					<tr>
						<td width="100" align="right"><spring:message code="App.Address"/></td>
						<td><form:textarea path="address"/></td>
						<td align="left">
						<form:errors path="address" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right"><spring:message code="App.Address"/> ke 2</td>
						<td><form:textarea path="address2"/></td>
						<td align="left">
						<form:errors path="address" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Email</td>
						<td><form:input path="email"/></td>
						<td align="left"><form:errors path="email" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Mobile</td>
						<td><form:input path="mobile"/></td>
						<td align="left">
						<form:errors path="mobile" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<input type="submit" name="" value="<spring:message code="Btn.Save"/>">
						&nbsp;&nbsp;
						<input type="reset" name="" value="Reset">
						&nbsp;&nbsp;
						<input type="button"  value="<spring:message code="Btn.Back"/>" onclick="javascript:go('viewAllContacts.do');">
						</td>
					</tr>					
				</table>			
		</form:form>
    </td>    
  </tr>
</table>
</body>
</html>
