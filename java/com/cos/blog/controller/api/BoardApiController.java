package com.cos.blog.controller.api;

import com.cos.blog.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cos.blog.dto.ResponseDto;
import com.cos.blog.service.BoardService;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board) { 
		boardService.write(board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

//신고 & 문의 ↓
	@PostMapping("/api/declaration")
	public ResponseDto<Integer> declaration(@RequestBody Declaration declaration) {
		boardService.declaration(declaration);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/Rboard")
	public ResponseDto<Integer> rsave(@RequestBody RBoard Rboard) {
		boardService.recipewrite(Rboard);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/board/favorite")
	public ResponseDto<Integer> favorite(@RequestBody Favorites favorites) {
		boardService.favoritesend(favorites);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/board/favoriteS")
	public ResponseDto<Integer> favoriteS(@RequestBody Favorites favorites) {
		boardService.favoritesend(favorites);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	
    @DeleteMapping("/api/board/{ID}")
	public ResponseDto<Integer> deleteById(@PathVariable int ID){
		boardService.boarddelete(ID);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/rboard/{ID}")
	public ResponseDto<Integer> rdeleteById(@PathVariable int ID){
		boardService.recipedelete(ID);
//		System.out.println("ID:"+ID);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    
    @PutMapping("/api/board/{ID}")
    public ResponseDto<Integer> update(@PathVariable int ID, @RequestBody Board board){
    	boardService.boardset(ID,board);
       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }

	@PutMapping("/api/rboard/{ID}")
	public ResponseDto<Integer> Rupdate(@PathVariable int ID, @RequestBody RBoard rboard){
		boardService.recipeboardset(ID,rboard);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
    // 데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
    // dto 사용하지 않은 이유는 소규모 프로젝트라 이렇게함
    @PostMapping("/api/board/{ID2}/reply/{ID1}")
	public ResponseDto<Integer> replySave(@PathVariable int ID2, @PathVariable int ID1, @RequestBody Reply reply) {
//    	System.out.println(ID1);
//		System.out.println(ID2);
//		System.out.println(reply.getREPLY_CONTENT());
//		System.out.println(reply.getREPLY_TYPE());
//		System.out.println(reply.getREPLY_USERNAME());
//		System.out.println(reply.getREPLY_CDATE());
		boardService.replysave(ID1, ID2, reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    @DeleteMapping("/api/board/{boardId}/reply/{replyid}")
	public ResponseDto<Integer> replySave(@PathVariable int replyid) { 
    	boardService.replydelete(replyid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
}
	@DeleteMapping("/api/rboard/{boardId2}/delete/{boardtype}")
	public ResponseDto<Integer> Delete(@PathVariable int boardId2, @PathVariable int boardtype) {
		if (boardtype == 0) {
			boardService.adminboarddelete(boardId2);
//			레시피 게시판
		} else {
			boardService.adminboarddelete2(boardId2);
//			자유 게시판
		}
//		System.out.println("iD :"+boardId2);
//		System.out.println("타입 :"+boardtype);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/rboard/{boardId3}/delete2/{favoriteId}")
	public ResponseDto<Integer> Delete2(@PathVariable int boardId3, @PathVariable int favoriteId) {
		boardService.favoritedelete(boardId3);
//		System.out.println("iD :"+boardId3);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
//                 "/api/board/favorites/"+ID4+"/fsave/"+ID5+/USERNAME/+USERNAME+/TITLE/+TITLE
	@PutMapping("/api/board/favorites/{ID4}/fsave/{ID5}/USERNAME/{USERNAME}/TITLE/{TITLE}")
	public ResponseDto<Integer> favorites(@PathVariable int ID4, @PathVariable int ID5, @PathVariable String USERNAME, @PathVariable String TITLE, Favorites favorites) {
		boardService.favoritesend2(ID5, USERNAME, TITLE, favorites);
//		System.out.println("name :");
//		System.out.println("Id :"+ID5);
//		System.out.println("USERNAME :"+USERNAME);
//		System.out.println("TITLE :"+TITLE);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
//문의완료          "/api/board/reports/"+reportId+"/Tval/"+reportType
	@PutMapping("/api/board/reports/{reportId}/Tval/{reportType}")
	public ResponseDto<Integer> reportT(@PathVariable int reportId, @PathVariable int reportType, Declaration declaration) {
		boardService.reportsend1(reportId, reportType, declaration);
//		System.out.println("USERNAME :"+USERNAME);
//		System.out.println("TITLE :"+TITLE);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    
    //============================== 제품 =================================
	

	
	



		
// ===================== 대답글 ====================

	    
}