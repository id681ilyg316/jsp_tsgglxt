package com.biyeseng.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库管理类
 * @author admin
 * 
 *
 */
public class DBManager {

	public static final String DEFAULT_DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	public static final String DEFAULT_DB_URL = "jdbc:mysql://www.icodedock.com:3306/tsgglxt?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8&allowPublicKeyRetrieval=true";

	public static String DB_URL = null;

	public static Properties prop = null;

	// 获取数据连接
	public Connection getConnection() {

		Connection coon = null;
		try {
			Class.forName(DEFAULT_DRIVER_NAME);
			coon = DriverManager.getConnection(DEFAULT_DB_URL, "tsgglxt", "tsgglxt");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coon;
	}

	public static void main(String[] args) {
		DBManager manager = new DBManager();
		manager.getConnection();
	}

	public String login(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from admin where userName='"
							+ username + "' and userPw='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString("type");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String loginYH(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon.prepareStatement("select * from hui where card='"
					+ username + "' and pass='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString("name") + ":" + rs.getString("state");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean hasId(String goodsid) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon.prepareStatement("select * from kucun where goodsid='"
					+ goodsid + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static String TextToHtml(String sourcestr) {
		int strlen;
		String restring = "", destr = "";
		strlen = sourcestr.length();
		for (int i = 0; i < strlen; i++) {
			char ch = sourcestr.charAt(i);
			switch (ch) {
			case '<':
				destr = "<";
				break;
			case '>':
				destr = ">";
				break;
			case '\"':
				destr = "\"";
				break;
			case '&':
				destr = "&";
				break;
			case 13:
				destr = "<br>";
				break;
			case 32:
				destr = "&nbsp;";
				break;
			default:
				destr = "" + ch;
				break;
			}
			restring = restring + destr;
		}
		return "" + restring;
	}
}
