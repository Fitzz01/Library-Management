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
public class LoginUser implements java.io.Serializable{
    private int user_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    
    public LoginUser (){}
    
    public LoginUser(int user_id, String firstname, String lastname, String email, String password){
        this.user_id = user_id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
    }
    
    public int getUser_id(){return user_id;}
    public String getFirstname(){return firstname;}
    public String getLastname(){return lastname;}
    public String getEmail(){return email;}
    public String getPassword(){return password;}
    
    public void setUser_id(int user_id){this.user_id = user_id;}
    public void setFirstname(String firstname){this.firstname = firstname;}
    public void setLastname(String lastname){this.lastname = lastname;}
    public void setEmail(String email){this.email = email;}
    public void setPassword(String password){this.password = password;}
}
