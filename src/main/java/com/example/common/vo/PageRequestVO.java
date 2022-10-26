package com.example.common.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageRequestVO {
    //limit skip , 6
    //festivalList로 상세정보 제외한 나머지 정보 보내고
    //festivalDetail로 상세정보 보내는건 다른 컨트롤러에서
    @Builder.Default
    private Integer page=1;
    @Builder.Default
    private Integer size=9;
    public Integer getSkip(){
        return (page-1)*size;
    }
}