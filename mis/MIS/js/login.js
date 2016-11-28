$(function(){
    $('#lo').dialog({
        title : '登录后台',
        width :300 ,
        height:180,
       
       
    });
    $('#manager').validatebox({
        required:true,
        missingMessage:'请输入管理员账号',
        invalidMessage:'管理员账号不得为空',

    });

     $('#password').validatebox({
        required:true,
        validType:'length[6,30]',
        missingMessage:'请输入管理员密码',
        invalidMessage:'请输入6到30位的密码',

    });
        if(!$('#manager').validatebox('isValid')){
            $('#manager').focus();
        }else if(!$('#password').validatebox('isValid')){
            $('#password').focus();
    }


    $('#btn a').click(function(){
        if(!$('#manager').validatebox('isValid')){
            $('#manager').focus();
        }else if(!$('#password').validatebox('isValid')){
            $('#password').focus();
    }else{

    }
    });
});