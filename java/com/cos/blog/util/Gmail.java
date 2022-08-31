package com.cos.blog.util;



import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("AKIAQQ4NHTS223RWA2HS","HZs5jwmtzOqOhzB4yowllaYpLwq5mdhNzWoQfypT");
    }


}

//AKIAQQ4NHTS2S6FLZAMU
//eWuDnh448TP9OHY15WmntF3/atEMDdFPrw3d30mC