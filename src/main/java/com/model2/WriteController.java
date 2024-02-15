package com.model2;

import com.fileupload.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class WriteController extends HttpServlet {

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException, ServletException {
        req.getRequestDispatcher("/14/Write.jsp").forward(req, resp);
    }
    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException, ServletException {

        // 1. 파일 업로드 처리
        // 업로드 디렉토리의 물리적 경로 확인
        String sDir = getServletContext().getRealPath("/Uploads");

        // 파일 업로드
        String oFileName = "";
        try {
            oFileName = FileUtil.uploadFile(req, sDir);
        } catch (Exception e) {
            // 파일 업로드 실패
            System.out.println("파일 업로드 실패");
            JSFunction.alertLocation(resp, "파일 업로드 오류.", "../mvcboard/write.do");
            return;
        }

        // 2. 파일 업로드 외 처리
        // 폼값을 DTO에 저장
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setName(req.getParameter("name"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setPass(req.getParameter("pass"));

        // 원본 파일명과 저장된 파일 이름 설정
        if (oFileName != "" && oFileName != "") {
            //첨부 파일이 있을 경우 파일명 변경
            String saveFileName = FileUtil.renameFile(sDir, oFileName);

            dto.setOfile(oFileName);
            dto.setSfile(saveFileName);
        }


        // DAO를 통해 DB 저장
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        // 글쓰기 성공
        if (result == 1) {
            resp.sendRedirect("../mvcboard/list.do");
        }
        // 글쓰기 실패
        else {
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
        }
    }
}
