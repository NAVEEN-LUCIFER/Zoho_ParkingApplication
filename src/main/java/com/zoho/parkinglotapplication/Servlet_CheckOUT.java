package com.zoho.parkinglotapplication;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "Servlet_CheckOUT", value = "/Servlet_CheckOUT")
public class Servlet_CheckOUT extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);      //ReDirect to doPost
    }

    public String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    public String user = "root";
    public String pass = "root";

    private static final String UPDATE_QUERY = "UPDATE Parking SET ExitTime = ? WHERE VehicleNumber = ?";

    private static final String Null_Query = "UPDATE Parking SET LotBlock = NULL, EntryTime = NULL, ExitTime = NULL, VehicleType =NULL, VehicleNumber = NULL WHERE VehicleNumber = ?";

    private static final String InsertTODetails = "INSERT INTO Details(OwnerName,VehicleNumber,EntryTime,ExitTime) VALUES(?,?,?,?)";


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/HTML");

        String Number = request.getParameter("VehicleNo");
        String ExitTime = request.getParameter("ExitTime");


        out.println("Vehicle Number: " + Number + "<br>");
        out.println("Exit Time" + ExitTime + "<br>");


        //Loading the  JDBC

        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement ps = connection.prepareStatement(UPDATE_QUERY)) {

                //SetValues
                ps.setString(1, ExitTime);
                ps.setString(2, Number);

                boolean IsAvail = FindVehicle(Number);
                if (!IsAvail) {
                    out.print("This is Not Parked at this moment" + "<br>" + "Park now");
                    out.println("<form method=\"get\" action=\"Entry.jsp\">\n" +
                            "<button class=\"ReturnOpt\">Park Now</button>\n" +
                            "</form>");
                    RequestDispatcher rs = request.getRequestDispatcher("/Exit.jsp");
                    rs.include(request, response);
                } else {
                    //Execution;
                    String fare = GetFare(Number, ExitTime,response);
                    if (fare.equals("false")) {
                        out.println("PLEASE ENTER CORRECT EXIT TIME!");
                    } else {

                        out.println("Please Pay: " + fare + "&nbsp&nbsp and get your key.");
                        out.println("<form method=\"get\" action=\"Home.jsp\">\n" +
                                "    <button id=\"ReturnOpt\" class=\"ReturnOpt\">Return To Home</button>\n" +
                                "</form>");
                    }
                    RequestDispatcher rs = request.getRequestDispatcher("/Exit.jsp");
                    rs.include(request, response);
                }

            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//    ------------------------------------------------------------------------------------------------------------


//     -----------------------------------------------------------------------------------------------------------
        out.flush();
        out.close();

    }

    public boolean FindVehicle(String Number) {
        try {
            Connection connection = DriverManager.getConnection(url, user, pass);
            String str = "SELECT VehicleNumber FROM Parking";

            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet res = ps.executeQuery();

            while (res.next()) {
                String no = res.getString("VehicleNumber");
                if (no.equals(Number)) {
                    return true;
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public String GetFare(String Number, String exit_date, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        System.out.println("Before Try!");
        double total_cost = 0;


        try {
            Connection connection = DriverManager.getConnection(url, user, pass);
            String name = "SELECT OwnerName From Parking WHERE VehicleNumber = '" + Number + "'";
            String start_date = "SELECT EntryTime From Parking WHERE VehicleNumber = '" + Number + "'";
            String VType = "SELECT VehicleType FROM Parking WHERE VehicleNumber = '" + Number + "'";

            PreparedStatement st1 = connection.prepareStatement(start_date);
            ResultSet start = st1.executeQuery();
            PreparedStatement st2 = connection.prepareStatement(VType);
            ResultSet vehicle = st2.executeQuery();
            PreparedStatement st3 = connection.prepareStatement(name);
            ResultSet Name = st3.executeQuery();

            String OName = "";
            if (Name.next()) {
                OName = Name.getString("OwnerName");
            }

            String start_Date = "";
            if (start.next()) {
                start_Date = start.getString("EntryTime");
            }

            String VechileType = "";
            if (vehicle.next()) {
                VechileType = vehicle.getString("VehicleType");
            }


            Date d1 = sdf.parse(start_Date);
            Date d2 = sdf.parse(exit_date);

            long difference_In_Time = d2.getTime() - d1.getTime();
            if (difference_In_Time < 1) {
                return "false";
            }

            long difference_In_Minutes = (difference_In_Time / (1000 * 60)) % 60;
            long difference_In_Hours = (difference_In_Time / (1000 * 60 * 60)) % 24;


            long difference_In_Years = (difference_In_Time / (1000L * 60 * 60 * 24 * 365));

            long difference_In_Days = (difference_In_Time / (1000 * 60 * 60 * 24)) % 365;

            long difference_of_days_hours = difference_In_Days * 24;

            long difference_of_years_hours = difference_In_Years * 365 * 24;

            long total_hours = difference_of_years_hours + difference_of_days_hours + difference_In_Hours;

            long totalMinutes = total_hours * 60 + difference_In_Minutes;

            out.println("TOTAL TIME YOU PARKED YOUR VEHICLE AT OUR LOT: " + totalMinutes + " (In Minutes)");

            double cost_of_hour_car = 0.834, cost_of_hour_bike = 0.167;


            switch (VechileType) {
                case "bike": {
                    total_cost = totalMinutes * cost_of_hour_bike;
                    break;
                }
                case "car": {
                    total_cost = totalMinutes * cost_of_hour_car;
                    break;
                }
                default: {
                    total_cost = 0;
                }
            }

            PreparedStatement D = connection.prepareStatement(InsertTODetails);
            D.setString(1, OName);
            D.setString(2, Number);
            D.setString(3, start_Date);
            D.setString(4, exit_date);
            D.executeQuery();


            PreparedStatement Del = connection.prepareStatement(Null_Query);
            Del.setString(1, Number);

            int count = Del.executeUpdate();
            if (count == 0) {
                System.out.println("Record Not Submitted" + "<br>");
            } else {
                System.out.println("Record Stored" + "<br>");
            }

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return String.format("%,.2f", total_cost);
    }


}
