<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.proxy.db.MySqlDatabaseConnection" %>
<%@ page import="com.proxy.db.DatabaseConfig" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books List</title>
</head>
<body>
    <h1>List of Books</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
        </tr>
        <% 
            try {
                // Database configuration
                String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
                String jdbcUsername = "root";
                String jdbcPassword = "admin";

                // Create DatabaseConfig instance
                DatabaseConfig conf = new DatabaseConfig(jdbcURL, jdbcUsername, jdbcPassword);

                // Create MySqlDatabaseConnection instance
                MySqlDatabaseConnection dbConnection = new MySqlDatabaseConnection(conf);

                // Get database connection
                Connection conn = dbConnection.getConnection();

                // Prepare SQL statement
                String sql = "SELECT id, title, author FROM books";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Execute query
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set and display book information
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("author") %></td>
                    </tr>
        <%
                }
                
                // Close resources
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
