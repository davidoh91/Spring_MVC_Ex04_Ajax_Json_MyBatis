package mvc.service;

import java.util.List;

public interface SuggestService {
    /*
        인수로 전달된 단어로 시작하는 레코드 검색
     */
    List<String> selectSuggest(String word);
}
