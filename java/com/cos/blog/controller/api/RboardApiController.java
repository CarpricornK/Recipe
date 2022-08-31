package com.cos.blog.controller.api;

import com.cos.blog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RboardApiController {

    @Autowired
    private BoardService boardService;


}
