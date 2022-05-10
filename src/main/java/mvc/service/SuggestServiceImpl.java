package mvc.service;

import lombok.RequiredArgsConstructor;
import mvc.repository.SuggestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //id=suggestServiceImpl
@RequiredArgsConstructor //creates a constructor with private final field (Constant which is only initialized once during construction)
public class SuggestServiceImpl implements SuggestService{

    /*
    @Autowired //@Autowired => injection by name or type
    private SuggestDAO suggestDAO;
     */
    private final SuggestDAO suggestDAO; // final field is used in conjunction with Lombok @RequiredArgsConstructor

    @Override
    public List<String> selectSuggest(String word) {
        List<String> list = suggestDAO.selectSuggest(word);

        return list;
    }
}
