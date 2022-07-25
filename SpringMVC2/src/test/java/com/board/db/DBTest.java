package com.board.db;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;


public class DBTest {
	
	@Test
	public void testConnection() {
		try(Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/makefw?serverTimezone=UTC","root","1234")){
			System.out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
