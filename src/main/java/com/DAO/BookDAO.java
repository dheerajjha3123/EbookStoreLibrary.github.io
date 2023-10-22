package com.DAO;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;


// This Classs Using to Impliment Book interface 
public interface BookDAO {
	public boolean addBook(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email,String cat,int id);

	public List<BookDetails> getBookBySearch(String ch);
}
