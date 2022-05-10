<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

<input type="button" value="load함수" id="loadBtn">
<input type="button" value="ajax함수" id="ajaxBtn">
<input type="button" value="json결과" id="jsonBtn">

<input type="button" value="DTO결과" id="dtoBtn">
<input type="button" value="List결과" id="listBtn">
<input type="button" value="Map결과" id="mapBtn">

<hr>
<div id="display"></div>


<script type="text/javascript">
    $(function () {
        alert("jQuery starts");

        /*
            ajax 관련 함수
            $().load();

            $.get();

            $.post();

            $.getJson();

            $.ajax({

            });
         */

        ///////////////////////////////////////////////
        $("#loadBtn").click(function () {
            $("#display").load("load"); //"load" = AjaxController method url
        })

        ///////////////////////////////////////////////
        $("#ajaxBtn").click(function () {
            $.ajax({
                url: "ajax",//서버요청주소
                type: "get",//요청방식(get, post, put, delete, patch)
                dataType: "text",//서버가 응답해주는 데이터타입 (text, html, xml, json)
                data: "name=David",//서버에게 보낼 parameter 정보
                success: function (result) { //the return result of Ajax can be found in success: function(result)
                    $("#display").html("<h3>" + result + "</h3>")
                },
                error: function (err) {
                    alert(err + "error occurred..")
                }
            });
        })

        ///////////////////////////////////////////////
        $("#jsonBtn").click(function () {
            $.ajax({
                url: "json",//서버요청주소
                type: "post",//요청방식(get, post, put, delete, patch)
                dataType: "json",//서버가 응답해주는 데이터타입 (text, html, xml, json)
                // data: "name=david",//서버에게 보낼 parameter 정보
                success: function (result) {
                    alert(result);

                    let str = "";
                    $.each(result, function (index, item) {
                        str += "<input type='checkbox' name='menu' value='" + (index + 1) + "'>" + item
                    })

                    $("#display").html(str)
                },
                error: function (err) {
                    alert(err + "error occurred..")
                }
            });
        })

        ///////////////////////////////////////////////
        $("#dtoBtn").click(function () {
            $.ajax({
                url: "memberDto",//서버요청주소
                type: "post",//요청방식(get, post, put, delete, patch)
                dataType: "json",//서버가 응답해주는 데이터타입 (text, html, xml, json)
                // data: "name=david",//서버에게 보낼 parameter 정보
                success: function (result) {
                    // alert(result)
                    $("#display").html(result.id + " | " + result.name + " | " + result.age + " | " + result.addr)
                },
                error: function (err) {
                    alert(err + "error occurred..")
                }
            });
        })

        ///////////////////////////////////////////////
        $("#listBtn").click(function() {

            $.ajax({
                url: "memberList",
                type: "post",
                dataType: "json",
                success: function(result){
                    // alert(result)

                    var str="<table>";

                    str+="<tr><td>번호</td><td>아이디</td><td>이름</td><td>나이</td><td>주소</td></tr>";

                    $.each(result, function(index, item) {
                        str+="<tr>"
                        str+="<td>" + (index+1) + "</td>"
                        str+="<td>" + item.id + "</td>"
                        str+="<td>" + item.name + "</td>"
                        str+="<td>" + item.age + "</td>"
                        str+=`<td>${'${item.addr}'}</td>`
                        str+="</tr>"
                    });
                    str+="</table>";

                    $("#display").html(str);

                },
                error: function(err){
                    alert(err + "error occurred..")
                }
            });

        })

        ///////////////////////////////////////////////
        $("#mapBtn").click(function() {

            $.ajax({
                url: "map", //서버요청주소
                type: "post", //요청방식(get, post, put, delete, patch)
                dataType: "json", //서버가 응답해주는 데이터타입 (text, html, xml, json)
                // data: "name=david",//서버에게 보낼 parameter 정보
                success: function(result){
                    alert(result)
                    alert(result.message)
                    alert(result.dto)
                    alert(result.memberList)

                    $.each(result.memberList, function(index, item) {
                        alert(item.id + " | " + item.age + " | " + item.addr);
                    });
                },
                error: function(err){
                    alert(err + "error occurred..")
                }
            });

        })


    }); //end of jQuery
</script>


</body>
</html>



