package com.zoho.parkinglotapplication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletCreateNewUser", value = "/ServletCreateNewUser")
public class ServletCreateNewUser extends HttpServlet {

    static String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    static String user = "root";
    static String pass = "root";

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
        String name = request.getParameter("Name");
        String psw = request.getParameter("Pass");
        String sub = request.getParameter("sub");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try {
            if (sub != null) {
                Connection connection = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps;
                int count = 0;
                String ch = "SELECT uName FROM Users";
                ps = connection.prepareStatement(ch);
                ResultSet res = ps.executeQuery();
                while (res.next()) {
                    String s = res.getString("uName");
                    System.out.println(s);
                    if (s.equals(name)) {
                        out.print("<html><head><style>h3{ display:flex; justify-content:center; align-content:center; color:red;}</style> </head><body><h3> User Name Already taken!! </h3></body></html>");
                        RequestDispatcher rd = request.getRequestDispatcher("/CreateNewUser.jsp");
                        rd.include(request, response);
                        return;
                    }
                }
                String GetStr = "INSERT INTO Users (uName, Password) VALUES ('" + name + "' , '" + psw + "');";
                System.out.println(GetStr);
                ps = connection.prepareStatement(GetStr);
                count = ps.executeUpdate();

                if (count == 0) {
                    out.print("<html><head><style>h3{ display:flex; justify-content:center; align-content:center; color:red;}</style> </head><body><h3> Record Not Stored :( </h3></body></html>");
                    RequestDispatcher rd = request.getRequestDispatcher("/CreateNewUser.jsp");
                    rd.include(request, response);
                } else {
                    out.print("<html><head><style>h3{ display:flex; justify-content:center; align-content:center; color:green;}</style> </head><body><h3> User Record  Stored :) </h3></body></html>");
                    RequestDispatcher rd = request.getRequestDispatcher("/CreateNewUser.jsp");
                    rd.include(request, response);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

