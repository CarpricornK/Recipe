package com.cos.blog.controller;

import com.cos.blog.model.*;
import com.cos.blog.service.MongoService;
import com.cos.blog.service.NaverService;
import com.cos.blog.service.UserService;
import com.cos.blog.service.impl.IBoardService;
import lombok.extern.slf4j.Slf4j;
import org.bson.types.ObjectId;
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
import org.springframework.web.bind.annotation.*;

import com.cos.blog.service.BoardService;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

@Slf4j
@Controller
public class BoardController {

	@Resource(name="BoardService")
	private IBoardService iboardService;

	@Autowired
	private BoardService boardService;

	private NaverService naverService;

	@Autowired
	private UserService userService;

	@Autowired
	private MongoService mongoService;


	@GetMapping("/board/AsaveForm")
	public String AsaveForm(Model model) throws Exception {
		model.addAttribute("notice", iboardService.getNoticeList());
		return "board/AsaveForm";
	}

	@GetMapping({ "", "/" })
	public String index(Model model,
			@PageableDefault(size = 11, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {
		model.addAttribute("boards", boardService.boardlist(pageable));
//		model.addAttribute("boards2", boardService.글목록2());
		model.addAttribute("rboards", boardService.recipelist(pageable));
		model.addAttribute("favorites", boardService.favoritelist(pageable));
		model.addAttribute("api", boardService.APIlist(pageable));
		model.addAttribute("api2", boardService.APIlist2());
		model.addAttribute("reply", iboardService.ReplyList3());
		model.addAttribute("notice", iboardService.getNoticeList());
		return "index";
	}

	@GetMapping("/board/report")
	public String report(Model model,
			@PageableDefault(size = 9, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable
			, @RequestParam(required = false, defaultValue = "0") Integer page) {
		//신고
		Page<Declaration> declaration5=boardService.declarationlist(pageable);

//		Page<Declaration> declaration1=boardService.dhvalsearch(1,pageable);
//
//		Page<Declaration> declaration2=boardService.dhvalsearch(2,pageable);

		Page<Declaration> declaration1=boardService.dhvalsearch2(1, 1, pageable);
		Page<Declaration> declaration2=boardService.dhvalsearch2(2, 1, pageable);
		Page<Declaration> declaration3=boardService.dhvalsearch2(1, 2, pageable);
		Page<Declaration> declaration4=boardService.dhvalsearch2(2, 2, pageable);

		model.addAttribute("declaration1", declaration1);
		model.addAttribute("declaration2", declaration2);
		model.addAttribute("declaration3", declaration3);
		model.addAttribute("declaration4", declaration4);
		model.addAttribute("declaration5", declaration5);


		return "board/report";
	}

	@GetMapping("/board/AdminChart")
	public String AdminChart(Model model,
							 @PageableDefault(size = 5, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) {
		List<Declaration> declarations5=boardService.declarationlist2();


//		신고 처리중
		List<Declaration> declarations1=boardService.dhvalsearch3(1, 1);
//		문의 처리중
		List<Declaration> declarations2=boardService.dhvalsearch3(2, 1);
		List<Declaration> declarations3=boardService.dhvalsearch3(1, 2);
		List<Declaration> declarations4=boardService.dhvalsearch3(2, 2);

		Page<Declaration> declaration5=boardService.declarationlist(pageable);

//		Page<Declaration> declaration1=boardService.dhvalsearch(1,pageable);
//
//		Page<Declaration> declaration2=boardService.dhvalsearch(2,pageable);

		Page<Declaration> declaration1=boardService.dhvalsearch2(1, 1, pageable);
		Page<Declaration> declaration2=boardService.dhvalsearch2(2, 1, pageable);
		Page<Declaration> declaration3=boardService.dhvalsearch2(1, 2, pageable);
		Page<Declaration> declaration4=boardService.dhvalsearch2(2, 2, pageable);

		model.addAttribute("declaration1", declaration1);
		model.addAttribute("declaration2", declaration2);
		model.addAttribute("declaration3", declaration3);
		model.addAttribute("declaration4", declaration4);
		model.addAttribute("declaration5", declaration5);

		model.addAttribute("declarations1", declarations1);
		model.addAttribute("declarations2", declarations2);
		model.addAttribute("declarations3", declarations3);
		model.addAttribute("declarations4", declarations4);
		model.addAttribute("declarations5", declarations5);

		model.addAttribute("Users",userService.muserlist());
		model.addAttribute("boards2", boardService.boardlist2());
		model.addAttribute("rboards2", boardService.recipelist2());
		model.addAttribute("favorite", boardService.favoritelist2());
		return "board/AdminChart";
	}



	@GetMapping("/board")
	public String BoardMain(Model model
	, @PageableDefault(size = 15, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable
	, @RequestParam(required = false, defaultValue = "") String field
	, @RequestParam(required = false, defaultValue = "") String word
	, @RequestParam(required = false, defaultValue = "NL") String CF
	, @RequestParam(required = false, defaultValue = "") Integer count
	) throws Exception {

		Page<RBoard> ulist=boardService.recipelist(pageable);
		Page<Board> ulist2=boardService.boardlist(pageable);

		if(field.equals("searchr")) {
			ulist = boardService.recipelistsearch(word, pageable);

			if (CF.indexOf("NL") == -1) {
				ulist = boardService.recipelistfilter(CF, pageable);
				System.out.println("SHIT");
			}
			if (count != null) {

				ulist = boardService.recipelisthot(count, pageable);

			}

		} else if (field.equals("searchf")){
			ulist2 = boardService.blistsearch(word, pageable);

			if (count != null) {
				ulist2 = boardService.blisthot(count, pageable);
			}

		}

		model.addAttribute("rboards3", ulist);
//		model.addAttribute("boards3", boardService.글목록(pageable));
		model.addAttribute("boards", ulist2);
//		model.addAttribute("rboards", boardService.레시피목록(pageable));
		model.addAttribute("boards2", boardService.boardlist2());
		model.addAttribute("rboards2", boardService.recipelist2());
		model.addAttribute("notice", iboardService.getNoticeList());
		model.addAttribute("reply", iboardService.ReplyList3());
		model.addAttribute("reply2", iboardService.ReplyList2());
		model.addAttribute("reply1", iboardService.ReplyList());
		model.addAttribute("favorite", boardService.favoritelist2());
		return "board/BoardMain";
	}


	@GetMapping("/user/Favorite")
	public String favorite(Model model, @PageableDefault(size = 1000, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {
		model.addAttribute("boards", boardService.boardlist(pageable));
		model.addAttribute("favorites", boardService.favoritelist(pageable));
		model.addAttribute("rboards", boardService.recipelist(pageable));
		model.addAttribute("api", boardService.APIlist(pageable));

		List<Favorites> rList = iboardService.getFavoriteList();
		System.out.println(rList);
		model.addAttribute("rList", rList);

		return "/user/Favorite";
	}

	@GetMapping("/user/Favorite2")
	public String favorite2(Model model, @PageableDefault(size = 1000, sort = "ID", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {
		model.addAttribute("boards", boardService.boardlist(pageable));
		model.addAttribute("favorites", boardService.favoritelist(pageable));
		model.addAttribute("rboards", boardService.recipelist(pageable));
		model.addAttribute("api", boardService.APIlist(pageable));
		model.addAttribute("reply", iboardService.ReplyList3());

		List<Favorites> rList = iboardService.getFavoriteList();
		System.out.println(rList);
		model.addAttribute("rList", rList);

		return "/user/Favorite2";
	}

	@GetMapping("/board/APIForm")
	public String APIForm(Model model
		,@RequestParam(required = false, defaultValue = "") String search
		,@PageableDefault(size = 12, sort = "ID", direction = Sort.Direction.ASC) Pageable pageable)
			throws Exception {
		Page<MongoDTO> ulist = boardService.APIlist(pageable);

		if(search != null) {
			ulist = boardService.APIlistsearch(search, pageable);
		}
		model.addAttribute("api3", boardService.APIlist(pageable));
		model.addAttribute("api", ulist);
		model.addAttribute("api2", boardService.APIlist2());
		model.addAttribute("reply", iboardService.ReplyList3());
		model.addAttribute("favorite", boardService.favoritelist2());
		return "board/APIForm";
	}


//	API상세보기
	@GetMapping("/board/APIForm/{ID}")
	public String APIdetail(@PathVariable ObjectId ID, Model model, @PageableDefault(size = 12, sort = "ID", direction = Sort.Direction.ASC) Pageable pageable) throws Exception {
		boardService.recipecountup(ID);
		String result = "";
		Integer category_code = 100;
		JSONArray apilist = new JSONArray();

		for (int z = 0; z <= 5; ++z) {

			try {
				URL url = new URL("https://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_product_cls_code=01&p_country_code=1101&p_regday=2022-04-15&p_convert_kg_yn=N&p_item_category_code="+ category_code +"&p_cert_key=eca596ef-9bd2-4987-9ac1-15e85ae1fe3e&p_cert_id=222&p_returntype=json");

				BufferedReader bf;

				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

				result = bf.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONObject COOKRCP01Result = (JSONObject) jsonObject.get("data");
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
			model.addAttribute("api3", boardService.APIdetail(ID));
			model.addAttribute("reply", iboardService.ReplyList3());
	    	model.addAttribute("food", boardService.foodlist());
			return "board/APIdetail";
		}




	@GetMapping("/board/{ID}")
	public String findById(@PathVariable int ID, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {

		boardService.countup(ID);
		model.addAttribute("board", boardService.boarddetail(ID));
//		model.addAttribute("reply", boardService.댓글목록());
		model.addAttribute("replyp", boardService.replylist2(pageable));
		model.addAttribute("reply", iboardService.ReplyList());
		return "board/detail";
	}

	@GetMapping("/Rboard/{ID}")
	public String RfindById(@PathVariable int ID, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) throws Exception {
		boardService.countup2(ID);
		model.addAttribute("rboard", boardService.recipedetail(ID));
		model.addAttribute("reply", boardService.replylist());
		model.addAttribute("replyp", boardService.replylist2(pageable));

		model.addAttribute("replyl1s", iboardService.ReplyList2());
		return "board/Rdetail";
	}

	@GetMapping("/board/{ID}/updateForm")
	public String updateForm(@PathVariable int ID, Model model) {
		model.addAttribute("board", boardService.boarddetail(ID));
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

	@GetMapping("/user/Admin")
	public String Admin() {
		return "user/Admin";
	}

	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}

	@GetMapping("/board/ProductsaveForm")
	public String ProductsaveForm() {
		return "board/ProductsaveForm";
	}
	
	@GetMapping("/board/productdetail")
	public String productdetail() {
		return "board/productdetail";
	}

	@GetMapping("/board/Rdetail")
	public String Rdetail() {
		return "board/Rdetail";
	}

	@GetMapping("/board/RsaveForm")
	public String RsaveForm() {
		return "board/RsaveForm";
	}

	@GetMapping("/user/DeleteForm")
	public String DeleteForm() { return "user/DeleteForm";}

	
	
}
