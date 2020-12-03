package svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;
import dao.DogDAO;
import vo.Dog;

public class DogListService {

	public ArrayList<Dog> getDogList() {
		DogDAO dogDAO = DogDAO.getInstance();
		Connection conn = getConnection();
		dogDAO.setConnection(conn);
		ArrayList<Dog> dogList = dogDAO.selectDogList();
		close(conn);

		return dogList;
	}

}
