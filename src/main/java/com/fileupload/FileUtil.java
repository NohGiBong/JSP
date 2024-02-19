package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class FileUtil {

    // 파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDir)
            throws ServletException, IOException {

        // Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");
        // Part 객체의 헤더값 content-disposition 값 읽기
        String partHeader = part.getHeader("content-disposition");
        //from-date; name="attachedFile"; filename="파일명.확장자"
        System.out.println("partHeader ::: " + partHeader);

        // 헤더 값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        // 전송된 파일이 있으면 디렉토리에 저장
        if (!originalFileName.isEmpty()) {
//            C://download/filename.확장자
            part.write(sDir + File.separator + originalFileName);
        }
        return originalFileName;
    }

    // 파일명 변경
    public static String renameFile(String sDir, String fileName) {
        // 확장자 잘라내기
        // temp.png
        String ext = fileName.substring(fileName.lastIndexOf("."));

        // 현재 디렉토리 내의 파일 개수 확인
        File directory = new File(sDir);
        File[] files = directory.listFiles();
        int fileCount = files != null ? files.length : 0;

        // 5자리 숫자로 포맷팅된 파일 번호 생성
        String fileNumber = String.format("%05d", fileCount);

        // 날짜_시간.확장자 새로운 파일명 생성
        String now = new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date());
        String newFileName = now + "_" + fileNumber + ext;

        // 기존 파일명을 새 파일명으로 변경
        File oldFile = new File(sDir + File.separator + fileName);
        File newFile = new File(sDir + File.separator + newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }

    // multiple 속성 추가로 2개 이상 파일 업로드
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDir)
            throws ServletException, IOException {
        // 파일명 저장을 위한 컬렉션 생성
        ArrayList<String> listFileName = new ArrayList<>();

        // Part 객체를 통해 서버로 전송된 파일명 읽어오기
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            // 파일이 아니라면 업로드 대상에서 무시
            if (!part.getName().equals("ofile")){
                continue;
            }
            System.out.println(" for문 진행 : ");
            // Part 객체의 헤더값 content-disposition 값 읽기
            String partHeader = part.getHeader("content-disposition");
            //from-date; name="attachedFile"; filename="파일명.확장자"
            System.out.println("partHeader ::: " + partHeader);

            // 헤더 값에서 파일명 잘라내기
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");
            System.out.println("원본 파일명 : " + originalFileName);
            // 전송된 파일이 있으면 디렉토리에 저장
            if (!originalFileName.isEmpty()) {
//            C://download/filename.확장자
                part.write(sDir + File.separator + originalFileName);
            }

            // 컬렉션에 추가
            listFileName.add(originalFileName);
        }
        return listFileName;
    }

    public static void download(HttpServletRequest req, HttpServletResponse resp,
                                String directory, String sfileName, String ofileName) {
        String sDir = req.getServletContext().getRealPath(directory);

        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDir, sfileName);
            InputStream inStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            } else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                    "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length());

            // 출력 스트림 초기화
            /*out.clear();*/

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream outStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int) file.length()];
            int readBuffer = 0;
            while ((readBuffer = inStream.read(b)) > 0) {
                outStream.write(b,0, readBuffer);
            }

            // 입/출력 스트림 닫음
            inStream.close();
            outStream.close();

        } catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }

    public static void deleteFile(HttpServletRequest req, String directory, String filename) {
        String sDir = req.getServletContext().getRealPath(directory);
        File file = new File(sDir + File.separator + filename);
            if (file.exists()) {
                file.delete();
            }
    }
}
