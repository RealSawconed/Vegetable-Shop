<%-- 
    Document   : index
    Created on : 12-Jul-2023, 22:34:07
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
        <script src="resources/js/bootstrap.bundle.min.js"></script>

        <!-- Jquery -->
        <script src="resources/js/jquery-3.7.0.min.js"></script>

        <!-- DataTables -->        
        <script src="resources/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="resources/css/jquery.dataTables.min.css"/>    

        <script>
            $(document).ready(function () {
                var name = "", pass = "";

                $("input[name='username'], input[name='password']").on("keyup", function () {
                    name = $("input[name='username']").val().trim();
                    pass = $("input[name='password']").val().trim();

                    if ((name !== "" && name.length <= 20) && pass !== "") {
                        $("button[name='btnLogin']").attr("disabled", false);
                    } else {
                        $("button[name='btnLogin']").attr("disabled", true);
                    }
                });

                $("input[name='username']").on("keyup", function () {
                    if (name === "" || name.length > 20) {
                        $(".errorName").show();
                    }
                });
                
                $("input[name='password']").on("keyup", function () {
                    if (pass === "") {
                        $(".errorPass").show();
                    }
                });

                $("input[name='username']").blur(function () {
                    if (name === "" || name.length > 20) {
                        $(".errorName").show();
                    }
                });

                $("input[name='password']").blur(function () {
                    if (pass === "") {
                        $(".errorPass").show();
                    }
                });
            });
        </script>
    </head>
    <body>     
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1 class="text-warning mt-4">Login <i class="fa-solid fa-id-card"></i></h1>   

                <form class="form-horizontal rounded-3 shadow-lg p-5 mb-5 bg-body rounded" method="post" action="<%= getServletContext().getContextPath()%>/login">
                    <div class="form-group">
                        <label class="form-label h4">Username:</label> 
                        <div><input class="form-control" type="text" name="username"/></div>
                        <div class="errorName text-danger" style="display: none;"><strong>Please enter User Name (Maximum 20 characters)</strong></div> <br/>
                    </div>                
                    <div class="form-group">
                        <label class="form-label h4">Password:</label> 
                        <div><input class="form-control" type="password" name="password"/></div>
                        <div class="errorPass text-danger" style="display: none;"><strong>Please enter Password</strong></div> <br/>
                    </div>

                    <%
                        if (session.getAttribute("failed") != null) {
                    %>
                    <div class="text-danger"><strong><%= session.getAttribute("failed")%></strong></div><br/>
                            <%
                                }
                            %>

                    <button class="btn btn-success col-md-offset-2" type="submit" name="btnLogin" value="login" disabled>Login</button>
                    <button class="btn btn-success col-md-offset-2" type="reset" name="btnCancel" value="cancel">Cancel</button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </body>
</html>
