package com.cos.blog.controller;

import com.cos.blog.model.KamisDTO;
import com.cos.blog.model.MongoDTO;
import com.cos.blog.service.BoardService;
import com.cos.blog.service.NaverService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
    public String naver(Model model
            ,@RequestParam(required = false, defaultValue = "") String url
            ,@PageableDefault(size = 12, sort = "ID", direction = Sort.Direction.ASC) Pageable pageable
    ) {

        if (!url.equals("")) {
            System.out.println(!url.equals(""));

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


                Integer category_code = 100;
                JSONArray apilist = new JSONArray();

                for (int z = 0; z <= 5; ++z) {

                    try {
                        URL url5 = new URL("https://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_product_cls_code=01&p_country_code=1101&p_regday=2022-04-15&p_convert_kg_yn=N&p_item_category_code="+ category_code +"&p_cert_key=eca596ef-9bd2-4987-9ac1-15e85ae1fe3e&p_cert_id=222&p_returntype=json");

                        BufferedReader bf;

                        bf = new BufferedReader(new InputStreamReader(url5.openStream(), "UTF-8"));

                        result = bf.readLine();

                        JSONParser jsonParser2 = new JSONParser();
                        JSONObject jsonObject2 = (JSONObject) jsonParser2.parse(result);
                        JSONObject COOKRCP01Result = (JSONObject) jsonObject2.get("data");
                        JSONArray dataInfo = (JSONArray) COOKRCP01Result.get("item");

                        for (int i = 0; i < dataInfo.size(); ++i) {

                            JSONObject astro1 = (JSONObject) dataInfo.get(i);

                            String item_name = (String) ((JSONObject) dataInfo.get(i)).get("item_name");
                            String item_code = String.valueOf(((JSONObject) dataInfo.get(i)).get("item_code"));
                            String kind_name = (String) ((JSONObject) dataInfo.get(i)).get("kind_name");
                            String kind_code = (String) ((JSONObject) dataInfo.get(i)).get("kind_code");
                            String rank = (String) ((JSONObject) dataInfo.get(i)).get("rank");

//					System.out.println("CATEGORI : " + category_code);
//					System.out.println("1 : " + item_name);
//					System.out.println("2 : " + astro1);
//					System.out.println("size : " + dataInfo.size());
//					System.out.println("list : " + dataInfo);

                            apilist.add(astro1);
                            model.addAttribute("api4", dataInfo);
                            model.addAttribute("api5", apilist);

                            KamisDTO pDTO = new KamisDTO();

                            pDTO.setItem_name(item_name);
                            pDTO.setItem_code(item_code);
                            pDTO.setKind_name(kind_name);
                            pDTO.setKind_code(kind_code);
                            pDTO.setRank(rank);

                        }

                        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)

                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        category_code += 100;
                    }

                }
            } finally {
                con.disconnect();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        Page<MongoDTO> ulist = boardService.APIlist(pageable);
        ulist = boardService.APIlistsearch(url, pageable);
        model.addAttribute("api", ulist);

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