package com.cos.blog.service.impl;

import com.cos.blog.model.Favorites;

import java.util.List;

public interface IBoardService {

    List<Favorites> getFavoriteList() throws Exception;


}
