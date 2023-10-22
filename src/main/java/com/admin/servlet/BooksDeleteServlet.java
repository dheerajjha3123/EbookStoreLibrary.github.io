package com.admin.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;


/**
 * Servlet implementation class BooksDeleteServlet
 */
public class BooksDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			BookDAOImp dao=new BookDAOImp(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);
			
			HttpSession session = req.getSession(); // Removed unnecessary cast
            if (f) {
                session.setAttribute("succMsg", "Book Delete Successfully..");
                resp.sendRedirect("admin/all_books.jsp");
            } else {
                session.setAttribute("faildMsg", "Something Wrong Please try Again.."); // Corrected "faildMsg"
                resp.sendRedirect("admin/all_books.jsp");
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    
	
	
	

}
