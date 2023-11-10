package board.demo.interceptor;

import board.demo.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class AdminCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String requestURI = request.getRequestURI();

        HttpSession session = request.getSession(false);
        // 비로그인 사용자 일 시 로그인 폼으로 redirect
        if (session == null) {
            response.sendRedirect("/member/login?redirectURL=" + requestURI);
            return false;
        }

        MemberDTO.LoginResponse member = (MemberDTO.LoginResponse) session.getAttribute("member");
        // 관리자가 아닐 시 redirect
        if (member == null || member.getAdminCk() == 0) {
            log.info("미인증 사용자 요청");
            response.sendRedirect("/member/login?redirectURL=" + requestURI);
            return false;
        }
        return true;
    }
}
