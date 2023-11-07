package board.demo.service;

import board.demo.dto.MemberDTO;
import board.demo.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

    private final PasswordEncoder passwordEncoder;
    private final MemberMapper memberMapper;

    // 회원가입
    @Transactional
    public void join(MemberDTO.MemberRequest memberRequest) {
        memberRequest.setMemberPw(passwordEncoder.encode(memberRequest.getMemberPw()));
        memberMapper.join(memberRequest);
    }

    // 로그인
    @Transactional
    public MemberDTO.LoginResponse memberLogin(MemberDTO.LoginRequest loginRequest) {

        MemberDTO.MemberRequest member = findByEmail(loginRequest.getMemberEmail());

        if (member == null) {
            return null;
        } else {
            if (passwordEncoder.matches(loginRequest.getMemberPw(), member.getMemberPw())) {
                return memberMapper.memberLogin(loginRequest);
            }
        }

        return null;
    }

    // 이메일로 찾기
    @Transactional
    public MemberDTO.MemberRequest findByEmail(String memberEmail) {
        return memberMapper.findByEmail(memberEmail);
    }

    @Transactional
    public String memberEmailCheck(String memberEmail) {
        int count = memberMapper.memberEmailCheck(memberEmail);

        // count 0일 시 가입 가능
        if (count == 0)
            return "success";
        else
            return "fail";
    }
}
