package com.cos.blog.controller;

import com.cos.blog.service.BoardService;
import com.cos.blog.service.MongoService;
import com.cos.blog.service.UserService;
import com.cos.blog.service.impl.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;

@Controller
public class RBoardController {

    @Resource(name="BoardService")
    private IBoardService iboardService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private UserService userService;

    @Autowired
    private MongoService mongoService;

    @GetMapping("/rboard/{ID}/RupdateForm")
    public String updateForm(@PathVariable int ID, Model model) {
        model.addAttribute("board", boardService.recipedetail(ID));
        return "board/RupdateForm";
    }


}
