
//
$(document).ready(function() {
	moment.locale('zh-cn');
});

/***********************表单验证**************************/
$(document).ready(function() {
	$('input[type=password]').focus(function(event) {
		/* Act on the event */
		$(this).parents('.form-group').removeClass('has-error');
		$(this).parent().siblings('.err').html('');
	});
	$('input[type=password]').blur(function(event) {
		/* Act on the event */
		var pwd = $(this).val();
		if(!isnull(pwd)){
			$(this).parents('.form-group').addClass('has-error');
			$(this).parent().siblings('.err').html('不能为空');
		}else if(!testlength(pwd)){
			$(this).parents('.form-group').addClass('has-error');
			$(this).parent().siblings('.err').html('密码长度不对');			
		}

	});
	$('input[name=pwd3]').blur(function(event) {
		/* Act on the event */
		var originPwd = $('input[name=pwd1]').val();
		var newPwd = $('input[name=pwd2]').val();
		var newConfirmPwd = $('input[name=pwd3]').val();
		if(!issame(newPwd,newConfirmPwd)){
			$('#errConfirmNewPwd').html('两次输入密码不一致');
		}else if(isnull(originPwd)){
			$('#chgPwd').click(function(event) {
				$.post('ResetPassword.asp',{originPwd:originPwd,newPwd:newPwd},function(data){
					alert(data);
				})
			});
		}
	});

});


function isnull(objc){
	if(objc == ""){
		return false;
	}
	return true;
}
function isnum(objc){
	if(isNaN(objc)){
		return false;
	}
	return true;
}
function issame(objc1,objc2){
	if(objc1 != objc2){
		return false;
	}
	return true;
}

function testlength(objc){
	if(objc.length<6||objc.length>18){
		return false;
	}
	return true;
}
/**************************end**************************/
/************************加载图标***********************/
$(document).ready(function() {
	var top = $(window).height()/2;
	var left = $(window).width()/2;	
	var $content = $("<div style='position:absolute;top:"+top+"px;left:"+left+"px;display:none;'><img src='/static/img/loading.gif'></div>").insertBefore('.container-fluid');

	$(document).ajaxStart(function() {
		$content.show();
	}).ajaxStop(function() {
		$content.hide();
	})
});

/**************************end**************************/
//备份
$(document).ready(function() {
	$('.backupInfo').click(function(event) {
		//Act on the event
		//console.log(this.value);
		var dataInfo = $(this).val();
		console.log(dataInfo);
		//var result=Chkbackup();
		//window.alert(result);
		//三个备份按钮会console：student/selcourse/course
		$.post('/Administrator/Backup.asp',{dataInfo:dataInfo},function(data){
       alert(data);
	})
	});
});

//批量升级
$(document).ready(function() {
	$('#go_upgrade').click(function(event) {
		 /*Act on the event*/ 
			var r = confirm("确定升级？操作不可逆")
			if(r=true){
				$.get('/Administrator/Upgrade.asp', function(data) {
					alert(data);
				});				
			}

	});
});


// 场地设置功能函数
$(document).ready(function() {
	var url = window.location.search;
	console.log(url);
	if (url) {
		url = '#'+url.substr(1);
		switch(url){
			case '#area' : $('a[href='+url+']').tab('show');
			break;
			default:;
			break;
		}
		
	};
	
	// alert(url);
});
$(document).ready(function(){
	$('#addNewArea').click(function(){
		var areaName = $('#areaName').val();
		var areaFunc = $('#areaFunc').val();
		var areaDesc = $('#areaDesc').val();
		var areaSite = $('#areaSite').val();
		$.post('AdminArea.asp',{name:areaName,type:areaFunc,brief:areaDesc,site:areaSite},function(data,status){
			console.log(status);
			$('#addNewItem').after(data);
			window.location.href = window.location.pathname+'?area';

		});
	});

});
//删除某条信息
$(document).ready(function() {
	$('.rowDelete').click(function() {
		/* Act on the event */
		var id = $(this).parent().siblings('.id').text();
		var table = "dbo.field"
		 $.post('NewsDelete.asp',{id:id,table:table},function(status){
		 	console.log(status);
		});
		 $(this).parents('tr').remove();
	});
});




//test
$(document).ready(function(){
	$('#clearblow').click(function(){
		//console.log('dinglingling');
		$('#allTeachers').empty();

	})
})

function showHint(str){
	var xmlhttp;
	if(str.length==0){
		document.getElementById('allTeachers').innerHTML='';
		window.location.reload();
		return;
	}
	if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (true)
    {
    document.getElementById("allTeachers").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","TeacherSearch.asp?Keyword="+str,true);
xmlhttp.send();
}

function showHintStu(str){
	var xmlhttp;
	if(str.length==0){
		document.getElementById('allStudents').innerHTML='';
		window.location.reload();
		return;
	}
	if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (true)
    {
    document.getElementById("allStudents").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","StudentSearch.asp?Keyword="+str,true);
xmlhttp.send();
}



$(document).ready(function() {
	$('#submitBtn').click(function(event) {
		var NewsTitle = $('[name=NewsTitle]').val();
		var NewsContent = UM.getEditor('Editor').getContent();
		var arr = $('.tableName').text().split('@');
		var newsid = arr[1];
		var tableName = arr[0];
		console.log(NewsContent);
		if(NewsTitle == "" || NewsContent == ""){
			alert("标题或内容不能为空");
		}else{
			$.post("NewsSave.asp",{title:NewsTitle,content:NewsContent,table:tableName,newsid:newsid},function(data,status){
				if (status=='success') {
					alert('提交成功');
					window.location.href = window.location.pathname;
				} else {
					alert('保存失败');
				};
			});
		}	
			

	});			
});		


//Delete News
$(document).ready(function() {
	$(".delete").click(function(event) {
		var newsid = $(this).siblings("[name='newsId']").text();
		var Bulletin = "dbo.Bulletin"
		$.post("NewsDelete.asp",{id:newsid,table:Bulletin},function(data,status){
			console.log(status);
			//alert(data);
		})
		$(this).parent().remove();
	});
});
//Delete article
$(document).ready(function() {
	$(".deleteArticle").click(function(event) {
		var newsid = $(this).siblings("[name='newsId']").text();
		var article = "dbo.article"
		$.post("NewsDelete.asp",{id:newsid,table:article},function(data,status){
			console.log(status);
			//alert(data);
		})
		$(this).parent().remove();
	});
});


function Edit(id,tab){
	var newsid = id;
	var table = tab;
	console.log(newsid);
	$.post("NewsEdit.asp",{id:newsid,table:table},function(data,status){
		console.log(status);
		$('#replaceContent').append(data);
		//alert(data);
	});
	$('#NewsEdit').modal('toggle').on('hidden.bs.modal',  function(event) {
		location.reload();

	});
	$('#updateNews').click(function(event) {
	var NewsTitle = $("[name='retitle']").val();
	var NewsContent = $("[name='recontent']").val();
	var NewsPoster = $("[name='reposter']").val();
	var Bulletin = "dbo.Bulletin"
		$.post("NewsResave.asp",{id:newsid,title:NewsTitle,content:NewsContent,poster:NewsPoster,table:Bulletin},function(data,status){
			console.log(status);
			//alert(data)
			location.reload();
		});
	});	
}
/*********************CourseReview.asp*******************************/
$(document).ready(function() {
	$('.courseDetail').click(function(event) {
		/* Act on the event */
		var name = $(this).parent("td").siblings("[name='name']").text();
		var tempid = $(this).parent("td").siblings("[name='id']").text();
		$.post('CourseReviewGet.asp',{id:tempid},function(data){
			//console.log(status)			
			$('#contentReplace').append(data);
		})		
		$('#titleReplace').append(name);
		courseDetail(tempid);
	});
	
		$('#detailReview').modal('hide').on('hidden.bs.modal',  function(event) {
		window.location.reload()
		});
});

function courseDetail(id) {
	$('#submitReview').click(function(event) {
		var checkValue = $('input[name=optionsRadios]:checked').val();
		var reason = $('textarea[name=reason]').val();
		if (checkValue==null) {
			checkValue = 0;
		};
		console.log(checkValue);

		$.post('CourseReviewSet.asp', {checkflag: checkValue,id:id,reason:reason}, function(data) {
			/*optional stuff to do after success */
			 console.log(data);

		});
		
		 window.location.reload();
	});
}

//yearpick
$(document).ready(function() {
	var date = new Date();
	var sYear = date.getFullYear();
	var year = sYear-1;
	var content = ""
	for (var i = 0; i < 5; i++) {
		year++;
		var nextYear = year+1;
		content += "<option>"+year+"-"+nextYear+"</option>";
	};
	$('#yearpick').append(content);
});


//20150912添加页面刷新
function refresh(){
    window.location.reload();//刷新当前页面.
    
    //或者下方刷新方法
    //parent.location.reload()刷新父亲对象（用于框架）--需在iframe框架内使用
    // opener.location.reload()刷新父窗口对象（用于单开窗口
  //top.location.reload()刷新最顶端对象（用于多开窗口）
}

 //termset
$(document).ready(function() {
	$("#termSet").on('click',function() {
		/* Act on the event */
		console.log('bing');
        var schoolyear=$("#yearpick").find("option:selected").text(); //*/ //获取Select选择的Text
       //var schoolyear=$("#yearpick:selected").text();
      // var schoolyear=document.getElementById("select").value; 
     //var schoolyear=$("#yearpick").val();  //获取Select选择的Value
		//var schoolyear = $('input[name=schoolyear]').val();
		var term1 = $('input[name=term1]').val();
		var term2 = $('input[name=term2]').val();
		$.post('AdminTermSet.asp',{distinction:"0",termyear:schoolyear,term1:term1,term2:term2},function(data){
			console.log(data);
	           });
	    refresh();
	    alert("时间修改成功");
	});
	
});
$(document).ready(function() {
	$('#opentime').click(function(event) {
		var selecttime = $('input[name=selecttime').val();
		$.post('AdminTermSet.asp', {distinction:"1",selecttime:selecttime}, function(status) {
			/*optional stuff to do after success */
			alert("设置"+status);
		});
	});
});
//页码跳转
$(document).ready(function() {
	$('#jumpto').click(function(event) {
		/* Act on the event */
		var page = $(this).siblings('.jumppage').val();
		if (page.length==0){
			page = 1;
		}
		
		
		window.location.href = window.location.pathname+'?page='+page;
		
	});
});
//>>>>>>>>>>>>>>>>>>>>>>>CourseArrange.asp<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
$(document).ready(function() {
	$(".toresult").click(function(event) {	
	var top = $(window).height()/2;
	var left = $(window).width()/2;	
	var $content = $("<div style='position:absolute;top:"+top+"px;left:"+left+"px;display:none;'><img src='/Administrator/img/loading.gif'></div>").insertBefore('.container-fluid');
		$content.show();

		$(this).addClass('disabled');

	});
});
$(document).ready(function() {
	$('.toSave').click(function(event) {
		/* Act on the event */
		var a1 = $('.a1-stuno').toArray();
		var a2 = $('.a2-stuno').toArray();
		var a3 = $('.a3-stuno').toArray();
		var a4 = $('.a4-stuno').toArray();
		var a5 = $('.a5-stuno').toArray();
		var course = $('[role=presentation]').toArray();
		var courseid = "";
		var result5 = ""
		var result4 = ""
		var result3 = ""
		var result2 = ""
		var result1 = ""


		for(i=0;i<course.length;i++){
			courseid += course[i].innerText;
			courseid += ","
		}
		console.log(courseid);
		//可以改成在外层嵌套个循环
		for(j=0;j<a1.length;j++){
			result1 += a1[j].innerText; 
			result1 += ",";
		}
		console.log(result1);
		for(j=0;j<a2.length;j++){
			result2 += a2[j].innerText; 
			result2 += ",";
		}
		console.log(result2);
		for(j=0;j<a3.length;j++){
			result3 += a3[j].innerText; 
			result3 += ",";
		}
		console.log(result3);
		for(j=0;j<a4.length;j++){
			result4 += a4[j].innerText; 
			result4 += ",";
		}
		console.log(result4);
		for(j=0;j<a5.length;j++){
			result5 += a5[j].innerText; 
			result5 += ",";
		}
		console.log(result5);
		$.post('/Administrator/CourseArrangeSet.asp', {courseid:courseid,result1:result1,result2:result2,result3:result3,result4:result4,result5:result5}, function(data,status) {
			/*optional stuff to do after success */
			console.log("set results");
			console.log(status);
			$('.feedback').append(status);
			//alert(status);
		});
	});
});
//progress bar
$(document).ready(function() {
	$('.percent').change(function(event) {
		/* Act on the event */
		var percent;
		percent = parseInt($(this).val());
		if (percent == ""){
			percent = 0;
		}
		// console.log(percent);
		if (percent<0 || percent>100){
			$(this).parent().addClass('has-error');
		}else{
			$(this).parent().removeClass('has-error');
			var percentNow = 0;
			$('input.percent').each(function() {
				var dd = $(this).val();
				if(dd==""){
					dd = 0;
				}
				percentNow += Number(dd);
				// console.log(dd);
				// console.log(percentNow);
			});
			if (percentNow<0 || percentNow>100){
				$('.percent').parent().addClass('has-error');
			}else{
				$('.percent').parent().removeClass('has-error');
				$('.progress-bar').attr({"aria-valuenow":percentNow,"style":"width:"+percentNow+"%"});
				$('.progress-bar').text(percentNow+"%");				
			}

		}
	});
});

$(document).ready(function() {
	var tyear,tterm,tgrade;

	var combine = "";
	var substr = "";

	var scoretab;
	var appenddata;
	$('#tyear').blur(function(event) {
		tyear = $(this).val();
		if (tyear != "") {
			combine = tyear.slice(0,4) + tyear.slice(5, 9);
			// console.log(combine);
		};
		checklen(combine,substr);
	});
	$('#tterm').blur(function(event) {
		tterm = $(this).val();
		
		if (tterm == '1') {
			substr = 1;
		}else{
			substr = 2;
		};
		checklen(combine,substr);
	});
	$('#tgrade').blur(function(event) {
		tgrade = $(this).val();
	});
	function checklen(str1,str2){
		var len = (str1+str2).length;
		if (len != 9) {
			return false;
		}else{
			scoretab = "score"+str1+str2;
			$.post('CourseArrangeRefer.asp',{table:scoretab,grade:tgrade},function(data){
				appenddata = data;
				 // alert(data);
				appends(appenddata);
				scoretab = "";
			});

		};
	}

	function appends(str){
		var arr = str.split(" ");
		$('.conditions').children('option').remove();
		$('.conditions').append('<option value="">考试</option>');
		for(var i = 0; i < arr.length; i++){
			$('.conditions').append('<option>'+arr[i]+'</option>');
			
		}

	}
});
/********************************end***********************************/
/*********************StudentManage.asp*******************************/
$(document).ready(function() {
	$('.stuInfoCat').click(function(event) {
		/* Act on the event */
		var stuno = $(this).children('[name=stuno]').text();
		$.post('StudentManageInfo.asp',{stuno:stuno},function(data){
			// console.log(data);
			$('#stuDetail').append(data);
		});
		$('#stuModal').modal('toggle');

	});
	$('#stuModal').on('hidden.bs.modal', function () {
  		window.location.reload();
	})
});		
/********************************end***********************************/
/*********************TeacherManage.asp********************************/
$(document).ready(function() {
	$('.teaInfo .viewcourse').click(function(event) {
		/* Act on the event */
		var teano = $(this).children('[name=teano]').text();

		$.post('TeacherManageInfo.asp',{teano:teano},function(data){
			 console.log(data);
			$('#myModalLabel').html(teano);
			$('#teaDetail').append(data);
		});
		$('#teaModal').modal('toggle');
	});
	$('#teaModal').on('hidden.bs.modal', function () {
  		window.location.reload();
	})	
});
//teacher Edit
//点击后从数据库获得数据，第二个函数调用模态窗口并加入数据
$(document).ready(function() {
	$('.teacherEdit tr td .viewtea').addClass('creatModal');

	$('.creatModal').click(function(){
		var findTd = $(this).parents('td').siblings('td');
		var teano = $(this).parent().attr('id');
		$("#teaModalLabel").text(teano);
		var information = new Object();
		information.name = findTd.eq(2).text();
		information.gender = findTd.eq(3).text();
		information.title = findTd.eq(4).text();
		console.log(information);
		$('#teacherName').val(information.name);
		
		// if (information.gender=="男") {
		// 	$('#male').attr('checked');
		// }else{
		// 	$('#female').attr('checked');
		// };
		$('#optionsRadios').prepend('<option value="'+information.gender+'" selected>'+information.gender+'</option>');
		$('#selfIntroduction').attr('placeholder',information.brief);
		console.log($('#optionsRadios'));

		$('#myModal').modal('toggle')
	}) 
});




///////////////////////////20150923修改 modify/delete teacher///////////////////////////////////////

$(document).ready(function() {

	$('#saveTeaChange').click(function(event) {
		/* Act on the event */
        var Teano= $('#teaModalLabel').text();
		var Tname = $('#teacherName').val();
		var Tgender= $('#optionsRadios').val();
		//var Tentertime = $('#entertime').val();
		var Ttype = $('#Ttype').val();
		//var Ctype = $('#Ctype').val();
		var intr=$('#selfIntroduction').val();
	    console.log(Teano+Tname+Tgender+Ttype+intr);
		//console.log(Teano+Tname+Tgender+Tentertime+Ttype+Ctype+intr);
		$.post('TeacherManageDel.asp',{distinct:"1",Teano:Teano,Tname:Tname,Tgender:Tgender,Ttype:Ttype,intr:intr}, function(data) {
			alert(data);
				window.location.reload();
	    });
	});
	$('#delTeano').click(function(event) {
		/* Act on the event */
		var Teano= $('#teaModalLabel').text();
		//var courseid = $('#myModalLabel').text();
		$.post('TeacherManageDel.asp',{distinct:"0",Teano:Teano}, function(data) {
			alert(data);
				window.location.reload();
		});
	});
});


///////////////////////////20151007修改 modify/delete stu///////////////////////////////////////

$(document).ready(function() {

	$('#saveStuChange').click(function(event) {
		/* Act on the event */
        var Stuno= $('#stuModalLabel').text();
		//var Stuno=$('#stuNo').val();
		var Sname = $('#stuName').val();
		var Sgender= $('#stuoptionsRadios').val();
		var Classno= $('#classNo').val();
		var Classname= $('#className').val();
        var Stime= $('#startTime').val();
	    console.log(Stuno+Sname+Sgender+Classno+Classname+Stime);
		//console.log(Teano+Tname+Tgender+Tentertime+Ttype+Ctype+intr);
		$.post('StuManageDel.asp',{distinct:"1",Stuno:Stuno,Sname:Sname,Sgender:Sgender,Classno:Classno,Classname:Classname,Stime:Stime}, function(data) {
			alert(data);
				window.location.reload();
	    });
	});
	$('#delStuno').click(function(event) {
		/* Act on the event */
		var Stuno= $('#stuModalLabel').text();
		//var courseid = $('#myModalLabel').text();
		$.post('StuManageDel.asp',{distinct:"0",Stuno:Stuno}, function(data) {
			alert(data);
				window.location.reload();
		});
	});
});


//student Edit20151007

//点击后从数据库获得数据，第二个函数调用模态窗口并加入数据
$(document).ready(function() {
	$('.studentEdit .stuEdit').addClass('creatStuModal');
	console.log($('.studentEdit .stuEdit'));
	$('.creatStuModal').click(function(){
		var findTd = $(this).parents('td').siblings('td');
		var stuno = $(this).parent().attr('id');
		// alert($('#teaModalLabel'));
		$("#stuModalLabel").text(stuno);
		//alert(teano);
		console.log(findTd);
		var information = new Object();
		information.stuno = findTd.eq(1).text();
		information.name= findTd.eq(2).text();
		information.sex = findTd.eq(3).text();
		information.classno = findTd.eq(4).text();
		information.classname = findTd.eq(5).text();
		//information.photo = '';
		$('#stuName').val(information.name);
		$('#classNo').val(information.classno);
		$('#className').val(information.classname);
		$('#optionsRadios').prepend('<option value="'+information.gender+'">'+information.gender+'</option>');
		console.log(information.className);
		$('#modifyModal').modal('toggle')

	}) 
});



/********************************end***********************************/
/*********************CourseManage.asp********************************/
$(document).ready(function() {
	$('courseClick').click(function(event) {
		/* Act on the event */
		var courseid = $(this).children('[name=courseid]').text();

		$.post('CourseManageGet.asp',{courseid:courseid},function(data){
			 console.log(data);
			$('#myModalLabel').html(courseid);
			$('#courseContent').append(data);
		});
		$('#courseModal').modal('toggle');					
	});
	$('#courseModal').on('hidden.bs.modal', function () {
  		window.location.reload();
	});	
});
$(document).ready(function() {
	$('.courseClick').click(function(event) {
		$(this).next().slideToggle();

	});
});
$(document).ready(function() {

	$('.saveTimeSite').click(function(event) {
		/* Act on the event */
		var time1 = $(this).parents('.attachTool').find('.date1').val();
		var time2 = $(this).parents('.attachTool').find('.date2').val();
		var classSite = $(this).parents('.attachTool').find('.csite').val();
		var courseid = $(this).parents('.attachTool').attr('name');
		var weekday = $(this).parents('.attachTool').find('.weekday').val();
		console.log(time1+time2+classSite+courseid+weekday);
		if (time1 && time2 && classSite && courseid && weekday) {
			$.post('/Administrator/CourseManageDel.asp',{distinct:"1",courseid:courseid,time1:time1,time2:time2,classSite:classSite,weekday:weekday}, function(data) {
				alert(data);
			});			
		}else{
			alert('不能为空');
		};

	});
	$('.delCourse').click(function(event) {
		/* Act on the event */
		// var time1 = $('#time1').val();
		// var time2 = $('#time2').val();
		//var classSite = $('#classSite').val();
		var courseid = $(this).parents('.attachTool').attr('name');
		alert(courseid);
		$.post('/Administrator/CourseManageDel.asp',{distinct:"0",courseid:courseid}, function(data) {
			alert(data);
		});
		window.location.reload();
	});
});

//全选功能
$(document).ready(function() {
	$('#allChecked').change(function() {
		/* Act on the event */
		$('input[name=checkList]').prop('checked',$(this).prop('checked'));

	});
});
//删除结果
$(document).ready(function() {
	$('#delStuSave').click(function(event) {
		var checkBoxArr = [];
		var courseid = $('p[name=courseid]').text();
		$('input[name=checkList]:checked').each(function(){
			checkBoxArr.push(this.value);
		});
		console.log(courseid);
		var arrData = checkBoxArr.join(',');
		$.post('CourseManageRemove.asp',{courseid:courseid,condition:arrData},function(data){
			alert("删除结果"+data);
		});
		window.location.href="/Administrator/CourseManageDetail.asp?courseid="+courseid;
	});
});
/********************************end***********************************/

//日期选择

$(document).ready(function() {
	$('#term1set').daterangepicker({format: 'YYYY-MM-DD'}, function(start, end, label) {
	    console.log(start.toISOString(), end.toISOString(), label);
	});
	$('#term2set').daterangepicker({format: 'YYYY-MM-DD'}, function(start, end, label) {
	    console.log(start.toISOString(), end.toISOString(), label);
	});
	$('#selecttime').daterangepicker({format: 'YYYY-MM-DD'}, function(start, end, label) {
	    console.log(start.toISOString(), end.toISOString(), label);
	});
});
