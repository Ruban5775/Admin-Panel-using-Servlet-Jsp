<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<html>
<head>
    <title>OrderForm</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript">
        function successmsg() {
            alert("Your order was Place go the Admin panel");
        }

        function errormsg() {
            alert("Your order was not placed. Please try again");
        }
        
    </script>
</head>
<body>

<div class="navbar">
    <header>
        <nav class="navi">
            <a href="Index.jsp"><img  src="images/logo.png" alt=""></a>
            <ul style="padding-left: 5px;">
                <li>
                <a href="Loginform.jsp">Admin</a>
                <a style="margin-top: -28px;" href="Index.jsp">Home</a>
            </li>
            </ul>
        </nav>
    </header>
</div><br><br><br>

<div class="orderformpage">
    <form class="orderform" autocomplete="off" action="Orderform.jsp" method="post">
        <fieldset class="order-field">
            <legend>Order Form</legend>
            <label>Name:</label> 
            <input type="text" name="Oname" required><br><br>
            <label>Email:</label> 
            <input type="email" name="Omail" required><br><br>
            <label>Mobile No:</label>
            <input type="text" name="PhoneNo" required> <br><br>
            <label>Delivery Address:</label>
            <textarea name="Daddress" required></textarea><br><br>
            <label>Confirm Address:</label>
            <textarea name="CAddress" required></textarea> <br><br>
            <label>Pincode:</label>
            <input type="text" name="pincode" required> <br><br>
            <label>Saree Quantity:</label>
            <input type="text" name="OrderQ" required><br><br>
            <button type="submit">Confirm</button>
        </fieldset>
    </form>
</div>
<div style="margin-top: 10px;">
    <%@ include file="footer.jsp" %>
 </div>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String Ordername = request.getParameter("Oname");
    String Ordermail = request.getParameter("Omail");
    String Ordermobile = request.getParameter("PhoneNo");
    String OrderAddress = request.getParameter("Daddress");
    String COrderAddress = request.getParameter("CAddress");
    String Orderpin = request.getParameter("pincode");
    String OrderQun = request.getParameter("OrderQ");

    boolean success = false;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "#", "#");
        PreparedStatement ps = conn.prepareStatement("DB Query");

        ps.setString(1, Ordername);
        ps.setString(2, Ordermail);
        ps.setString(3, Ordermobile);
        ps.setString(4, OrderAddress);
        ps.setString(5, COrderAddress);
        ps.setString(6, Orderpin);
        ps.setString(7, OrderQun);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            success = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e2) {
        e2.printStackTrace();
    }

    if (success) {
        %>
        <script>
            successmsg();
        </script>
        <%
    } else {
        %>
       <script type="text/javascript">
           errormsg();
       </script>
        <%
    }
}
%>

</body>
</html>
