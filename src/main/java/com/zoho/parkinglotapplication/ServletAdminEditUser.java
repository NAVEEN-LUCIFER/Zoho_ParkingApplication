package com.zoho.parkinglotapplication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletAdminEditUser", value = "/ServletAdminEditUser")
public class ServletAdminEditUser extends HttpServlet {

    String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    String user = "root";
    String pass = "root";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/HTML");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String psw = request.getParameter("pass");
        String subup = request.getParameter("update");
        String subdel = request.getParameter("delete");
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if(subdel == null){
            try {
                Connection connection = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps;
                String FindUser = "SELECT uName FROM Users";
                ResultSet res;
                ps = connection.prepareStatement(FindUser);
                res = ps.executeQuery();
                boolean avil = false;
                while (res.next()){
                    String n = res.getString("uName");
                    if(n.equals(id)){
                        avil = true;
                        break;
                    }
                }

                if(avil){
                    if(name!=null){
                        String s = "UPDATE Users SET uName = '" + name + "' WHERE uName = '" + id + "'";
                        ps = connection.prepareStatement(s);
                        ps.executeUpdate();
                        out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:green\"> Data Updated </h3>");
                        RequestDispatcher rd = request.getRequestDispatcher("/AdminEditUser.jsp");
                        rd.include(request, response);
                    }
                    if(psw!=null){
                        String s = "UPDATE Users SET Password = '" + psw + "' WHERE uName = '" + id + "'";
                        ps = connection.prepareStatement(s);
                        ps.executeUpdate();
                        out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:green\"> Data Updated </h3>");
                        RequestDispatcher rd = request.getRequestDispatcher("/AdminEditUser.jsp");
                        rd.include(request, response);
                    }
                }
                else{
                    out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:red\"> No User Found :( </h3>");
                    RequestDispatcher rd = request.getRequestDispatcher("/AdminEditUser.jsp");
                    rd.include(request, response);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        } else if (subup == null) {

            try {
                Connection connection = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps;
                String FindUser = "SELECT uName FROM Users";
                ResultSet res;
                ps = connection.prepareStatement(FindUser);
                res = ps.executeQuery();
                boolean avil = false;
                while (res.next()) {
                    String n = res.getString("uName");
                    if (n.equals(id)) {
                        avil = true;
                        break;
                    }
                }
                if(avil){
                    String s = "DELETE FROM Users WHERE uName = '" + id + "'";
                    ps = connection.prepareStatement(s);
                    ps.executeUpdate();
                    out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:red\"> User Deleted :( </h3>");
                    RequestDispatcher rd = request.getRequestDispatcher("/AdminEditUser.jsp");
                    rd.include(request, response);
                }else{
                    out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:green\"> No User Found :( </h3>");
                    RequestDispatcher rd = request.getRequestDispatcher("/AdminEditUser.jsp");
                    rd.include(request, response);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }

        }
    }
}
