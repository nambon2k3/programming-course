<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-5">
            <h2 class="mb-4 text-center">User Profile</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <c:if test="${isSuccess ne null && isSuccess}">
                    <div class="alert alert-success alert-dismissible fade show mt-2" role="alert" id="mess">
                        <strong>Save success!</strong> You should check in on some of those fields below.   
                        <button type="button" class="btn-close"  onclick="document.getElementById('mess').style.display = 'none'"></button>
                    </div>
                </c:if>
                <c:if test="${isSuccess ne null && !isSuccess}">
                    <div class="alert alert-danger alert-dismissible fade show mt-2" role="alert" id="mess">
                        <strong>Save failed!</strong> You should check your network.
                        <button type="button" class="btn-close"  onclick="document.getElementById('mess').style.display = 'none'"></button>
                    </div>
                </c:if>
                    <form action="profile" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                        </div>
                        <div class="form-group">
                            <label for="password">New Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.html"/>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
