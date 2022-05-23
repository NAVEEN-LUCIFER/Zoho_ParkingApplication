package com.zoho.parkinglotapplication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletReset", value = "/ServletReset")
public class ServletReset extends HttpServlet {

    public String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    public String user = "root";
    public String pass = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try{
            Connection connection = DriverManager.getConnection(url, user, pass);

            String del = "DELETE FROM Details";

            PreparedStatement st = connection.prepareStatement(del);
            ResultSet res = st.executeQuery();
            out.print("<html><head><script>setTimeout=(()=>{const e = document.getElementById('pop'); e.style.display = 'none';},5000)</script><style>h3{ display:flex; justify-content:center; align-content:center; color:green;}</style> </head><body><h3 id ='pop'> Record Deleted successfully! </h3></body></html>");
            RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
            rd.include(request,response);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
