package com.cos.blog.controller;

import com.cos.blog.service.NaverService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URLEncoder;

@Slf4j
@Controller
public class ApiController {

    private NaverService naverService;

    @GetMapping("/search/Naver")
    public String naver(
            @RequestParam(required = false, defaultValue = "") String url
    ) {

        String id = "gG_NXP00WmRXtPH1iWmi";
        String secret = "qBY1udelG2";

        try {
            NaverService crawler = new NaverService();
            String url2 = URLEncoder.encode(url, "UTF-8");
//            String response = crawler.search(id, secret, url2);
            String repsonse2 = crawler.crolling(url2);
            System.out.println(repsonse2);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "board/search";
    }

}
