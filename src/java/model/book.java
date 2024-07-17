/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author fitri
 */
public class book implements java.io.Serializable {

    private int book_id;
    private String bookname;
    private String category;
    private String dateadded;

    public book(){
        book_id = 0;
        bookname = null;
        category = null;
        dateadded = null; 
    }

    public book(int book_id, String bookname, String category, String dateadded) {
        this.book_id = book_id;
        this.bookname = bookname;
        this.category = category;
        this.dateadded = dateadded;
    }

    public int getBook_id() {
        return book_id;
    }

    public String getBookname() {
        return bookname;
    }

    public String getCategory() {
        return category;
    }

    public String getDateadded() {
        return dateadded;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setDateadded(String dateadded) {
        this.dateadded = dateadded;
    }
    
}
