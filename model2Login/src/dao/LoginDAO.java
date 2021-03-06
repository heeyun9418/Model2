package dao;

import static db.JdbcUtil.*;
import vo.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	private static LoginDAO loginDAO;
	private Connection conn;

	private LoginDAO() {

	}

	public static LoginDAO getInstance() {
		if (loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public Member selectLoginMember(String id, String passwd) {
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE id=? AND passwd=?");
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginMember = new Member();
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setAge(rs.getInt("age"));
				loginMember.setEmail(rs.getString("email"));
				loginMember.setGender(rs.getString("gender"));
				loginMember.setId(rs.getString("id"));
				loginMember.setName(rs.getString("name"));
				loginMember.setNation(rs.getString("nation"));
				loginMember.setPasswd(rs.getString("passwd"));
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			try {
				close(pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}

	public int insertMember(Member member) {
		PreparedStatement pstmt = null;
		int joinMember = 0;
		try {
			String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getAddr());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getName());
			pstmt.setString(8, member.getNation());
			joinMember = pstmt.executeUpdate();
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				close(pstmt);
		}
		return joinMember;
	}

}
