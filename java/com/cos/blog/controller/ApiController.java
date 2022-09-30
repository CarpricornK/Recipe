package com.cos.blog.controller;

import com.cos.blog.service.BoardService;
import com.cos.blog.service.NaverService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@Slf4j
@Controller
public class ApiController {

    @Autowired
    private BoardService boardService;

    @Resource
    private NaverService naverService;

    @GetMapping("/search/Naver")
    public String naver(Model model,
                        @RequestParam(required = false, defaultValue = "") String url
    ) {

        String id = "gG_NXP00WmRXtPH1iWmi";
        String secret = "qBY1udelG2";

        try {
            NaverService crawler = new NaverService();
            String url2 = URLEncoder.encode(url, "UTF-8");

            final String baseUrl = "https://openapi.naver.com/v1/search/encyc.json?query=";

            HttpURLConnection con = null;
            String result = "";


            try {
                URL Apiurl = new URL(baseUrl + url2);
                con = (HttpURLConnection) Apiurl.openConnection();

                con.setRequestMethod("GET");
                con.setRequestProperty("X-Naver-Client-Id", id);
                con.setRequestProperty("X-Naver-Client-Secret", secret);

                int responseCode = con.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) result = readBody(con.getInputStream());
                else result = readBody(con.getErrorStream());

                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
                JSONArray Result2 = (JSONArray) jsonObject.get("items");

                String description = (String) ((JSONObject) Result2.get(0)).get("description");
                String url4 = (String) ((JSONObject) Result2.get(0)).get("link");

                System.out.println("----------- 네이버 백과사전 -----------");
                System.out.println("NaverService jsonObject - " + jsonObject);
                System.out.println("NaverService Result - " + Result2);
                System.out.println("NaverService description - " + description);
                System.out.println("NaverService description - " + url4);
                System.out.println("----------- 네이버 백과사전 완료 -----------");

                System.out.println("----------- 크롤링 -----------");
                List<String> list2 = crawler.crolling(url4);
                System.out.println("list2 : " + list2);
                System.out.println("----------- 크롤링 완료 -----------");

                model.addAttribute("list1", Result2);
                model.addAttribute("list2", list2);
                model.addAttribute("list3", boardService.foodlist());


            } finally {
                con.disconnect();
            }






        } catch (Exception e) {
            e.printStackTrace();
        }

        return "board/search";
    }


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

}