package com.cos.blog.service;

import java.util.List;

import com.cos.blog.model.Favorites;
import com.cos.blog.repository.FavoriteRepository;
import com.cos.blog.service.impl.IBoardMapper;
import com.cos.blog.service.impl.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.Board;
import com.cos.blog.model.Reply;
import com.cos.blog.model.User;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.repository.ReplyRepository;
import com.cos.blog.repository.UserRepository;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다
@Service("BoardService")
public class BoardService implements IBoardService {

	private final IBoardMapper BoardMapper;

	@Autowired
	public BoardService(IBoardMapper BoardMapper) {
		this.BoardMapper = BoardMapper;
	}


	@Transactional(readOnly = true)
	public List<Favorites> getFavoriteList() throws Exception {
		return BoardMapper.getFavoriteList();
	}


	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private ReplyRepository replyRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private FavoriteRepository favoriteRepository;

	@Transactional
	public void 글쓰기(Board board){ // title, content
		board.setBOARD_COUNT(0);
		boardRepository.save(board);
	}

	@Transactional
	public void 즐겨찾기등록(Favorites favorites){ // title, content
		favorites.setFAVORITE_VALUE(1);
		favoriteRepository.save(favorites);
	}

	@Transactional(readOnly = true)
	public Page<Board> 글목록(Pageable pageable) {

		return boardRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Page<Favorites> 즐겨찾기목록(Pageable pageable) {

		return favoriteRepository.findAll(pageable);
	}
	
	public List<Board> 글목록2(){
		return boardRepository.findAll();
	}


	public List<Reply> 댓글목록(){
		return replyRepository.findAll();
	}

	public Page<Reply> 댓글목록2(Pageable pageable) {

		return replyRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Board 글상세보기(int ID) {
		return boardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void 글삭제하기(int ID) {
		boardRepository.deleteById(ID);
	}

	@Transactional
	public void 글수정하기(int ID, Board requestBoard) {
		Board board = boardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		board.setBOARD_TITLE(requestBoard.getBOARD_TITLE());
		board.setBOARD_CONTENT(requestBoard.getBOARD_CONTENT());
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}

	@Transactional
	public void 댓글쓰기(int ID2, Reply reply) {
		Board board = boardRepository.findById(ID2).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 id를 찾을 수 없습니다.");
		});
		reply.setBoard(board);

		replyRepository.save(reply);
	}
	
	@Transactional
	public void 댓글삭제(int replyid) {
		replyRepository.deleteById(replyid);
	}



	}
	
	
	


	

	
	
	

