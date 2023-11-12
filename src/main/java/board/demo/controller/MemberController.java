package board.demo.controller;

import board.demo.dto.MemberDTO;
import board.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    // 회원가입 폼
    @GetMapping("/join")
    public String joinForm(MemberDTO.MemberRequest memberRequest) {
        return "member/join";
    }

    // 회원가입
    @PostMapping("/join")
    public String join(@Valid MemberDTO.MemberRequest memberRequest, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            log.info("bindingResult 에러 보유");
            return "member/join";
        }

        memberService.join(memberRequest);
        return "redirect:/";
    }

    // 로그인 폼
    @GetMapping("/login")
    public String loginForm(MemberDTO.LoginRequest loginRequest) {
        return "member/login";
    }

    // 로그인
    @PostMapping("/login")
    public String login(@Valid MemberDTO.LoginRequest loginRequest, BindingResult bindingResult,
                        HttpServletRequest request, @RequestParam(defaultValue = "/") String redirectURL) {
        if(bindingResult.hasErrors()) {
            return "member/login";
        }

        MemberDTO.LoginResponse loginResponse = memberService.memberLogin(loginRequest);

        // 로그인 실패 시
        if (loginResponse == null) {
            bindingResult.reject("loginFail", "아이디 또는 비밀번호가 맞지 않습니다.");
            return "member/login";
        }

        // 로그인 성공 시
        HttpSession session = request.getSession();
        session.setAttribute("member", loginResponse);

        log.info("redirectURL = {}", redirectURL);

        return "redirect:" + redirectURL;
    }

    // 로그아웃
    @PostMapping("/logout")
    public String logoutV3(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    // 이메일 중복 체크
    @ResponseBody
    @PostMapping("/memberEmailChk")
    public String memberEmailChk(String memberEmail) {
        return memberService.memberEmailCheck(memberEmail);
    }

}
