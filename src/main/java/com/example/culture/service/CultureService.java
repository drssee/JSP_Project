package com.example.culture.service;

import com.example.culture.vo.CultureVO;
import com.example.common.vo.PageRequestVO;
import com.example.common.vo.PageResponseVO;

public interface CultureService {

    //api 등록 기능
    void register();
    //전체조회 list(limit skip , size)
    PageResponseVO<CultureVO> getCultures(PageRequestVO pageRequestVO);
    //개별조회
    CultureVO getCulture(Long cno);
    //수정
    //삭제
    //전부삭제
    void removeAll();
}