package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



import com.DAO.UserDAOImp;
import com.DB.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UpdatePorfileServlet
 */
public class UpdatePorfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phono=req.getParameter("phono");
			String password=req.getParameter("password");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phono);
			us.setPassword(password);
			
			jakarta.servlet.http.HttpSession session=req.getSession();
			UserDAOImp dao=new UserDAOImp(DBConnect.getConn());
			
			boolean f=dao.checkPassword(id, password);
			
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "Profile Updated Successfully....");
					resp.sendRedirect("edit_profile.jsp");
				}
				else {
					session.setAttribute("faildMsg", "Something Wrong on Server");
					resp.sendRedirect("edit_profile.jsp");
				}
			}
			else {
				session.setAttribute("faildMsg", "Your Password is Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
