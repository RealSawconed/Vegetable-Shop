<%-- 
    Document   : vegetableList
    Created on : 15-Jul-2023, 13:18:04
    Author     : ASUS PC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.vegetableDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                $('#table_id').DataTable();
            });
        </script>
    </head>
    <body>
        <% vegetableDAO vDao = new vegetableDAO();%>
        <div class="container">


            <div class="text-end mb-3 mt-3 h2 text-success">Total vegetables: <%= vDao.getTotal()%></div>

            <div class="shadow-lg p-5 mb-5 bg-body rounded">
                <table id="table_id" class="display h4">
                    <thead>
                        <tr>
                            <th>Vegetable ID</th>
                            <th>Vegetable Name</th>
                            <th>Vegetable Description</th>
                            <th>Vegetable Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs = vDao.getAll();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("VegetableID")%></td>
                            <td><%= rs.getString("NameOfVegetable")%></td>
                            <td><%= rs.getString("Description")%></td>
                            <td><%= rs.getDouble("Price")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>            
        </div>
    </body>
</html>
