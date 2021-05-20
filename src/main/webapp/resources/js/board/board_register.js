$(document).ready(function(){

    $("#btn_board_register").on("click", function(){
        
        var alert = confirm("등록 하시겠습니다?");

        $.ajax({
            url: '/board/board_register',
            type: 'POST',
            data: {bd_title : $("#bd_title").val(), bd_content : $("#bd_content").val(), mem_id : $("#mem_id").val()},
            dataType : 'text',
            success : function(data) {
                alert();

                if(data == "SUCCESS"){
                    // 리스트 페이지 이동
                    location.href = "/board/board_list";
                }else {
                    alert("다시 입력해 주세요.");
                }
            }

        });
    });

});