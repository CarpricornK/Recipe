package com.cos.blog.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

/**
 * 네이버 블로그 크롤링
 *
 * @author steel
 * @since 2021.02.24
 */
@Service("NaverService")
public class NaverService {
    // 베이스 URL
    final String baseUrl = "https://openapi.naver.com/v1/search/encyc.json?query=";

    public String search(String clientId, String secret, String _url) {
        final String baseUrl = "https://openapi.naver.com/v1/search/encyc.json?query=";

        HttpURLConnection con = null;
        String result = "";


        try {
            URL url = new URL(baseUrl + _url);
            con = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", secret);

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) result = readBody(con.getInputStream());
            else result = readBody(con.getErrorStream());

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
            JSONArray Result2 = (JSONArray) jsonObject.get("items");

            String description = (String) ((JSONObject) Result2.get(0)).get("description");
            String link = (String) ((JSONObject) Result2.get(0)).get("link");

            System.out.println("NaverService jsonObject - " + jsonObject);
            System.out.println("NaverService Result - " + Result2);
            System.out.println("NaverService description - " + description);
            System.out.println("NaverService description - " + link);

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



    public List<String> crolling(String url4) throws IOException {

        List<String> list = new ArrayList<>(23);

        System.out.println("url4 :" + url4);


        String burl ="https://terms.naver.com//entry.naver?docId=4368455&cid=42776&categoryId=59916";
        String aurl = url4.replaceAll("\\\\","");
        String aurl2 = burl.replaceAll("\\\\","");
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

        Elements locationElements1  = doc.select("#naml_contents_container > p:nth-child(1)");
        Elements locationElements2  = doc.select("#SEDOC-1545119220011-517646528 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(5) > div > div > div > div > div > p > span");
        Elements locationElements3  = doc.select("#naml_contents_container > p:nth-child(2)");
        Elements locationElements4  = doc.select("#naml_contents_container > p:nth-child(3)");
        Elements locationElements5  = doc.select("#naml_contents_container > p:nth-child(4)");
        Elements locationElements6  = doc.select("#naml_contents_container > p:nth-child(5)");
        Elements locationElements7  = doc.select("#naml_contents_container > p:nth-child(6)");
        Elements locationElements8  = doc.select("#naml_contents_container > p:nth-child(7)");
        Elements locationElements9  = doc.select("#naml_contents_container > p:nth-child(8)");
        Elements locationElements10  = doc.select("#size_ct > p");
        Elements locationElements11  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(5) > div > div > div > div > div > p");
        Elements locationElements12  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(1) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements13  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(2) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements14  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(3) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements15  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(4) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements16  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(5) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements17  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(6) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements18  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(7) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements19  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(8) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements20  = doc.select("#SEDOC-1545118457371-1504525847 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(9) > div > div > div > div > div > p > span > span.se_fs_T3");
        Elements locationElements21  = doc.select("#SEDOC-1545117617012--388324988 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(5) > div > div > div > div > div > p > span");
        Elements locationElements22  = doc.select("#SEDOC-1545117617012--388324988 > div.se_component_wrap.sect_dsc.__se_component_area > div:nth-child(6) > div > div > div > div > div > p > span.se_fs_T3");

        list.add(titleElements.toString());
        list.add(locationElements1.toString());
        list.add(locationElements2.toString());
        list.add(locationElements3.toString());
        list.add(locationElements4.toString());
        list.add(locationElements5.toString());
        list.add(locationElements6.toString());
        list.add(locationElements7.toString());
        list.add(locationElements8.toString());
        list.add(locationElements9.toString());
        list.add(locationElements10.toString());
        list.add(locationElements11.toString());
        list.add(locationElements12.toString());
        list.add(locationElements13.toString());
        list.add(locationElements14.toString());
        list.add(locationElements15.toString());
        list.add(locationElements16.toString());
        list.add(locationElements17.toString());
        list.add(locationElements18.toString());
        list.add(locationElements19.toString());
        list.add(locationElements20.toString());
        list.add(locationElements21.toString());
        list.add(locationElements22.toString());

//            나무위키 ↓
//            Elements titleElements = doc.select("div#app div.MK2oyQQz");
//
//            Elements locationElements  = doc.select("div.MK2oyQQz");
        System.out.println("list : " + list);
        System.out.println("titleElements.size : " + titleElements.size());
        System.out.println("locationElements1.size : " + locationElements1.size());
        System.out.println("locationElements2.size : " + locationElements2.size());
        if (titleElements.size() != 0) {

            String title = titleElements.toString();

            System.out.println("크롤링완료제목 : " + title);

        } else {

            System.out.println("사이즈가 0입니다");
        }

        return list;
    }

}