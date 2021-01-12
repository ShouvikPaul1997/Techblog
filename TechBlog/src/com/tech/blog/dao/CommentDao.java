package com.tech.blog.dao;


	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;

	public class CommentDao {
		Connection con = null;

		public CommentDao(Connection con) {
			super();
			this.con = con;
		}

		public boolean saveComment(Integer pId,String comment, int uId) {
			boolean b = false;
			PreparedStatement pstmt = null;
			String qry = "insert into techblog.commenttab (pid,comment,uid) values(?,?,?)";
			try {
				pstmt = con.prepareStatement(qry);
				pstmt.setInt(1, pId);
				pstmt.setString(2, comment);
				pstmt.setInt(3, uId);
				pstmt.executeUpdate();
				b = true;

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return b;

		}

}
