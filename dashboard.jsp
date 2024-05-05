<%@ page import = "java.sql.*;" %>
<head>
    <title>Admin | Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
     <div class="dash-top">
        <h1>Administration Page</h1>
        <img src="images/admin2.png" alt="adminlogo" name="admin-logo">
        <h5>Admin</h5>
     </div>
    <section class="dashboard">
        <div class="dashboard-leftside">
            <h2>Dashboard</h2><hr>
            
        <div class="admin">
            <form action="">
            <button name="admin"><li>Admin</li></button> <br>
        </form>
        </div>

        <div class="sub-admin">
            <form action="">
            <button name="sub-admin"><li>Sub-Admin</li></button><br>
        </form>
        </div>

        <div class="suscription">
            <form action="">
            <button name="suscription"><li>Suscription</li></button><br>
            </form>
        </div>

        <div class="contact">
            <form>
           <button name="contact"> <li>Contact</li></button><br>
            </form>
        </div>

        <div class="order">
            <form action="">
            <button name="order"><li>Order Placed</li></button><br>
            </form>
        </div>

        <div class="c-order">
            <form action="">
            <button name="c-order"><li>Completed Orders</li></button><br>
            </form>
        </div>

        <div class="trash">
            <form action="">
           <button name="trash"> <li>Trash</li></button>
            </form>
        </div>
                
        </div>
        <aside class="dashboard-rightside">
            <%
           
            if(request.getParameter("admin") != null) { 
                 try{

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","#","#");
            PreparedStatement ps1 = con.prepareStatement("Table details");

            ResultSet rs1 = ps1.executeQuery();

            while(rs1.next()) { %>
            <div class="getadmin">
                
                <h2 class="adminh1">Admin Name: <%= rs1.getString(1) %> & Admin Password : <%= rs1.getString(2) %>
            <span class="trashicon" style="color:red"><i class="fa fa-trash-o"></i></span></h2> 
            </div> <%    
            }
        }
         catch(SQLException e1) {
                e1.printStackTrace();
            }
            catch(ClassNotFoundException e2) {
                e2.printStackTrace();
            }
        
            %>
            <!----End of admin section --->

            <!----- start of sub-admin creation section ---->
            <%  
            }
            else if(request.getParameter("sub-admin") != null) { %>
                <div class="create-admin">
                    <h1>Form for Sub-Admin</h1>
                    <fieldset class="sub-admin-feild">
                        <form action="subadmin"  autocomplete="off">
                            <label>Username: </label>
                            <input type="text" name="subadminname"> <br><br>
                            <label>Password: </label>
                            <input type="password" name="subadminpass"> <br> <br>
                            <button type="submit">Send</button>
                        </form>
                    </fieldset>
                </div>

                <% 
            } 
        
            else if(request.getParameter("suscription") !=null) { %>
            

            <%
            try{

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con3 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","user3","user3");
            PreparedStatement ps3 = con3.prepareStatement(" select *from SUSCRIBEDATA");

            ResultSet rs2 = ps3.executeQuery();

            while(rs2.next()) { %>
            <div class="getsuscribe">
               
                <h2><%= rs2.getString(1) %>. Mail: <%= rs2.getString(2) %>
            <span class="trashicon" style="color:red"><i class="fa fa-trash-o"></i></span></h2> 
            </div> <br>

                
           <% }
        }
         catch(SQLException e1) {
                e1.printStackTrace();
            }
            catch(ClassNotFoundException e2) {
                e2.printStackTrace();
            }
        

             }
            else if(request.getParameter("contact") != null) { %>

            <%
            try{

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con4 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","user3","user3");
            PreparedStatement ps4 = con4.prepareStatement(" select *from MESSAGEDATA");

            ResultSet rs3 = ps4.executeQuery();

            while(rs3.next()) { %>
            <div class="getmessage">
                
                <h2><%= rs3.getInt(1) %>. Name: <%= rs3.getString(2) %> Mail: <%= rs3.getString(3) %> Message: <%= rs3.getString(4) %>
            <span class="trashicon" style="color:red"><i class="fa fa-trash-o"></i></span></h2> 
            </div> <br>

                
           <% }
       }
        
         catch(SQLException e1) {
                e1.printStackTrace();
            }
            catch(ClassNotFoundException e2) {
                e2.printStackTrace();
            }
             
         }

            else if(request.getParameter("order") != null) { %>
            

           <%
           try{

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con5 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","user3","user3");
            PreparedStatement ps5 = con5.prepareStatement(" select *from ORDERDETAILS");

            ResultSet rs4 = ps5.executeQuery();

            while(rs4.next()) { %>
            <div class="getorders">
               
                <h2 style="font-size: larger;"><%= rs4.getInt(1) %>. Name: <%= rs4.getString(2) %> Mail: <%= rs4.getString(3) %> Mobile No: <%= rs4.getString(4) %>  Delivery Address: <%= rs4.getString(5) %> Confirm Address: <%= rs4.getString(6) %> Pincode: <%= rs4.getString(7) %> Quantity: <%= rs4.getString(8) %>
            <span class="trashicon" style="color:red"><i class="fa fa-trash-o"></i></span></h2> 
            </div> <br>

                
           <% }
       }
        
         catch(SQLException e1) {
                e1.printStackTrace();
            }
            catch(ClassNotFoundException e2) {
                e2.printStackTrace();
            }
             
         }


             else if(request.getParameter("c-order") != null) { %>
           <h2>C-orders</h2>

          <% } 
          else if(request.getParameter("trash") != null) { %>
          <h2>Trash</h2>

          <%} %>
        </aside>
    </section>
     
</body>
</html>