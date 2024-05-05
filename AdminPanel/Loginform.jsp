<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <title>Loginpage for Admin Page</title>
    <link rel="stylesheet" href="style.css">
    <script type="text/javascript">
        function successmsg() {
            alert("Login Successful");
            window.location.href = "dashboard.jsp"; // Redirect to dashboard.jsp on successful login
        }
        function errormsg() {
            alert("Login Unsuccessful. Please try again.");
        }
    </script>
</head>
<body>
    <div class="navbar">
        <header>
            <nav class="navi">
                <img src="images/logo.png" alt="">
                <ul>
                    <li><a href="Index.jsp">Home</a></li> <!-- Corrected the syntax here -->
                </ul>
            </nav>
        </header>
    </div>
    <br><br>
    <div class="loginbg">
        <form action="" method="post" class="loginform" autocomplete="off">
            <fieldset class="fild">
                <marquee behavior="" direction="right"><h3>Admin Login Page</h3></marquee>
                <label for="Username">Username </label><br><br>
                <input type="text" name="Uname" required><br><br>
                <label for="Password">Password </label><br><br>
                <input type="password" name="Upass" required> <br><br>
                <button type="submit">Login</button>
            </fieldset>
        </form>
    </div>
    <br>
    <div style="margin-top: 10px;">
        <%@ include file="footer.jsp" %>
    </div>

   
    <% 
    if (request.getMethod().equalsIgnoreCase("post")) { // Check if the request method is POST
        String Name = request.getParameter("Uname");
        String Pass = request.getParameter("Upass");

        try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection cnn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "#", "#");
        PreparedStatement ps = cnn.prepareStatement("DB Query");

            ps.setString(1, Name);
            ps.setString(2, Pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If the query returns a result, it means the user is authenticated
                %>
                <script type="text/javascript">
                    successmsg();
                </script>
                <%
            } else {
                // If no result is returned, it means authentication failed
                %>
                <script type="text/javascript">
                    errormsg();
                </script>
                <%
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(SQLException e2) {
            e2.printStackTrace();
        }
    }
    %>
</body>
</html>
