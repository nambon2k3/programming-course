<%-- 
    Document   : lessons
    Created on : Jun 30, 2024, 2:26:46 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        
         <style>
            .footer {
                background-color: lightgray;
                color: grey;
                padding: 10px 0;
                width: 100%;
                text-align: center;
                margin-top: 50px
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Sidebar for lessons -->
                <div class="col-md-3">
                    <h4>Lessons</h4>
                    <ul class="list-group" style="list-style-type: none">
                        <c:forEach var="lesson" items="${lessons}">
                            <li class="list-group-item">
                                <a href="?courseID=${param.courseID}&lessonID=${lesson.lessonID}">${lesson.lessonTitle}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <!-- Main content area -->
                <div class="col-md-9">
                    <c:choose>
                        <c:when test="${not empty selectedLesson}">
                            <h3>${selectedLesson.lessonTitle}</h3>
                            <div class="mb-3">
                                <iframe width="1123" height="632" src="${selectedLesson.videoLink}" title="FORGET ME NOW  || OFFICIAL FAKE MV" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            </div>
                            <p>${selectedLesson.content}</p>
                        </c:when>
                        <c:otherwise>
                            <p>Please select a lesson from the list.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="container">
                <p>&copy; 2024 Programming Courses Platform. All rights reserved.</p>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
