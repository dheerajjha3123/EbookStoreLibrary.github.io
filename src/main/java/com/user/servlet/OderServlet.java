package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Book_Order;
import com.entity.Cart;

/**
 * Servlet implementation class OderServlet
 */
public class OderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {


			//HttpSession session=(HttpSession) req.getSession();
			jakarta.servlet.http.HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			
			String email=req.getParameter("email");

			String phno=req.getParameter("phono");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");

			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			CartDAOImp dao=new CartDAOImp(DBConnect.getConn());
			List<Cart> blist= dao.getByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("faildMsg","Please Add Items");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				BookOrderDAOImp dao2=new BookOrderDAOImp(DBConnect.getConn());
				
				Book_Order o=null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				Random r=new Random();
				for(Cart c:blist) {
					o=new Book_Order();
					//System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
			       o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
			       o.setUserName(name);
			       o.setEmail(email);
			       o.setPhno(phno);
			       o.setFullAdd(fullAdd);
			       o.setBookName(c.getBookName());
			       o.setAuthor(c.getAuthor());
			       o.setPrice(c.getPrice()+"");
			       o.setPaymentType(paymentType);
			      
			       orderList.add(o);
			       
				}
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("faildMsg","Choose Payment Mode");
					resp.sendRedirect("checkout.jsp");
				}

				else {
					boolean f=dao2.saveOrder(orderList);
					
					if(f) {
						resp.sendRedirect("order_success.jsp");
						
					}
					else {
						session.setAttribute("faildMsg","Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				} 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
