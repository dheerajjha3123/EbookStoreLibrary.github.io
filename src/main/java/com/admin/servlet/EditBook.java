package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.http.HttpSession; // Corrected import

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDetails;


public class EditBook extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("status");

            BookDetails b = new BookDetails();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);

            BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
            boolean f = dao.updateEditBooks(b); // Correct method name

            HttpSession session = req.getSession(); // Removed unnecessary cast
            if (f) {
                session.setAttribute("succMsg", "Book Update Successfully..");
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
