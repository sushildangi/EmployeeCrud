<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Employee</title>

	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="add-customer-style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Employee Management</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Customer</h3>
	
		<form:form action="saveEmployee" modelAttribute="employee" method="POST">

			<!-- need to associate this data with customer id -->
			<form:hidden path="empId" />
					
			<table>
				<tbody>
					<tr>
						<td><label>Employee name:</label></td>
						<td><form:input path="empName" /></td>
					</tr>
				
					<tr>
						<td><label>Employee Salary:</label></td>
						<td><form:input path="empSalary" /></td>
					</tr>

					<tr>
						<td><label>Designation:</label></td>
						<td><form:input path="designation" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/">Back to List</a>
		</p>
	
	</div>

</body>

</html>










