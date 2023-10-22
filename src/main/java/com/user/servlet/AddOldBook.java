package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import javax.servlet.annotation.MultipartConfig;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDetails;

@jakarta.servlet.annotation.MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories ="Old";
			String status ="Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");

			BookDetails b = new BookDetails(bookName, author, price, categories, status, fileName, useremail);
			BookDAOImp dao= new BookDAOImp(DBConnect.getConn());
						
			
			boolean f=dao.addBook(b);
			HttpSession session=req.getSession();
			if(f){
				String path= getServletContext().getRealPath("")+"book";

				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Book Add Successfully..");
				resp.sendRedirect("sell_book.jsp");
			}
			else {
				session.setAttribute("faildMsg", "Something Wrong Please try Again");
				resp.sendRedirect("sell_book.jsp");
			} 
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}

}
