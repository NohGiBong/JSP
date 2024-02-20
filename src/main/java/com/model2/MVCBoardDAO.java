package com.model2;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool { // 커넥션 풀 상속
    public MVCBoardDAO() {
        super();
    }

    // 검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map< String, Object > map) {
        int totalCount = 0;

        String query = "select count(*) from scott.mvcboard";
        if(map.get("searchWords") != null) {
            query += " WHERE "+ map.get("searchField") + " "
                    + " Like '%" + map.get("searchWords") + "%'";
        }
        // SELECT COUNT(*) FROM board_jsp
        // WHERE title '%검색어%';

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MVCBoard selectCount 오류 발생");
        }
        return totalCount;
    }

    // 검색 조건에 맞는 게시물 목록을 반환
    public List<MVCBoardDTO> selectListPage(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<MVCBoardDTO> bbs = new ArrayList<>();
        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.mvcboard";
        if(map.get("searchWord") != null){
            query += " WHERE "  + map.get("searchField") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY idx DESC"
                + " ) Tb"
                + " )"
                + " WHERE rNum BETWEEN ? AND?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            System.out.println("start : " + map.get("start"));
            System.out.println("end : " + map.get("end"));
            rs = psmt.executeQuery();

            while(rs.next()){
                //한 row의 내용을 DTO에 저장
                MVCBoardDTO dto = new MVCBoardDTO();

                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

                bbs.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectList 오류발생");
        }
        return bbs;
    }

    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO scott.mvcboard ("
                    + " idx, name, title, content, ofile, sfile, pass) "
                    + " VALUES ( "
                    + " scott.seq_board_num.NEXTVAL,?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getPass());

            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    //파라메터 idx 값에 따라 게시물 가져오기
    public MVCBoardDTO selectView(String idx) {
        MVCBoardDTO dto = new MVCBoardDTO();

        String query = "SELECT * FROM scott.mvcboard WHERE idx=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
            }

        } catch (Exception e) {
            System.out.println("selectView 오류 발생");
            e.printStackTrace();
        }
        return dto;
    }

    public void updateVisitCount (String idx) {
        String query = "UPDATE scott.mvcboard SET "
                    + " visitcount = visitcount + 1 "
                    + " WHERE idx = ? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            psmt.executeQuery();

        } catch (Exception e) {
            System.out.println("updateVisitCount 오류 발생");
            e.printStackTrace();
        }
    }

    public void downCountPlus(String idx) {
        String sql = "UPDATE scott.mvcboard SET "
                + " downcount = downcount + 1 "
                + " WHERE idx = ? ";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, idx);
            psmt.executeUpdate();
            } catch (Exception e) {}
    }


    public boolean confirmPassword(String pass, String idx) {
    boolean isCorr = true;
        String sql = "SELECT COUNT(*) FROM scott.mvcboard WHERE pass=? AND idx=?";
    try {
        psmt = con.prepareStatement(sql);
        psmt.setString(1, pass);
        psmt.setString(2, idx);
        rs = psmt.executeQuery();
        rs.next();
        if (rs.getInt(1) == 0) {
            isCorr = false;
        }
    } catch (Exception e) {
        isCorr = false;
        e.printStackTrace();
    }
        return isCorr;
    }

    public int deletePost(String idx) {
        int result = 0;
            String query = "DELETE FROM scott.mvcboard WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    public int updatePost(MVCBoardDTO dto) {
        int result = 0;
        String query = "UPDATE scott.mvcboard"
                + " SET title=?, name=?, content=?, ofile=?, sfile=? "
                + " WHERE idx=? and pass=? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getName());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getIdx());
            psmt.setString(7, dto.getPass());

            // 쿼리문 실행
            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("게시물 수정 중 오류 발생");
            e.printStackTrace();
        }
        return result;
    }
}
