package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/12Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {

    private static final long seiralVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", "@webServlet으로 매핑함!");
        req.getRequestDispatcher("/12Servlet/AnnoMapping.jsp").forward(req, resp);
    }

}
