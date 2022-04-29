package com.cos.blog.controller;

import com.cos.blog.model.Favorites;
import com.cos.blog.service.MongoService;
import com.cos.blog.service.UserService;
import com.cos.blog.service.impl.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.service.BoardService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BoardController {

	@Resource(name="BoardService")
	private IBoardService iboardService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;

	@Autowired
	private MongoService mongoService;

	@GetMapping({ "", "/" })
	public String index(Model model,
			@PageableDefault(size = 21, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록(pageable));
		model.addAttribute("boards2", boardService.글목록2());
		return "index";
	}

	@GetMapping("/board")
	public String BoardMain(Model model, @PageableDefault(size = 21, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록(pageable));
		return "board/BoardMain";
	}

	@GetMapping("/user/Favorite")
	public String favorite(Model model, @PageableDefault(size = 50, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {
		model.addAttribute("boards", boardService.글목록(pageable));
		model.addAttribute("favorites", boardService.즐겨찾기목록(pageable));

		List<Favorites> rList = iboardService.getFavoriteList();
		System.out.println(rList);
		model.addAttribute("rList", rList);

		return "/user/Favorite";
	}



	

	
	// /WEB-INF/views/index.jsp

	@GetMapping("/board/{ID}")
	public String findById(@PathVariable int ID, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("board", boardService.글상세보기(ID));
		model.addAttribute("reply", boardService.댓글목록());
		model.addAttribute("replyp", boardService.댓글목록2(pageable));
		return "board/detail";

	}

	@GetMapping("/board/{ID}/updateForm")
	public String updateForm(@PathVariable int ID, Model model) {
		model.addAttribute("board", boardService.글상세보기(ID));
		return "board/updateForm";
	}


// USER 권한이 필요
//    @GetMapping("/user/Favorite")
//    public String Favorite() {
//	  return "user/Favorite";
//}

    @GetMapping("/user/My")
    public String My() {
	    return "user/My";
    }

	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}

	@GetMapping("/board/APIForm")
	public String APIForm(Model model) {
		return "board/APIForm";
	}
	
	@GetMapping("/board/ProductsaveForm")
	public String ProductsaveForm() {
		return "board/ProductsaveForm";
	}
	
	@GetMapping("/board/productdetail")
	public String productdetail() {
		return "board/productdetail";
	}

	
	
}
