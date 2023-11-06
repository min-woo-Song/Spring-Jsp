package board.demo.mapper;

import board.demo.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    void join(MemberDTO.MemberRequest memberRequest);

    int MemberEmailCheck(String memberEmail);
}
