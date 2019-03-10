<%--
  Created by IntelliJ IDEA.
  User: sushil
  Date: 2019-01-21
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>


<div id="wrapper">
    <div id="header">
        <h2>Employee Management</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <!-- put new button: Add Customer -->

        <input type="button" value="Add Customer"
               onclick="window.location.href='showFormForAdd'; return false;"
               class="add-button"
        />

        <!--  add our html table here -->

        <table>
            <tr>
                <th>Emp ID</th>
                <th>Emp Name</th>
                <th>Emp Salary</th>
                <th>designation</th>
                <th>Action</th>
            </tr>

            <!-- loop over and print our customers -->
            <c:forEach var="emp" items="${employees}">

                <!-- construct an "update" link with customer id -->
                <c:url var="updateLink" value="/showFormForUpdate">
                    <c:param name="empId" value="${emp.empId}" />
                </c:url>

                <!-- construct an "delete" link with customer id -->
                <c:url var="deleteLink" value="/delete">
                    <c:param name="empId" value="${emp.empId}" />
                </c:url>

                <tr>
                    <td> ${emp.empId} </td>
                    <td> ${emp.empName} </td>
                    <td> ${emp.empSalary} </td>
                    <td> ${emp.designation} </td>

                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </td>

                </tr>

            </c:forEach>

        </table>

    </div>

</div>


</body>


</html>










