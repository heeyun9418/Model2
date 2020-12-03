package svc;

import vo.Dog;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.DogDAO;

public class DogViewService {

	public Dog getDogView(int id) {
		Connection conn = getConnection();
		DogDAO dogDAO = DogDAO.getInstance();
		dogDAO.setConnection(conn);
		int updateCount = dogDAO.updateReadCount(id);

		if (updateCount > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		Dog dog = dogDAO.selectDog(id);
		close(conn);
		
		return dog;
	}

}
