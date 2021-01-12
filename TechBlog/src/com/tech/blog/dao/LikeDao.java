package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {
	Connection con = null;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveLike(Integer pId, int uId) {
		boolean b = false;
		PreparedStatement pstmt = null;
		String qry = "insert into techblog.liketab (pid,userid) values(?,?)";
		try {
			pstmt = con.prepareStatement(qry);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);
			pstmt.executeUpdate();
			b = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return b;

	}

	public int countLike(int pId) {
		// TODO Auto-generated method stub
		int count = 0;
		PreparedStatement pstmt = null;
		String qry = "select count(*) from techblog.liketab where pid=?";
		try {
			pstmt = con.prepareStatement(qry);
			pstmt.setInt(1, pId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {

				count = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public String checkLike(int pId, int uId) {
		int count = 0;
		PreparedStatement pstmt = null;
		String qry = "select count(*) from techblog.liketab where pid=? and userid=?";
		try {
			pstmt = con.prepareStatement(qry);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {

				count = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (count == 0)
			return "unlike";
		else {
			return "like";
		}

	}

	public boolean deleteLike(int pId, int uId) {
		boolean b=false;
		PreparedStatement pstmt = null;
		String qry = "DELETE FROM techblog.liketab where pid=? and userid=?";
		try {
			pstmt = con.prepareStatement(qry);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}

}
