package com.sl.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTest {
    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","123456");
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery("select  * from student");
        while (resultSet.next()){
            System.out.print(resultSet.getString(1) + "\t");
            System.out.print(resultSet.getString(2) + "\t");
            System.out.print(resultSet.getString(3) + "\t");
            System.out.println(resultSet.getString(4));
        }

        statement.close();
        conn.close();
    }
}
