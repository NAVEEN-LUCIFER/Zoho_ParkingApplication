package com.zoho.parkinglotapplication;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "Servlet_CheckIN", value = "/Servlet_CheckIN")
public class Servlet_CheckIN extends HttpServlet {

    public static Connection connection = null;
    //Creating The Query
    private static final String INSERT_QUERY = "INSERT INTO Parking(OwnerName,VehicleNumber,VehicleType,EntryTime,LotBlock) VALUES(?,?,?,?,?)";


    private static final String LotAvail = "SELECT COUNT(LotBlock) FROM Parking WHERE LotBlock = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    public String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    public String user = "root";
    public String pass = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("text/html");

        //Getting Details from the html form

        String Name = request.getParameter("OwnerName");
        String Number = request.getParameter("VehicleNo");
        String VehicleType = request.getParameter("radio");
        String EntryTime = request.getParameter("EntryTime");
        String LotBlock = request.getParameter("lot");

        out.println(Name + "<br>");
        out.println(Number + "<br>");
        out.println(VehicleType + "<br>");
        out.println(EntryTime + "<br>");
        out.println(LotBlock + "<br>");


        //Loading the  JDBC

        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        try {
            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement isAvail = connection.prepareStatement(LotAvail)) {


                isAvail.setString(1,LotBlock);
                System.out.println(LotBlock);
                ResultSet yn = isAvail.executeQuery();
                int n = 0;
                if(yn.next()){
                    String s = yn.getString("COUNT(LotBlock)");
                    n = Integer.parseInt(s);
                }
                System.out.println(n);
                if(n == 0){
                    out.println("TAKE " + LotBlock + " TO PARK YOUR VEHICLE!");
                    out.println("<form method=\"get\" action=\"Home.jsp\">\n" +
                            "    <button id=\"ReturnOpt\" class=\"ReturnOpt\">Return To Home</button>\n" +
                            "</form>");
                }else{
                    out.println("OOPS!, YOUR PREFERRED LOT IS TAKEN, PLEASE CHOOSE ANOTHER LOT.");
                    out.println("<form method=\"get\" action=\"Entry.jsp\">\n" +
                            "    <button id=\"EntryPage\" class=\"ReturnOpt\">PICK LOT</button>\n" +
                            "</form>");
                    return;
                }


                PreparedStatement ps = connection.prepareStatement(INSERT_QUERY);
                //SetValues
                ps.setString(1, Name);
                ps.setString(2, Number);
                ps.setString(3, VehicleType);
                ps.setString(4, EntryTime);
                ps.setString(5,LotBlock);


                //Execution;
                int count = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        out.flush();
        out.flush();

    }
}
