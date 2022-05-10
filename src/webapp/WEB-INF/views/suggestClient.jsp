<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		a{text-decoration: none}
	</style>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<script type="text/javascript">
		$(function(){
			$("#keyWord").keyup(function(){
				if($(this).val()==""){
					$("#suggest").hide();
					return;
				}

				$.ajax({
					type: "post" , //전송방식
					url: "suggest" ,//서버주소
					dataType:"json" , //응답결과데이터타입(xml, html, text, json)
					data: { keyWord: $(this).val() }, //서버에게 전송할 data
					success: function(result){//개수|단어,단어,..
						$( "#keyWord" ).autocomplete({
							source: result
						});
					} ,
					error: function(err){
						console.log(err+"-> 오류");
					}

				});//ajax끝

			});//keyup끝



		});//ready끝

	</script>

</head>
<body>

<h3> [ Suggest 기능 구현 ]</h3>
<form name="search" id="search">
	<input type="text" name="keyWord" id="keyWord"/>
</form>




</body>
</html>








