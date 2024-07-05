<%-- 
    Document   : header
    Created on : May 18, 2024, 5:57:13 PM
    Author     : Legion
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <style>
            .header {
                background-color: lightgray;
                color: grey;
                padding: 10px 0;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h1>Programming Courses</h1>
                    </div>
                    <div class="col text-right">
                        <c:if test="${sessionScope.user eq null}">
                            <a href="login.jsp" class="btn btn-light">Login</a>
                            <a href="register.jsp" class="btn btn-light">Register</a>
                        </c:if>
                        <c:if test="${sessionScope.user ne null}">
                            <c:if test="${sessionScope.user  eq 'USER'}">
                                <a href="home" class="btn btn-light">Home</a>
                            </c:if>
                            <c:if test="${sessionScope.user.role eq 'ADMIN'}">
                                <a href="admin" class="btn btn-light">Home</a>
                            </c:if>
                            <a href="profile" class="btn btn-light">Profile</a>
                            <a href="logout" class="btn btn-light">LogOut</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
