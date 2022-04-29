package com.cos.blog.util;



import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("kwon991223@gmail.com","Kyj22446688@@");
    }


}
