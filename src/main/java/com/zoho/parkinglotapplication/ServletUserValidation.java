package com.zoho.parkinglotapplication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "login", value = "/login")
public class ServletUserValidation extends HttpServlet  {
    static String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
  static  String user = "root";
   static String pass = "root";

    public static boolean admin(String uname, String psw) throws SQLException {
        Connection connection = DriverManager.getConnection(url, user, pass);
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT uName, Password FROM Users;");
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                String name = res.getString("uName");
                String pass = res.getString("Password");
                System.out.println(name+" "+pass);
                if (name.equals(uname) && pass.equals(psw)) {
                    return true;
                }
            }
        } catch (SQLException e) {
//            throw new RuntimeException(e);
            return false;
        }
        return false;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String uname = request.getParameter("uname");
        String psw = request.getParameter("psw");
        String sub = request.getParameter("submit");

        PrintWriter out = response.getWriter();
        out.print(sub);
        response.setContentType("text/html");
        if (sub != null) {
            try {
                if ((ServletUserValidation.admin(uname, psw))) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username",uname);
                    response.sendRedirect("Home.jsp");
                } else {
                    out.print("<html><head><style>h3{ display:flex; justify-content:center; align-content:center; color:red;}</style> </head><body><h3> Please Enter Correct Username and Password!! </h3></body></html>");
                    RequestDispatcher rd = request.getRequestDispatcher("/LogIN.jsp");
                    rd.include(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
