package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 系统登录
 * @author admin
 * 
 *
 */
public class LoginAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
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
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
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
		this.doPost(request, response);
		out.close();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String userpwd=request.getParameter("userpwd");
		
		DBManager dbm=new DBManager();
		
		String type=request.getParameter("type");
		
		if(type.equals("用户")){
			String login=dbm.loginYH(username, userpwd);
			if(login!=null){
			   
			   request.getSession().setAttribute("card", username);
			   request.getSession().setAttribute("user", login.split(":")[0]);
			   request.getSession().setAttribute("hui", login.split(":")[1]);
			   request.getSession().setAttribute("type", "用户");
			   response.sendRedirect("index.jsp");
				
			}else{
				 
				out.println("<script>alert('用户名或密码有误！');window.location.href='login.jsp'</script>");
			 
			}
			
		}else{
			String login=dbm.login(username, userpwd);
			if(login!=null){
			   
			   request.getSession().setAttribute("user", username);
			   request.getSession().setAttribute("type", login);
			   response.sendRedirect("index.jsp");
				
			}else{
				 
				out.println("<script>alert('用户名或密码有误！');window.location.href='login.jsp'</script>");
			 
			}
		}
		
		
		
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

}
