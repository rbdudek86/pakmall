$(document).ready(function(){
	
    $("#btn_PW_search").on("click", function(){
         //alert();

        $.ajax({
            url: '/member/pw_search',
            type: 'POST',
            data: {id : $("#memb_id").val()},
            dataType: 'text',
            success: function(data){
                // 비밀번호 출력작업
                
                if(data == "SUCCESS"){
                	$("#result").html("가입하신 메일로 임시 비밀번호를 전송했습니다.");
                    
                }else{
                	$("#result").html("입력정보가 틀립니다.");
                }
            }

        })

    });    


    /*
    //  비밀번호 찾기 : 메일전송
    $("#btn_PW_search").on("click", function()){
        alert();

        var userInfo = {id:$("#memb_id").val()};

        $.ajax({
            url: '/member/pw_search',
            type: 'POST',
            data: userInfo,
            dataType: 'text',
            success: function(data){
                // 비밀번호 출력작업
                
                if(data == "SUCCESS"){
                	$("#result").html("가입하신 메일로 임시 비밀번호를 전송했습니다.");
                    
                }else{
                	$("#result").html("입력정보가 틀립니다.");
                }
            }

        })
    });
    */

    // 아이디 찾기  : 화면출력
    $("#btn_ID_search").on("click", function(){
       
       // alert(1);
        
        $.ajax({
            url: '/member/find_id',
            type: 'POST',
            data: {memb_name: $("#memb_name").val()}, // js object문법
            dataType: 'text',
            success: function(data){
                // 비밀번호 출력작업
                
                if(data != ""){
                	$("#result").html($("#memb_name").val() + "님의 아이디는? " + data + "입니다.");
                }else{
                	$("#result").html("입력정보가 틀립니다.");
                }

            }

        })
    });

});