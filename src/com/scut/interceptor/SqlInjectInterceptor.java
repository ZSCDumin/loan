package com.scut.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

/**
 * Created by cwc on 2016/8/24.
 */
public class SqlInjectInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Enumeration<String> names=httpServletRequest.getParameterNames();
        while (names.hasMoreElements()){
            String name=names.nextElement();
            String[] values=httpServletRequest.getParameterValues(name);
            for (String value:values){
                value=clearXss(value);
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    /**
     * 处理字符转义
     * @param value
     * @return
     */
    public String clearXss(String value){
        if (value==null||"".equals(value)){
            return value;
        }
        value=value.replaceAll("<","<").replaceAll(">",">");
        value=value.replaceAll("\\(","(").replace("\\)",")");
        value=value.replaceAll("'","'");
        value=value.replaceAll("eval\\((.*)\\)","");
        value=value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']","\"\"");
        value=value.replace("script","");
        return value;
    }
}
