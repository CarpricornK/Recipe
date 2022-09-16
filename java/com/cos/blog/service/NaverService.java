package com.cos.blog.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


/**
 * 네이버 블로그 크롤링
 *
 * @author steel
 * @since 2021.02.24
 */
public class NaverService {
    // 베이스 URL
    final String baseUrl = "https://openapi.naver.com/v1/search/encyc.json?query=";

    public String search(String clientId, String secret, String _url) {
        HttpURLConnection con = null;
        String result = "";
        String clientId2 = "gG_NXP00WmRXtPH1iWmi";
        String secret2 = "qBY1udelG2";
        String _url2 = "주식";

        try {
            URL url = new URL(baseUrl + _url);
            con = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", secret);

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) result = readBody(con.getInputStream());
            else result = readBody(con.getErrorStream());

        } catch (Exception e) {
            System.out.println("연결 오류 : " + e);
        } finally {


            con.disconnect();
        }



        return result;
    }


    /**
     * 결과를 읽는다
     *
     * @param body
     * @return
     */
    public String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }



    public String crolling(String url) throws IOException {





        String burl ="https://terms.naver.com//entry.naver?docId=4368455&cid=42776&categoryId=59916";
        String aurl = burl.replaceAll("\\\\","");
        System.out.println("url변환:"+aurl);

//            String url2 = "https://namu.wiki/w/당근";
//            System.out.println("url2:"+url2);

//            String url2 = "http://www.horangi.kr/foodinfo/?t=고등어";


        Document doc = Jsoup.connect(aurl).get();
//                    .userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36")
//                    .get();




//            Elements titleElements = doc.select("h2._5-hMte-M");
//
//            Elements locationElements  = doc.select("div.MK2oyQQz");

//            네이버백과사전

        Elements titleElements = doc.select("#content > div.section_wrap > div.headword_title > h2");

        Elements locationElements  = doc.select("#naml_contents_container > p:nth-child(1)");

        Elements locationElements2  = doc.select("#SEDOC-1545119220011-517646528 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(5) > div > div > div > div > div > p > span");


//            나무위키 ↓
//            Elements titleElements = doc.select("div#app div.MK2oyQQz");
//
//            Elements locationElements  = doc.select("div.MK2oyQQz");

        System.out.println("titleElements.size : " + titleElements.size());
        System.out.println("locationElements.size : " + locationElements.size());
        System.out.println("locationElements2.size : " + locationElements2.size());
        if (titleElements.size() != 0) {

            for (int i = 0; i <= 2; i++) {

                System.out.println(i);
                String title = titleElements.get(i).text();
                // locationElements text 추출
//                    String location = locationElements.get(i).text();
                String location2 = locationElements2.get(i).text();

                System.out.println("크롤링완료제목 : " + title);
//                    System.out.println("크롤링완료내용 : " + location);
                System.out.println("크롤링완료내용2 : " + location2);
            }



        } else {

            System.out.println("사이즈가 0입니다");
        }

        return titleElements.get(1).text();
    }
}