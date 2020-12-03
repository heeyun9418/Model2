package svc;

import vo.Dog;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.DogDAO;

public class DogRegistService {

	public boolean registDog(Dog dog) {
		DogDAO dogDAO = DogDAO.getInstance();
		Connection conn = getConnection();
		dogDAO.setConnection(conn);
		boolean isRegistSuccess = false;
		int insertCount = dogDAO.insertDog(dog);

		if (insertCount > 0) {
			commit(conn);
			isRegistSuccess = true;
		} else {
			rollback(conn);
		}
		close(conn);
		return isRegistSuccess;
	}

}
