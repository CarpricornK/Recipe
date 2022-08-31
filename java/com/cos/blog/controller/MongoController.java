package com.cos.blog.controller;

import com.cos.blog.model.KamisDTO;
import com.cos.blog.service.IMongoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
public class MongoController {

    // Map 객체를 사용한 데이터 처리
    @Resource(name = "MongoService")
    private IMongoService mongoService;

    @GetMapping(value = "mongo/test")
    public String test() throws Exception {

        log.info(this.getClass().getName() + ".test Start!");

        mongoService.mongoTest();

        log.info(this.getClass().getName() + ".test End!");

        return "MongoDB Test!!";
    }

    @GetMapping(value = "mongo/test2")
    public String test2(Model model) throws Exception {

        log.info(this.getClass().getName() + ".test Start!");

        mongoService.mongoTest2();

//      model.addAttribute("kmais", mongoService.mongoTest2(););

        log.info(this.getClass().getName() + ".test End!");

        return "MongoDB Test2!!!";
    }

}



