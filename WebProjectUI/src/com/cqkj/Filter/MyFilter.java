package com.cqkj.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class MyFilter
 */
/*@WebFilter("/MyFilter")*/
public class MyFilter implements Filter
{

    /**
     * Default constructor.
     */
    public MyFilter()
    {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy()
    {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        request.setCharacterEncoding("utf-8");
        // 创建过滤器，编写配置文件，将请求和响应转换成HTTP请求和响应对象
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // 获取session对象
        HttpSession session = req.getSession();

        // 获取当前请求的servlet路径
        String path = req.getServletPath();

        // 判断过滤条件
        if (path.equals("/mySign-in.jsp") || path.equals("/mySign-inDao.jsp"))
        {
            // 向后面请求
            chain.doFilter(request, response);
        }
        else if (session.getAttribute("usersId") == null)
        {
            //使用绝对路径
            res.sendRedirect("/WebProjectUI/mySign-in.jsp");
        }
        else
        {
            chain.doFilter(request, response);
        }

    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException
    {
    }

}
