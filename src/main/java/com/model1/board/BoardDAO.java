package com.model1.board;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO extends DBConnPool {

    public BoardDAO() {

        super();
    }
    public int selectCount(Map < String, Object > map) {
        int totalCount = 0;

        String query = "select count(*) from board_jsp";
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
            System.out.println("selectCount 오류 발생");
        }
        return totalCount;
    }

    public List<BoardDTO> selectListPage(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();
        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.board_jsp";
        if(map.get("searchWord") != null){
            query += " WHERE "  + map.get("searchField") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY num DESC"
                + " ) Tb"
                + " )"
                + " WHERE rNum BETWEEN ? AND?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(1, map.get("start").toString());

            rs = psmt.executeQuery();
            while(rs.next()){
                //한 row의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));
                bbs.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectList 오류발생");
        }
        return bbs;
    }


    // 게시글 수정
    public int updateEdit(BoardDTO dto){
        int result = 0;

        String query = "UPDATE scott.board_jsp"
                + " SET title = ? , content = ?"
                + " WHERE num = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(1, dto.getContent());
            psmt.setString(1, dto.getNum());

            result = psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("update 오류 발생");
        }
        return result;
    }

    // 게시글 삭제

    //게시글 삭제
    public int deletePost(BoardDTO dto){
        int result = 0;

        String query = "DELETE FROM scott.board_jsp WHERE num = ? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getNum());

            result = psmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("deletePost 오류 발생");
        }
        return result;
    }
}




