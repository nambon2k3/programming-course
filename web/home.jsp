<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Courses</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .course-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .course-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        
        
    </style>
</head>
<body>
    
    <jsp:include page="header.jsp"/>
    <!-- Main Content -->
    <div class="container mt-5 mb-5">
        <h2 class="mb-4 text-center">All Courses</h2>
        <div class="row">
            <%-- Iterate over the courses list from request attribute --%>
            <c:forEach var="course" items="${courses}">
                <div class="col-md-4">
                    <div class="course-card">
                        <img src="${course.imageURL}" alt="Course Image">
                        <h5>${course.courseName}</h5>
                        <p>${course.description}</p>
                        <p><strong>Created Date:</strong> ${course.createdDate.toString().replace("T", " ")}</p>
                        <p><a href="course-lesson?courseID=${course.courseID}" class="btn btn-primary">View Details</a></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

            <jsp:include page="footer.html"/>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
