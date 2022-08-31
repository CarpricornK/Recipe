package com.cos.blog.service.impl;

import com.cos.blog.model.Board;
import com.cos.blog.model.Favorites;
import com.cos.blog.model.RBoard;
import com.cos.blog.model.Reply;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBoardService {

    List<Favorites> getFavoriteList() throws Exception;

    List<Board> getNoticeList() throws Exception;

    List<Reply> ReplyList() throws Exception;

    List<Reply> ReplyList2() throws Exception;

    List<Reply> ReplyList3() throws Exception;




}
