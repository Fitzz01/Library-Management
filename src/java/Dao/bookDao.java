/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import static java.awt.SystemColor.window;
import java.sql.*;
import model.LoginUser;
import model.book;

/**
 *
 * @author fitri
 */
public class bookDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/library1", "use", "use");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static int deleteBook(int id){
        int status = 0;
        try {
            Connection con = bookDao.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from book where book_id = ?");
            ps.setInt(1,id);
            
            status = ps.executeUpdate();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public static int deleteRecordBook(int id){
        int status = 0;
        try {
            Connection con = bookDao.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from record where record_id = ?");
            ps.setInt(1,id);
            
            status = ps.executeUpdate();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
      
    public static int updateBook(book u){
        int status = 0;
        try {
            Connection con = bookDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update book set bookname=?, category=?, dateadded=? where book_id=?");
            ps.setString(1, u.getBookname());
            ps.setString(2, u.getCategory());
            ps.setString(3, u.getDateadded());
            ps.setInt(4, u.getBook_id());
            
            status = ps.executeUpdate();
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public static book getBookById(int id){
        book k = new book();
        
        
        try{
            Connection con = bookDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from book where book_id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                k = new book();
                
                k.setBook_id(rs.getInt("book_id"));
                k.setBookname(rs.getString("bookname"));
                k.setCategory(rs.getString("category"));
                k.setDateadded(rs.getString("dateadded"));
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return k;
    }
    
        public static LoginUser getUserById(int id){
        LoginUser k = new LoginUser();
        
        
        try{
            Connection con = bookDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from user2 where user_id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                k = new LoginUser();
                
                k.setUser_id(rs.getInt("user_id"));
                k.setFirstname(rs.getString("firstname"));
                k.setLastname(rs.getString("lastname"));
                k.setEmail(rs.getString("email"));
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return k;
    }
}
