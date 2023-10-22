package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImp;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phono=req.getParameter("phono");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phono+" "+password+" "+check+" ");
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phono);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null) {
				UserDAOImp dao=new UserDAOImp(DBConnect.getConn());
				
				boolean f2=dao.checkUser(email);
				
				if(f2) {
					
					boolean f=dao.userRegistre(us);
					
					if(f) {
						//System.out.println("User Register Success....");
						session.setAttribute("succMsg", "Registration Success...");
						resp.sendRedirect("register.jsp");
					}
					else {
						//System.out.println("Something Wrong on Server...");
						session.setAttribute("faildMsg", "Something Wrong on Server...");
						resp.sendRedirect("register.jsp");

					}
				}
				else {
					session.setAttribute("faildMsg", "User Already Exist Try with Another Email ID");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				//System.out.println("Please Check & Agree Terms & Condition");
				session.setAttribute("faildMsg", "Please Check & Agree Terms & Condition");
				resp.sendRedirect("register.jsp");
			}
			
			
			
		} catch (Exception e) {
         e.printStackTrace();
		}
	}
	
	

}
