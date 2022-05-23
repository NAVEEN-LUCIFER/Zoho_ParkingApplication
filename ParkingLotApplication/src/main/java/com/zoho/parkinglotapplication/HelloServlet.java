package com.zoho.parkinglotapplication;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/JSON");
        response.setCharacterEncoding("UTF-8");
        // Hello
        PrintWriter out = response.getWriter();
//
        out.flush();
        out.close();


    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //doPost(request, response);
    }

}