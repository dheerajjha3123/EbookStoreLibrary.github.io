package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.annotation.MultipartConfig;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books") // Calling servlet 
@jakarta.servlet.annotation.MultipartConfig // This function using to getting the File in Server
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookDetails b = new BookDetails(bookName, author, price, categories, status, fileName, "admin");
			//System.out.println(b); Using just testing purpose
			BookDAOImp dao= new BookDAOImp(DBConnect.getConn());
						
			
			boolean f=dao.addBook(b);
			HttpSession session=req.getSession();
			if(f){
				String path= getServletContext().getRealPath("")+"book";

				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Book Add Successfully..");
				resp.sendRedirect("admin/add_books.jsp");
			}
			else {
				session.setAttribute("faildMsg", "Something Wrong Please try Again");
				resp.sendRedirect("admin/add_books.jsp");
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
