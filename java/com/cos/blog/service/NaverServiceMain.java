package com.cos.blog.service;

import java.net.URLEncoder;
import java.util.Map;


/**
 * 네이버 크롤러 메인 클래스
 *
 * @author steel
 * @since 2021.02.24
 */
public class NaverServiceMain {

    public static void main(String[] args) {
        String id = "gG_NXP00WmRXtPH1iWmi";
        String secret = "qBY1udelG2";

        try {
            NaverService crawler = new NaverService();
            String url = URLEncoder.encode("미나리", "UTF-8");
            String response = crawler.search(id, secret, url);
            System.out.println(response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}