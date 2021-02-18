package dockerjava.springdocker.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {

    private JdbcTemplate jdbcTemplate;

    public String getBookName(int id) {
        String findBookByIdSQL = "SELECT book_name FROM book WHERE book_id=" + String.valueOf(id);
        return jdbcTemplate.queryForObject(findBookByIdSQL, String.class);
    }

}