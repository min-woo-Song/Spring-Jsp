package board.demo.service;

import board.demo.dto.MemberDTO;
import board.demo.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    @Transactional
    public void join(MemberDTO.MemberRequest memberRequest) {
        memberMapper.join(memberRequest);
    }

    @Transactional
    public String MemberEmailCheck(String memberEmail) {
        int count = memberMapper.MemberEmailCheck(memberEmail);

        // count 0일 시 가입 가능
        if (count == 0)
            return "success";
        else
            return "fail";
    }
}
