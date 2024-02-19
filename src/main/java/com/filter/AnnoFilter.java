package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "AnnoFilter", urlPatterns = "/15/AnnoFilter.jsp")
public class AnnoFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String searchFiled = req.getParameter("searchFiled");
        String searchWord = req.getParameter("searchWord");
        System.out.println("검색 필드 : " + searchFiled);
        System.out.println("검색어 : " + searchWord);
        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
