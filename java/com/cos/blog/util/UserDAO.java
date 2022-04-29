package com.cos.blog.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public String getUserEmail(int id) {
        String SQL = "SELECT USER_EMAIL FROM User WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,  id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}

        }
        return null; // 데이터베이스 오류
    }

    //이메일 인증확인
    public boolean getUserEmailChecked(int id) {
        String SQL = "SELECT userEmailChecked FROM User WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,  id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getBoolean(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}

        }
        return false; // 데이터베이스 오류
    }

    public boolean setUserEmailChecked(int id) {
        String SQL = "UPDATE User SET userEmailChecked = true WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,  id);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}

        }
        return false; // 데이터베이스 오류
    }
}
