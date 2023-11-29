package com.biyeseng.action;	
	
import java.io.IOException;	
import java.io.PrintWriter;	
import java.sql.*;	
import java.util.Calendar;
	
import javax.servlet.ServletException;	
import javax.servlet.http.HttpServlet;	
import javax.servlet.http.HttpServletRequest;	
import javax.servlet.http.HttpServletResponse;	
	
import com.biyeseng.db.DBManager;	
	
/**
 * 添加借用
 * @author admin
 * 
 *
 */
public class AddJieyueAction extends HttpServlet {	
	
	/**	
	 * Constructor of the object.	
	 */	
	public AddJieyueAction() {	
		super();	
	}	
	
	/**	
	 * Destruction of the servlet. <br>	
	 */	
	public void destroy() {	
		super.destroy(); // Just puts "destroy" string in log	
		// Put your code here	
	}	
	
	/**	
	 * The doPost method of the servlet. <br>	
	 *	
	 * This method is called when a form has its tag value method equals to post.	
	 * 	
	 * @param request the request send by the client to the server	
	 * @param response the response send by the server to the client	
	 * @throws ServletException if an error occurred	
	 * @throws IOException if an error occurred	
	 */	
	public void doGet(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String bid=request.getParameter("bid");
		
		java.util.Date tdate=new java.util.Date();
		String jdate=tdate.toLocaleString();
		Calendar calender = Calendar.getInstance();
        calender.setTime(tdate);
        calender.add(Calendar.MONTH, 1);
		
		String qdate=calender.getTime().toLocaleString();
		String ucard=request.getSession().getAttribute("card")+"";
		 
			
		DBManager dbm = new DBManager();	
			
		String sql = "insert into jieyue(bid,jdate,qdate,ucard) values('"+bid+"','"+jdate+"','"+qdate+"','"+ucard+"')";	
	    String bsql="update book set kucun=kucun-1 where id="+bid;
		Statement stat = null;	
		Connection conn=null;	
		try {	
			conn=dbm.getConnection();	
			stat = conn.createStatement();	
			System.out.println(sql);	
			System.out.println(bsql);
			stat.execute(sql);	
			stat.execute(bsql);	
		} catch (SQLException e) {	
			// TODO Auto-generated catch block	
			e.printStackTrace();	
		} finally {	
			try {	
				if(stat!=null)	
					stat.close();	
				if(conn!=null)	
					conn.close();	
			} catch (SQLException e) {	
				// TODO Auto-generated catch block	
				e.printStackTrace();	
			}	
		}	
		 	
		out.println("<script>alert('借阅成功，请及时归还！');window.location.href='book/jylist.jsp'</script>");
		out.flush();	
		out.close();	
	}	
	
	/**	
	 * Initialization of the servlet. <br>	
	 *	
	 * @throws ServletException if an error occurs	
	 */	
	public void init() throws ServletException {	
		// Put your code here	
	}	
	
	
	public static void main(String[] args) {
		
	} 
	
}	
