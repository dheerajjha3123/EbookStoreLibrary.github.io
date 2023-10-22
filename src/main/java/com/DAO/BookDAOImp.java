package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

// This class Using to Implement the book details 

public class BookDAOImp implements BookDAO {

	private Connection conn;

	public BookDAOImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBook(BookDetails b) {

		boolean f= false;
		try {
			// This Statement using to connect the database table  in the database
			
			String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, b.getBookName());
           ps.setString(2, b.getAuthor());
           ps.setString(3, b.getPrice());
           ps.setString(4, b.getBookCategory());
           ps.setString(5, b.getStatus());
           ps.setString(6, b.getPhotoName());
           ps.setString(7, b.getEmail());
           
           int i=ps.executeUpdate();
           if(i==1) {
        	   f=true;
           }
          

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {

		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			
			String sql= "SELECT * FROM book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {

		BookDetails b=null;
		try {
			String sql="SELECT * FROM book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	
	public boolean updateEditBooks(BookDetails b) {
		boolean f= false;
		try {
			String sql="update book_dtls set bookname=?,author=?,price=?,status=? where bookId=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int i=ps.executeUpdate();	
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=8) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=8) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=8) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() ) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String email, String cate){
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			
			String sql="select * from book_dtls where bookCategory=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat,int id) {
		boolean f= false;
		
		try {
			String sql="delete from book_dtls where  bookCategory=? and email=? and bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			
			String sql="select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	

}
