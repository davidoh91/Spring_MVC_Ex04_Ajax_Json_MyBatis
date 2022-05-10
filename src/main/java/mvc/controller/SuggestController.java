package mvc.controller;

import lombok.RequiredArgsConstructor;
import mvc.service.SuggestService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
    suggest 기능을 처리해줄 전용 ajax Controller
 */
@RestController
@RequiredArgsConstructor
public class SuggestController {

    private final SuggestService suggestService;

    @RequestMapping("/suggest")
    public List<String> test(String keyWord) {
        List<String> list = suggestService.selectSuggest(keyWord);
        System.out.println(list);

        return list;
    }

}
