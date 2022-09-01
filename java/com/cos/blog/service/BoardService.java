package com.cos.blog.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.cos.blog.Mapper.IMongoMapper;
import com.cos.blog.model.*;
import com.cos.blog.repository.*;
import com.cos.blog.service.impl.IBoardMapper;
import com.cos.blog.service.impl.IBoardService;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다
@Service("BoardService")
public class BoardService implements IBoardService {

	private final IBoardMapper BoardMapper;

	@Autowired
	protected MongoTemplate mongodb;

	@Resource(name = "MongoMapper")
	private IMongoMapper mongoMapper; // MongoDB에 저장할 Mapper

	@Autowired
	public BoardService(IBoardMapper BoardMapper) {
		this.BoardMapper = BoardMapper;
	}

	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private DeclarationRepository declarationRepository;

	@Autowired
	private ReplyRepository replyRepository;

	@Autowired
	private FoodRepository foodRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private FavoriteRepository favoriteRepository;

	@Autowired
	private RBoardRepository rBoardRepository;

	@Autowired
	private APIRepository apiRepository;

	@Transactional(readOnly = true)
	public List<Favorites> getFavoriteList() throws Exception {
		return BoardMapper.getFavoriteList();
	}

	@Transactional(readOnly = true)
	public List<Board> getNoticeList() throws Exception {
		return BoardMapper.getNoticeList();
	}


	@Transactional(readOnly = true)
	public List<Reply> ReplyList() throws Exception {
		return BoardMapper.ReplyList();
	}

	@Transactional(readOnly = true)
	public List<Reply> ReplyList2() throws Exception {
		return BoardMapper.ReplyList2();
	}

	@Transactional(readOnly = true)
	public List<Reply> ReplyList3() throws Exception {
		return BoardMapper.ReplyList3();
	}

//
//	레시피글쓰기
	@Transactional
	public void recipewrite(RBoard Rboard){ // title, content
		Rboard.setRBOARDCOUNT(0);
		rBoardRepository.save(Rboard);
	}
//	글쓰기
	@Transactional
	public void write(Board board){ // title, content
		board.setBOARDCOUNT(0);
		boardRepository.save(board);
	}
	//	신고&문의
	@Transactional
	public void declaration(Declaration declaration){ // title, content

		declarationRepository.save(declaration);
	}
//	즐겨찾기등록
	@Transactional
	public void favoritesend(Favorites favorites){ // title, content
		favorites.setFAVORITE_VALUE(1);
		favoriteRepository.save(favorites);
	}
//	즐겨찾기2 onclick
	@Transactional
	public void favoritesend2(int ID5, String USERNAME,String TITLE, Favorites favorites) {
		favorites.setFAVORITE_VALUE(3);
		favorites.setFAVORTIE_TITLE(TITLE+ID5+USERNAME);
		favorites.setFAVORTIE_NAME(USERNAME);
		favorites.setFAVORITE_ID(ID5);
//		System.out.println(ID5);
//		System.out.println("USERNAME :"+USERNAME +"저장완료");
//		System.out.println("TITLE :"+TITLE +"저장완료");
		favoriteRepository.save(favorites);
	}
// 신고 문의 해결
	@Transactional
	public void reportsend1(int reportId, int reportType, Declaration declaration) {
		Declaration declaration1 = declarationRepository.findById(reportId).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		declaration1.setTYPE(Integer.toString(reportType));
		System.out.println("reportId:"+reportId);
		System.out.println("reportTvalue:"+reportType);
//		System.out.println("TITLE :"+TITLE +"저장완료");
		declarationRepository.save(declaration1);
	}

//	글목록
	@Transactional(readOnly = true)
	public Page<Board> boardlist(Pageable pageable) {

		return boardRepository.findAll(pageable);
	}

	//	글목록
	@Transactional(readOnly = true)
	public Page<Declaration> declarationlist(Pageable pageable) {

		return declarationRepository.findAll(pageable);
	}

//	글목록검색
	@Transactional(readOnly = true)
	public Page<Board> blistsearch(String word, Pageable pageable) {

		return boardRepository.findByBOARDTITLEContains(word, pageable);
	}

	//	신고 문의 분류
	@Transactional(readOnly = true)
	public Page<Declaration> dhvalsearch(Integer hval, Pageable pageable) {

		return declarationRepository.findByHVALContains(hval, pageable);
	}
	//	신고 문의 분류2(문의중 & 해결)
	@Transactional(readOnly = true)
	public Page<Declaration> dhvalsearch2(Integer val, Integer val2, Pageable pageable) {

		return declarationRepository.findByHVALContainsAndTYPEContains(val, val2, pageable);
	}

//	글목록인기
	@Transactional(readOnly = true)
	public Page<Board> blisthot(Integer count, Pageable pageable) {

		return boardRepository.findByBOARDCOUNTGreaterThanEqual(count, pageable);
	}

//	레시피목록
	@Transactional(readOnly = true)
	public Page<RBoard> recipelist(Pageable pageable) {

		return rBoardRepository.findAll(pageable);
	}
//	레시피목록검색
	@Transactional(readOnly = true)
	public Page<RBoard> recipelistsearch(String word, Pageable pageable) {

		return rBoardRepository.findByRBOARDTITLEContains(word, pageable);
	}
//	레시피목록필터
	@Transactional(readOnly = true)
	public Page<RBoard> recipelistfilter(String CF, Pageable pageable) {

		return rBoardRepository.findByRBOARDFTYPEContains(CF, pageable);
	}
//	레시피목록인기
	@Transactional(readOnly = true)
	public Page<RBoard> recipelisthot(Integer count, Pageable pageable) {

		return rBoardRepository.findByRBOARDCOUNTGreaterThanEqual(count, pageable);
	}
//	API목록
	@Transactional(readOnly = true)
	public Page<MongoDTO> APIlist(Pageable pageable) {

		return apiRepository.findAll(pageable);
	}
//	API목록검색
	@Transactional(readOnly = true)
	public Page<MongoDTO> APIlistsearch(String search, Pageable pageable) {

		return apiRepository.findByRcpNMContains(search, pageable);
	}
//	API목록2
	public List<MongoDTO> APIlist2(){ return apiRepository.findAll(); }

//	즐겨찾기목록
	@Transactional(readOnly = true)
	public Page<Favorites> favoritelist(Pageable pageable) {

		return favoriteRepository.findAll(pageable);
	}
//	전체즐겨찾기목록
	@Transactional(readOnly = true)
	public List<Favorites> favoritelist2() {

		return favoriteRepository.findAll();
	}
	
	public List<Board> boardlist2(){

		return boardRepository.findAll();
	}

	public List<RBoard> recipelist2() {

		return rBoardRepository.findAll();
	}
//	음식보감목록
	public List<FOOD> foodlist(){

		return foodRepository.findAll();
	}
//	댓글목록
	public List<Reply> replylist(){

		return replyRepository.findAll();
	}
//	댓글목록2
	public Page<Reply> replylist2(Pageable pageable) {

		return replyRepository.findAll(pageable);
	}
//	글상세보기
	@Transactional(readOnly = true)
	public Board boarddetail(int ID) {

		return boardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});


	}
//	레시피글상세보기
	@Transactional(readOnly = true)
	public RBoard recipedetail(int ID) {
		return rBoardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("레시피글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});
	}
//	API글상세보기
	@Transactional(readOnly = true)
	public MongoDTO APIdetail(ObjectId ID) {
		return apiRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("레시피글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});
	}
//	글삭제하기
	@Transactional
	public void boarddelete(int ID) {
		boardRepository.deleteById(ID);
	}
//	즐겨찾기삭제
	@Transactional
	public void favoritedelete(int boardId3) {
		favoriteRepository.deleteById(boardId3);
		System.out.println(boardId3);
	}



//	레시피글삭제하기
	@Transactional
	public void recipedelete(int ID) {
		rBoardRepository.deleteById(ID);
	}

//	글수정하기
	@Transactional
	public void boardset(int ID, Board requestBoard) {
		Board board = boardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		board.setBOARDTITLE(requestBoard.getBOARDTITLE());
		board.setBOARDCONTENT(requestBoard.getBOARDCONTENT());
		board.setBOARDTYPE(requestBoard.getBOARDTYPE());
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}

//	조회수증가
	@Transactional
	public void countup(int ID) {
		Board board = boardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		board.setBOARDCOUNT(board.getBOARDCOUNT()+1);
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}
//	조회수증가2
	@Transactional
	public void countup2(int ID) {
		RBoard rboard = rBoardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		rboard.setRBOARDCOUNT(rboard.getRBOARDCOUNT()+1);
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}
//	레시피조회수증가
	@Transactional
	public void recipecountup(ObjectId ID) {
		MongoDTO mongoDTO = apiRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		System.out.println(mongoDTO.getApi_COUNT()+1);
		System.out.println(ID);



		String colNm = "MongoDTO";
		MongoCollection<Document> col = mongodb.getCollection(colNm);

		Document query = new Document();
		query.append("_id", ID);

		FindIterable<Document> rs = col.find(query);

		rs.forEach(doc -> col.updateOne(doc, new Document("$set", new Document("api_COUNT", mongoDTO.getApi_COUNT()+1))));



		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}


//	레시피글수정하기
	@Transactional
	public void recipeboardset(int ID, RBoard requestBoard) {
		RBoard rboard = rBoardRepository.findById(ID).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료

		rboard.setRBOARD01(requestBoard.getRBOARD01());
		rboard.setRBOARD02(requestBoard.getRBOARD02());
		rboard.setRBOARD03(requestBoard.getRBOARD03());
		rboard.setRBOARD04(requestBoard.getRBOARD04());
		rboard.setRBOARD05(requestBoard.getRBOARD05());
		rboard.setRBOARD06(requestBoard.getRBOARD06());
		rboard.setRBOARD07(requestBoard.getRBOARD07());
		rboard.setRBOARD08(requestBoard.getRBOARD08());
		rboard.setRBOARD09(requestBoard.getRBOARD09());
		rboard.setRBOARD10(requestBoard.getRBOARD10());

		rboard.setRBOARDIMG01(requestBoard.getRBOARDIMG01());
		rboard.setRBOARDIMG02(requestBoard.getRBOARDIMG02());
		rboard.setRBOARDIMG03(requestBoard.getRBOARDIMG03());
		rboard.setRBOARDIMG04(requestBoard.getRBOARDIMG04());
		rboard.setRBOARDIMG05(requestBoard.getRBOARDIMG05());
		rboard.setRBOARDIMG06(requestBoard.getRBOARDIMG06());
		rboard.setRBOARDIMG07(requestBoard.getRBOARDIMG07());
		rboard.setRBOARDIMG08(requestBoard.getRBOARDIMG08());
		rboard.setRBOARDIMG09(requestBoard.getRBOARDIMG09());
		rboard.setRBOARDIMG10(requestBoard.getRBOARDIMG10());

		rboard.setRBOARDTITLE(requestBoard.getRBOARDTITLE());
		rboard.setRBOARDCONTENT(requestBoard.getRBOARDCONTENT());
		rboard.setRBOARDNM(requestBoard.getRBOARDNM());
		rboard.setRBOARDFTYPE(requestBoard.getRBOARDFTYPE());
		rboard.setRBOARDUSERNAME(requestBoard.getRBOARDUSERNAME());

		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}

//	댓글쓰기
	@Transactional
	public void replysave(int ID1, int ID2, Reply reply) {

		replyRepository.save(reply);
	}

//	댓글삭제
	@Transactional
	public void replydelete(int replyid) {
		replyRepository.deleteById(replyid);
	}

//	관리자글삭제1
	@Transactional
	public void adminboarddelete(int boardId2) {
		rBoardRepository.deleteById(boardId2);
		System.out.println("ASD"+boardId2);
	}
//	관리자글삭제2
	@Transactional
	public void adminboarddelete2(int boardId2) {
		boardRepository.deleteById(boardId2);
		System.out.println("ASD"+boardId2);
	}



	}
	
	
	


	

	
	
	

