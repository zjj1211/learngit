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
		}
		// else if(!testlength(pwd)){
		// 	$(this).parents('.form-group').addClass('has-error');
		// 	$(this).parent().siblings('.err').html('密码长度不对');			
		// }

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
$(document).ready(function() {
	$('input').focus(function(event) {
		/* Act on the event */
		$(this).parent().removeClass('has-error');
	});	
	$('input').blur(function(event) {
		/* Act on the event */
		var value = $(this).val();
		if(value == ""){
			$(this).parent().addClass('has-error');			
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

	$('.addLoading').click(function(event) {
		/* Act on the event */
		$content.show();
	});
});

/**************************end**************************/
//
$(document).ready(function() {
	$('#changeName').click(function(){

		var txt = "";
		txt = $('#name>label').text();
		// console.log(txt);
		var input = "<input type=\'text\' value=\'";
		input += txt;
		input += "\'>";
		$('#name>label').html(input);
		this.id = 'nameDone';
	})

	$('#nameDone').click(function(){
		var txt = '';
		txt = $('#name>input').val();
		// console.log(txt);
		var label = '<h3>';
		label += txt;
		label += '</h3>';
		$('#name>label').html(label);
		this.id = 'changeName';
	})
});

//
$(document).ready(function(){
	$('#edit').click(function(){
		// console.log('ding!');
		$('<li><label class="label label-primary">新增</label></li>').insertBefore('#edit');
	})
});

function delLabel(clickLabel){
	$(clickLabel).parents('li').remove();
}

$(document).ready(function(){
	$('#editSubject').click(function(){
		var addIcon = '';
		addIcon += '<li><label class="label label-default"><span class="glyphicon glyphicon-plus"></span></label></li>';
		$(addIcon).appendTo(".infoDisplay");
	})
})

function addRemoveIcon(clickLabel){
	$('.infoDisplay>li>label').insertBefore('<div class="glyphicon glyphicon-remove removeIcon" onclick=delLabel(this);></div>');
}
// 场地设置功能函数
function del(clickRow){
	// console.log('bing!');
		$(clickRow).parents('tr').remove();
}

$(document).ready(function(){
	var rowNumber = 1;
	$('#addNewArea').click(function(){
		rowNumber += 1;
		var rowHtml = '';
		var areaName = $('#areaName').val();
		var areaFunc = $('#areaFunc').val();
		var areaDesc = $('#areaDesc').val();
		rowHtml += '<tr><td>';
		rowHtml += rowNumber;
		rowHtml += '</td><td>';
		rowHtml += areaName;
		rowHtml += '</td><td>';
		rowHtml += areaFunc;
		rowHtml += '</td><td>';
		rowHtml += areaDesc;
		rowHtml +=  '</td><td><button class="btn btn-danger btn-sm" onclick=del(this);>删除</button></td></tr>';
		$(rowHtml).appendTo('#addNewItem');
	})

});

//teacher Edit
//点击后从数据库获得数据，第二个函数调用模态窗口并加入数据
$(document).ready(function() {
	$('.teacherEdit tr td button').addClass('creatModal');

	$('.creatModal').click(function(){
		var findTd = $(this).parents('td').siblings('td');
		// console.log(findTd);
		var information = new Object();
		information.name = findTd.eq(0).text();
		information.gender = findTd.eq(1).text();
		information.time = findTd.eq(2).text();
		information.title = findTd.eq(3).text();
		information.subject = findTd.eq(4).text();
		information.photo = '';
		information.brief = findTd.eq(6).text();
		// console.log(information);
		$('#teacherName').attr('placeholder',information.name);
		
		// if (information.gender=="男") {
		// 	$('#male').attr('checked');
		// }else{
		// 	$('#female').attr('checked');
		// };

		$('#selfIntroduction').attr('placeholder',information.brief);
		// console.log(information.brief);

		$('#myModal').modal('toggle');
	}) 
});

//saveChange

//change page
$(document).ready(function(){
	$('.pagination>li').click(function(){
		$('.pagination>.active').removeClass('active');
		$(this).addClass('active');
	})
})

//uploadFile

function checkPic() {
    var picPath = document.getElementById("picPath").value;
    var type = picPath.substring(picPath.lastIndexOf(".") + 1, picPath.length).toLowerCase();
    if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
        alert("请上传正确的图片格式");
        return false;
    }
    return true;
}
//密码重置
$(document).ready(function() {
	$('.passwordReset').click(function(event) {
		/* Act on the event */
		var flag = 1;
		var stuno = $(this).parent().siblings('[name=stuno]').text();
		$.post('PasswordReset.asp',{stuno:stuno,flag:flag},function(data){
			alert(stuno+"的密码成功修改为"+stuno);
		});
	});
	$('#resetAll').click(function(event) {
		/* Act on the event */
		var flag = 0;
		$.post('PasswordReset.asp',{flag:flag},function(data){
			alert('全部修改完成');
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
		// var url = 'SelectionResults.asp?page='+page;
		
		window.location.href = window.location.pathname+'?page='+page;
	});
});
/**************************StudentManageCourse.asp.asp***************************/
$(document).ready(function() {
	$('.scores').blur(function(event) {
		/* Act on the event */
		var score = $(this).val();
		var stuno = $(this).parent().siblings('[name=stuno]').text();
		//alert(stuno);
		$.post('StudentManageSet.asp', {stuno:stuno,score:score}, function(data, textStatus, xhr) {
			/*optional stuff to do after success */
		});
	});
});

/**************************************************************************/
/**************************CourseReview.asp.asp***************************/
$(document).ready(function() {
	$('.forclick').click(function(event) {
		/* Act on the event */
		$(this).next().children('td').slideToggle('fast');
	});	
});

$(document).ready(function() {
	$('.courseDetail').click(function(event) {
		/* Act on the event */
		var courseid = $(this).parent().siblings('[name=courseid]').text();
		// console.log(courseid);
		$.post('CourseManageGet.asp',{courseid:courseid}, function(data) {

			// console.log(data);
			$('#myModalLabel').html(courseid);
			$('#courseContent').append(data);
		});
		$('#courseModal').modal('toggle');	
	});
	$('#courseModal').on('hidden.bs.modal', function () {
  		window.location.reload();
	});		
});

/**************************************************************************/
/**************************Recruitment.asp***************************/



/**************************************************************************/
/**************************RecruitmentSelect.asp***************************/
//add single
$(document).ready(function() {
	$('.addToClass').click(function(event) {
		/* Act on the event */
		var courseid = $(this).siblings('p').text();
		var stuno = $(this).parent().siblings('[name=stuno]').text();
		// console.log(stuno);
		$.post('RecruitmentSet.asp',{courseid:courseid,condition:stuno},function(status){
			//console.log(data);
			alert("status:success"+status);
		});
		window.location.href="RecruitmentSelect.asp?"+courseid;
	});
});

$(document).ready(function() {
	$('.saveClass').click(function(event) {
		/* Act on the event */
		var grade = $('.searchGrade').val();
		var classno = $('.searchClass').val();
		var courseid = $('p[name=courseid]').text();
		 // alert(grade+classno+courseid);
		$.post('RecruitmentSetClass.asp',{grade:grade,classno:classno,courseid:courseid},function(status){
			alert("status:success"+status);
		});
		window.location.reload();
	});

});

//del
// $(document).ready(function() {
// 	$('.deleteStu').click(function(event) {
// 		/* Act on the event */
// 		var courseid = $(this).siblings('p').text();
// 		var stuno = $(this).parent().siblings('[name=stuno]').text();
// 		console.log(stuno);
// 		$.post('RecruitmentRemove.asp',{courseid:courseid,condition:stuno},function(data){
// 			//console.log(data);
// 			alert(data);
// 		});
// 		window.location.href="RecruitmentDelete.asp?"+courseid;
// 	});
// });

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
		var arrData = checkBoxArr.join(',');
		$.post('RecruitmentRemove.asp',{courseid:courseid,condition:arrData},function(data){
			alert("删除结果"+data);
		});
		window.location.href="RecruitmentDelete.asp?"+courseid;
	});
});
//保存结果
$(document).ready(function() {
	$('#addStuSave').click(function(event) {
		/* Act on the event */
		var checkBoxArr = "";
		var courseid = $('p[name=courseid]').text();
		$('input[name=checkList]:checked').each(function() {
			checkBoxArr += this.value;
			checkBoxArr += ",";
		});
		$.post('RecruitmentSet.asp', {stunoArr:checkBoxArr,courseid:courseid}, function(data) {
			/*optional stuff to do after success */
			alert("添加结果："+data);
		});
		window.location.href="RecruitmentSelect.asp?"+courseid;
		//console.log(checkBoxArr);
	});
});
/**************************************************************************/
/**************************CourseResourceUpload.asp************************/
$(document).ready(function() {
	$('#submitBrief').click(function(event) {
		/* Act on the event */
		var content = UM.getEditor('myEditor').getContent();
		var courseid = $('.courseid').text();
		$.post('getContent.asp',{content:content,courseid:courseid},function(status){
			// console.log(status);
			if (status=true) {
				alert("保存成功");
			};
		})
	});
});



/**************************************************************************/




