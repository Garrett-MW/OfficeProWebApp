<%-- 
    Document   : customerOrders
    Created on : Oct 9, 2024, 3:54:29 PM
    Author     : garrett
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Open Orders</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300..700&display=swap" rel="stylesheet">
    <style>
        
        table{
            margin: auto;
            text-align: center;
            border: 4px solid black;
            border-collapse: collapse;
            width: 75%;
        }

        table, th, td{
            border: 2px solid black;
        }

        caption{
            font-size: 30px;
            font-weight: bolder;
        }

        #container{
            margin-top: 2%;
            margin-bottom: 5%;
        }
        

    </style>
</head>
<body>
    <header>
        <h1>Office Pro</h1>
        <nav>
            <ul>
                <li><a href="products.html" class="button">Products</a></li>
                <li class="nav-item">
                    <!-- Placeholder for dropdown or additional nav items -->
                </li>
                <li><a href="checkout.html" class="button">Checkout</a></li>
                <li><a href="order.html" class="button">Order</a></li>
            </ul>
        </nav>
    
        <!-- Search Form -->
        <form id="search-form" action="search_results.html" method="get" aria-label="Search for office products">
            <input type="search" id="search-query" name="query" placeholder="Search products..."
                aria-label="Search products" required>
            <button type="submit" class="button">Search</button>
        </form>
    </header>
    
    <section class="office-supplies">
        <h2>Open Orders</h2>
        <img src="images/supplies.jpg" alt="Office Supplies" class="supplies-image">
    </section>
        <div id="container">
           <table>
                <caption>Open Orders Table</caption>
                <tr>
                    <th>Order #</th>
                    <th>Customer ID</th>
                    <th>Status</th>
                </tr><%
                    try {
                        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                        Connection con = DriverManager
                            .getConnection("jdbc:ucanaccess:///Users/garrett/Desktop/AdvancedProjectSystems/OfficeSupply.mdb");
                        Statement st = con.createStatement();
                        String sql;
                        sql = "SELECT * FROM Order WHERE AcctID = 2222";
                        ResultSet rs = st.executeQuery(sql);
           
                        while(rs.next()){
                            %><tr>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(4)%></td>
                            </tr><%
                        }
            
                        con.close();

                        } catch (Exception ex) {
                             System.out.println(ex);
                        }%>
           </table>
        </div>
        <footer>
            <p>&copy; 2024 Office Pro. All rights reserved.</p>
        </footer>
</body>
</html>
