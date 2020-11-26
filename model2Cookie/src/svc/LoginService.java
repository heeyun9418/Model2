package svc;

import vo.Member;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.LoginDAO;

public class LoginService {

	public Member getLoginMember(String id, String passwd) {
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection conn = getConnection();
		loginDAO.setConnection(conn);
		Member loginMember = loginDAO.selectLoginMember(id, passwd);
		close(conn);
		return loginMember;
	}

}
