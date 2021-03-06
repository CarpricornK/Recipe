package com.cos.blog.controller.api;

import com.cos.blog.model.Favorites;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.Board;
import com.cos.blog.model.Reply;
import com.cos.blog.service.BoardService;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board) { 
		boardService.글쓰기(board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/board/favorite")
	public ResponseDto<Integer> favorite(@RequestBody Favorites favorites) {
		boardService.즐겨찾기등록(favorites);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
    @DeleteMapping("/api/board/{ID}")
	public ResponseDto<Integer> deleteById(@PathVariable int ID){
		boardService.글삭제하기(ID);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    
    @PutMapping("/api/board/{ID}")
    public ResponseDto<Integer> update(@PathVariable int ID, @RequestBody Board board){
    	boardService.글수정하기(ID,board);
       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }
    // 데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
    // dto 사용하지 않은 이유는 소규모 프로젝트라 이렇게함
    @PostMapping("/api/board/{ID2}/reply")
	public ResponseDto<Integer> replySave(@PathVariable int ID2, @RequestBody Reply reply) {
//    	System.out.println(ID2);
//		System.out.println(reply.getREPLY_CONTENT());
//		System.out.println(reply.getId());
//		System.out.println(reply.getREPLY_USERNAME());
//		System.out.println(reply.getREPLY_CDATE());
		boardService.댓글쓰기(ID2, reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
   
    @DeleteMapping("/api/board/{boardId}/reply/{replyid}")
	public ResponseDto<Integer> replySave(@PathVariable int replyid) { 
    	boardService.댓글삭제(replyid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    
}
    
    //============================== 제품 =================================
	

	
	



		
// ===================== 대답글 ====================

	    
}