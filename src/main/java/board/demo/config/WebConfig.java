package board.demo.config;

import board.demo.interceptor.AdminCheckInterceptor;
import board.demo.interceptor.LoginCheckInterceptor;
import board.demo.interceptor.LogoutCheckInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 어드민 권한 필요
        registry.addInterceptor(new AdminCheckInterceptor())
                .order(1)
                .addPathPatterns("/admin/**");

        // 로그인 체크
        registry.addInterceptor(new LoginCheckInterceptor())
                .addPathPatterns("/member/**")  // 로그인 멤버 접근가능
                .excludePathPatterns("/css/**", "/member/login", "/member/join", "/member/memberEmailChk"); // 비로그인 멤버 접근가능

        // 로그인 멤버 비정상적 접근
        registry.addInterceptor(new LogoutCheckInterceptor())
                .addPathPatterns("/member/login", "/member/join");  // 로그인 멤버 접근가능
    }


}
