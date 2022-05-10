package mvc.repository;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository //생성 id="suggestDAOImpl"
@RequiredArgsConstructor
public class SuggestDAOImpl implements SuggestDAO{

    private final SqlSession session; // inject via mybatis-context

    @Override
    public List<String> selectSuggest(String word) {
        //SqlSession session =
        List<String> list = session.selectList("suggestMapper.selectByWord", word);

        return list;
    }
}
