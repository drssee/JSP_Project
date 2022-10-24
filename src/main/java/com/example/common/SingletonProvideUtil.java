package com.example.common;


import com.example.AppConfig;
import com.example.culture.service.CultureService;
import com.example.review.service.ReviewService;
import com.example.user.service.UserService;
import com.google.gson.Gson;

public class SingletonProvideUtil {

    public static final SingletonProvideUtil SINGLETON_UTIL
            = new SingletonProvideUtil();

    private final AppConfig appConfig;

    private SingletonProvideUtil() {
        appConfig = new AppConfig();
    }

    ///////////////////gson

    public Gson gson(){
        return appConfig.gson();
    }

    ///////////////////user

    //userService
    public UserService userService() {
        return appConfig.userService();
    }

    ///////////////////culture

    //cultureService
    public CultureService cultureService() {
        return appConfig.cultureService();
    }

    ///////////////////reservation



    ////////////////////review

    //reviewService
    public ReviewService reviewService(){
        return appConfig.reviewService();
    }

}
