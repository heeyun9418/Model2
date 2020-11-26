package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardListService {

	public int getListCount() throws Exception {
		int listCount = 0;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectListCount();
		close(conn);
		return listCount;

	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) throws Exception {
		ArrayList<BoardBean> articleList = null;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		articleList = boardDAO.selectArticleList(page, limit);
		close(conn);
		return articleList;
	}
}
