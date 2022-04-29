package com.cos.blog.service.impl;

import com.cos.blog.model.Favorites;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBoardMapper {

    List<Favorites> getFavoriteList() throws Exception;

}
