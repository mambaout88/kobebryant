$(function(){
	InitLeftMenu();
	tabClose();
	tabCloseEven();
})

//初始化左侧
function InitLeftMenu() {

    $(".easyui-accordion").empty();
    var menulist = "";
   
    $.each(_menus.menus, function(i, n) {
        menulist += '<div title="'+n.menuname+'"  icon="'+n.icon+'" style="overflow:auto;">';
		menulist += '<ul>';
        $.each(n.menus, function(j, o) {
			menulist += '<li><div><a target="mainFrame" href="' + o.url + '" ><span class="icon '+o.icon+'" ></span>' + o.menuname + '</a></div></li> ';
        })
        menulist += '</ul></div>';
    })

	$(".easyui-accordion").append(menulist);
	
	$('.easyui-accordion li a').click(function(){
		var tabTitle = $(this).text();
		var url = $(this).attr("href");
		addTab(tabTitle,url);
		$('.easyui-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
	}).hover(function(){
		$(this).parent().addClass("hover");
	},function(){
		$(this).parent().removeClass("hover");
	});

	$(".easyui-accordion").accordion();
}

function addTab(subtitle,url){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			width:$('#mainPanle').width()-10,
			height:$('#mainPanle').height()-26
		});
	}else{
		$('#tabs').tabs('select',subtitle);
	}
	tabClose();
}

function createFrame(url)
{
	var s = '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}

 function tabClose()
{
	/*双击关闭TAB选项卡*/
	/*$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children("span").text();
		$('#tabs').tabs('close',subtitle);
	})

	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY,
		});
		
		var subtitle =$(this).children("span").text();
		$('#mm').data("currtab",subtitle);
		
		return false;
	});*/
}


//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}

function clockon() {
    var now = new Date();
    var year = now.getFullYear(); //getFullYear getYear
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;

    $("#bgclock").html(time);

    var timer = setTimeout("clockon()", 200);
}




var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"基础信息管理",
							"menus":[{"menuname":"类别","icon":"icon-nav","url":"demo3.html"},
									{"menuname":"产品","icon":"icon-add","url":"demo4.html"},
									{"menuname":"供应商","icon":"icon-users","url":"demo5.html"},
									{"menuname":"员工","icon":"icon-role","url":"demo6.html"}
								]
						},
                        {"menuid":"8","icon":"icon-sys","menuname":"客户管理",
							"menus":[{"menuname":"客户","icon":"icon-nav","url":"demo1.html"}
								]
						},
                        {"menuid":"28","icon":"icon-sys","menuname":"组织架构",
							"menus":[{"menuname":"部门","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"角色","icon":"icon-nav","url":"demo7.html"},
									{"menuname":"用户","icon":"icon-nav","url":"demo8.html"}
								]
						},
                        {"menuid":"39","icon":"icon-sys","menuname":"系统管理",
							"menus":[{"menuname":"菜单管理","icon":"icon-nav","url":"/shop/productcatagory.aspx"},
									{"menuname":"权限中心","icon":"icon-nav","url":"tabs_demo.html"},
									{"menuname":"数据权限","icon":"icon-nav","url":"/shop/orders.aspx"},
                                    {"menuname":"底层权限","icon":"icon-nav","url":"/shop/orders.aspx"},
                                    {"menuname":"页面配置（字段权限）","icon":"icon-nav","url":"/shop/orders.aspx"}
								]
						}
				]};
        //设置修改密码窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                height: 160,
                resizable:false
            });
        }
        //关闭修改密码窗口
       function fuck() {
            $('#w').window('close');
        }

       

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！' + msg, 'txt01');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        function logout(){
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = 'login.html';
                    }
                });

        }
       





   






