package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteOldBook
 */
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOImp dao=new BookDAOImp(DBConnect.getConn());
			
			boolean f= dao.oldBookDelete(em, "Old",id);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg","Old Book Delete Successfuly");
				resp.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("faildMsg","Something Wrong in Server");
				resp.sendRedirect("old_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

  

}
