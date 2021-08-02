<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>Customer Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>

        <body>
            <jsp:include page="menu-header.jsp" />
            
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">List of Customers</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="<%=request.getContextPath()%>/customers?action=new" class="btn btn-success">Add
     New Customer</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Street 1</th>
                                <th>Street 2</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Zip</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Orders</th>
                                <th>Current Discount</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="customer" items="${listCustomer}">

                                <tr>
                                    <td>
                                        <c:out value="${customer.customerID}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerFirstName}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerLastName}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerStreet1}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerStreet2}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerCity}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerState}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerZip}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerPhone}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerEmail}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerOrders}" />
                                    </td>
                                    <td>
                                        <c:out value="${customer.customerCurrentDiscount}" />
                                    </td>
                                    <td><a href="customers?action=edit&id=<c:out value='${customer.customerID}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="customers?action=delete&id=<c:out value='${customer.customerID}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>