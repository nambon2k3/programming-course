<%-- 
    Document   : advisor-dashboard
    Created on : Jun 22, 2024, 2:19:14 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">


        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row d-flex bg-light border justify-content-between align-items-center vh-6">
                <div class="col-1">
                    <span>CMS</span>
                </div>
                <div class="dropdown col-1" style="text-align: right;">
                    <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class='bx bxs-user'></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item border-bottom d-flex justify-content-start align-items-center" href="profile">
                                <i class='bx bxs-user' style="margin-right: 20px;"></i><span>User Profile</span></a></li>
                        <li><a class="dropdown-item d-flex justify-content-start align-items-center" href="logout"><i
                                    class='bx bx-log-in' style="margin-right: 20px;"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
            <div class="row d-flex vh-100">
                <div class="col-2 bg-light border-end p-0">
                    <div class="d-flex flex-column mb-3">
                        <a href="admin" class="p-3 border-bottom d-flex justify-content-start align-items-center text-decoration-none"><i class='bx bx-table mr-10'></i>List Course</a>
                        <a href="admin-user" class="p-3 border-bottom d-flex justify-content-start align-items-center text-decoration-none"><i class='bx bx-table mr-10'></i>List User</a>
                    </div>
                </div>
                <div class="col-10 p-4">
                    <div class="row">
                        <div class="col-12">
                            <h1 class="color-gray border-bottom pb-3">All Project</h1>
                            <div class="card mt-4">
                                <div class="card-header">
                                    Courses
                                </div>
                                <div class="d-flex justify-content-end align-items-center col-10 mt-3">
                                    <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#addCourseModal" >Add new course</button>
                                </div>
                                <div class="card-body">
                                    <table id="table" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Course ID</th>
                                                <th>Course Name</th>
                                                <th>Description</th>
                                                <th>Created Date</th>
                                                <th>Image URL</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="course" items="${courses}">
                                                <tr>
                                                    <td>${course.courseID}</td>
                                                    <td>${course.courseName}</td>
                                                    <td>${course.description}</td>
                                                    <td>${course.createdDate}</td>
                                                    <td>${course.imageURL}</td>
                                                    <td>
                                                        <div class="d-flex">
                                                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updatecCurseModal${course.courseID}" >Edit</button>
                                                            <a href="update-course?courseID=${course.courseID}" class="btn btn-danger btn-sm" >Delete</a>
                                                            <a href="course-detail?courseID=${course.courseID}" class="btn btn-success btn-sm" >Details</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <c:forEach var="course" items="${courses}">
            <!-- The Modal -->
            <div class="modal fade" id="updatecCurseModal${course.courseID}">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Update Course</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal Body -->
                        <div class="modal-body">
                            <form id="courseUpdateForm" method="post" action="update-course">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="courseID">Course ID:</label>
                                        <input type="text" class="form-control" id="courseID" name="courseID" value="${course.courseID}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="courseName">Course Name:</label>
                                        <input type="text" class="form-control" id="courseName" name="courseName" value="${course.courseName}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description:</label>
                                        <textarea class="form-control" id="description" name="description" required>${course.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="createdDate">Created Date:</label>
                                        <input type="datetime-local" class="form-control" id="createdDate" name="createdDate" value="${course.createdDate}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="imageURL">Image URL:</label>
                                        <input type="text" class="form-control" id="imageURL" name="imageURL" value="${course.imageURL}">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>


        <!-- The Modal -->
        <div class="modal fade" id="addCourseModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Course</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form id="courseUpdateForm" method="post" action="add-course">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="courseID">Course ID:</label>
                                    <input type="text" class="form-control" id="courseID" name="courseID"  readonly>
                                </div>
                                <div class="form-group">
                                    <label for="courseName">Course Name:</label>
                                    <input type="text" class="form-control" id="courseName" name="courseName" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <input class="form-control" id="description" name="description"  required>
                                </div>
                                <div class="form-group">
                                    <label for="imageURL">Image URL:</label>
                                    <input type="text" class="form-control" id="imageURL" name="imageURL" >
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>





        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#table').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
            });
        </script>
    </body>

</html>
