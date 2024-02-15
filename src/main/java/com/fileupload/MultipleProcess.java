package com.fileupload;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/13/MultipleProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)

public class MultipleProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
    try {
            // 드라이브 명으로 절대경로 지정하기
            // saveDirectory = C:\hahaha\jsp\src\main\webapp\Uploads
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            System.out.println("saveDir 확인" + saveDirectory);

            // 다중 파일 업로드
            ArrayList<String> listFileName = FileUtil.multipleFile(req, saveDirectory);
            System.out.printf("list ::" + listFileName);
            for(String originalFileName : listFileName) {
                // 저장된 파일명 변경
                String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
                System.out.printf("저장된 파일이름 변경" + savedFileName);
                // DB에 저장하기
                insertMyFile(req, originalFileName, savedFileName);
                }

            // 파일 내용 전송 하기
            resp.sendRedirect("FileList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "파일 업로드 오류");
            req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
        }
    }

    private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
        String title = req.getParameter("title");
        String[] cateArray = req.getParameterValues("cate");
        StringBuffer catebuff = new StringBuffer();
        int index = 0; /* 변수 값 하나 추가 */
        if (cateArray == null) {
            catebuff.append("선택한 항목 없음");
        }
        else {
            for (String s : cateArray) {
                if (index != cateArray.length - 1) { /* cateArray 배열의 최대 갯수보다 index의 숫자가 작을 경우 콤마 붙임 */
                    catebuff.append(s + ", ");
                } else {                            /* cateArray 배열의 최대 갯수와 index의 숫자가 일치할 경우 콤마 없음 */
                    catebuff.append(s);
                }
                index++; /* 1씩 증가*/
            }
        }


//        else {
//            for (int i = 0; i < cateArray.length; i++) {
//                catebuff.append(cateArray[i]);
//                if (i != cateArray.length - 1) {
//                    catebuff.append(", ");
//                }
//            }
//        }
        System.out.println("파일 외 폼값 :: " + title + "    " + catebuff.toString());

        // DB 입력하기
        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(catebuff.toString());
        dto.setOfile(oFileName);
        dto.setSfile(sFileName);

        // DAO를 통해 DB에 반영
        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}
