package com.entity;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
				int bid=Integer.parseInt(req.getParameter("bid"));
				int uid=Integer.parseInt(req.getParameter("uid"));
				
				BookDAOImp dao=new BookDAOImp(DBConnect.getConn());
				BookDetails b= dao.getBookById(bid);
				
				Cart c=new Cart();
				c.setBid(bid);
				c.setUserId(uid);
				c.setBookName(b.getBookName());
				c.setAuthor(b.getAuthor());
				c.setPrice(Double.parseDouble(b.getPrice()));
				c.setTotalPrice(Double.parseDouble(b.getPrice()));
				
				CartDAOImp dao2=new CartDAOImp(DBConnect.getConn());
				boolean f=dao2.addCart(c);
				
				jakarta.servlet.http.HttpSession session= req.getSession();
				
				if(f) {
					session.setAttribute("addCart", "Book Added to Cart");
					resp.sendRedirect("all_newbooks.jsp");
					//System.out.println("Add Cart Success");
				}
				else{
					session.setAttribute("failed", "Something Wrong try Again");
					resp.sendRedirect("all_newbooks.jsp");
					//System.out.println("Not added to Card");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
