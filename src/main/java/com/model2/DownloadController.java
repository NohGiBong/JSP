package com.model2;

import com.fileupload.FileUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
        String idx = req.getParameter("idx");

        FileUtil.download(req, resp, "/Uploads", sfile, ofile);

        MVCBoardDAO dao = new MVCBoardDAO();
        dao.downCountPlus(idx);
        dao.close();
    }
}