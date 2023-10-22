package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImp;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveBookCart
 */
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImp dao=new CartDAOImp(DBConnect.getConn());
		boolean f=dao.deleteBook(bid,uid,cid);
		//HttpSession session=(HttpSession) req.getSession();
		jakarta.servlet.http.HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg","Book Removed From Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("faildMsg","Something Wrong in Server");
			resp.sendRedirect("checkout.jsp");
		}
	}
       
 
}
 