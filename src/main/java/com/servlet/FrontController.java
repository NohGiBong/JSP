package com.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);
        /* <li><a href="../12Servlet/regist.one">회원가입</a></li> 마지막 슬래쉬 뒤를 잘라서 그 값을 가져옴*/
        
        if (commandStr.equals("/regist.one"))
            registFunc(req);
        else if (commandStr.equals("/login.one"))
            loginFunc(req);
        else if (commandStr.equals("/freeboard.one"))
            freeboardFunc(req);
        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/12Servlet/FrontController.jsp").forward(req, resp);
        
    }
    
    void registFunc(HttpServletRequest req) {
        req.setAttribute("resultvalue", "<h2>회원가입</h2>");
    }
    void loginFunc(HttpServletRequest req) {
        req.setAttribute("resultvalue", "<h2>로그인</h2>");
    }
    void freeboardFunc(HttpServletRequest req) {
        req.setAttribute("resultvalue", "<h2>자유게시판</h2>");
    }
}
