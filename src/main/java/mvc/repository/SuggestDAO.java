package mvc.repository;

import java.util.List;

public interface SuggestDAO {
    /*
        인수로 전달된 단어로 시작하는 레코드 검색
     */
    List<String> selectSuggest(String word);

}
