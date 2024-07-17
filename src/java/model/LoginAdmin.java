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
public class LoginAdmin implements java.io.Serializable{
    private String name;
    private int phone;
    private String email;
    private String position;
    private String password;
    
    public LoginAdmin(){}
    
    public LoginAdmin(String name, int phone, String email ,String position, String password){
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.position = position;
        this.password = password;
    }
    
    public String getName(){return name;}
    public int getPhone(){return phone;}
    public String getEmail(){return email;}
    public String getPosition(){return position;}
    public String getPassword(){return password;}
    
    public void setName(String name){this.name = name;}
    public void setPhone(int phone){this.phone = phone;}
    public void setEmail(String email){this.email = email;}
    public void setPosition(String position){this.position = position;}
    public void setPassword(String password){this.password = password;}
}
