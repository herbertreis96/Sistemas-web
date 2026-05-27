package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

    private static final String URL =
            "jdbc:mysql://db:3306/universidade?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";

    private static final String USER = "user";

    private static final String PASSWORD = "User@123";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro na conexão: " + e.getMessage()
            );
        }
    }
}