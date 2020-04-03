(function($){
	
	//这里是闭包的一个典型应用---封装局部变量和函数。
	//这里time的获得需要通过一系列局部变量和一个局部函数filternum实现，为了起到封装变量的效果用到闭包和自调用函数
	//可以避免变量在全局范围内被污染
	//闭包的优势：1.一个变量可以长期存储在内存中，延长变量寿命。
	//			  2.避免不小心污染同名全局变量。
	//				var scope = "global scope"; 
	//				function checkScope() {
	//   				var scope = "local scope";
	//    				return function() {
	//        				return scope;
	//    				}()  				
	//				}
	//				checkScope()();   返回local scope ,避免了由于同名可能造成的全局变量被污染。
	//			  3.封装变量，私有成员的存在。
	//但是闭包这样用也有缺点：这些变量会一直存在于内存中，浪费内存。所以要正确合适的使用。
	var time=(function(){
			function filterNum(num){
				if(num < 10){
					return "0"+num;
				}else{
					return num;
				}
			 }
			  var ans="";
			  var nowDate = new Date();
			  var year = nowDate.getFullYear();
			  var month = filterNum(nowDate.getMonth()+1);
			  var day = filterNum(nowDate.getDate());
			  var hours = filterNum(nowDate.getHours());
			  var min = filterNum(nowDate.getMinutes());
			  var seconds = filterNum(nowDate.getSeconds());
		
			  //由于函数外部不能访问到filternum以及一系列变量，所以起到了封装的效果，并且可以同过返回该匿名函数的方法
			  //成功把ans返回出去
			  return function(){
				  return  ans=year+"-"+month+"-"+day+" "+hours+":"+min+":"+seconds;
			  }()
	})();

	
	console.log("time = "+time);
	
	function crateCommentInfo(obj){	
		if(typeof(obj.time) == "undefined" || obj.time == ""){
			obj.time = time;
		}
		
		var el = "<div class='comment-info'><header><img src='"+obj.img+"'></header><div class='comment-right'><h3>"+obj.replyname+"</h3>"
				+"<div class='comment-content-header'>";
		if(typeof(obj.id) != "undefined" && obj.id != ""){
			el = el + "<span><i class='glyphicon glyphicon-globe'></i> "+obj.id+"</span>";
		}
		if(typeof(obj.address) != "undefined" && obj.browse != ""){
			el =el+"<span><i class='glyphicon glyphicon-map-marker'></i>"+obj.address+"</span>";
		}
		el = el+"</div><p class='content'>"+obj.content+"</p><div class='comment-content-footer'><div class='row'><div class='col-md-10'>";
		
		if(typeof(obj.osname) != "undefined" && obj.osname != ""){
			el =el+"<span><i class='glyphicon glyphicon-pushpin'></i> 来自:"+obj.osname+"</span>";
		}
		
		if(typeof(obj.browse) != "undefined" && obj.browse != ""){
			el = el + "<span><i class='glyphicon glyphicon-globe'></i> "+obj.browse+"</span>";
		}
		if(typeof(obj.time) != "undefined" && obj.time != ""){
			el = el + "<span><i class='glyphicon glyphicon-time'></i>"+obj.time+"</span>";
		}
		el = el + "</div><div class='col-md-2'><span class='reply-btn'>回复</span></div></div></div><div class='reply-list'>";
		
	
		
		
		if(obj.replyBody != "" && obj.replyBody.length > 0){
			var arr = obj.replyBody;
			for(var j=0;j<arr.length;j++){
				var replyObj = arr[j];
				el = el+createReplyComment(replyObj);
			}
		}
		
		el = el+"</div></div></div>";
		return el;
	}
	
	//返回每个回复体内容
	function createReplyComment(reply){
		var replyEl = "<div class='reply'><div><a href='javascript:void(0)' class='replyname'>"+reply.replyname+"</a>:<a  href='javascript:void(0)'>@"+reply.bereplyname+"</a><span>"+reply.content+"</span></div>"
						+ "<p><span>"+reply.time+"</span> <span class='reply-list-btn'>回复</span></p></div>";
		return replyEl;
	}

	function replyClick(el){
		el.parent().parent().append("<div class='replybox'><textarea cols='80' rows='50' placeholder='写个昵称吧......' class='mynamearea'></textarea><textarea cols='80' rows='50' placeholder='来说几句吧......' class='mytextarea' ></textarea><span class='send'>发送</span></div>")
		.find(".send").click(function(){			//这里也是一个回掉函数！
			var content = $(this).prev().val();
			var name = $(this).prev().prev().val();
			console.log(name);
			if(name==""){
				name="匿名";
			}
			if(content != ""){
				var parentEl = $(this).parent().parent().parent().parent();
				var obj = new Object();
				obj.replyName=name;
				console.log(name+"????");
				if(el.parent().parent().hasClass("reply")){
					obj.beReplyName = el.parent().parent().find("a:first").text();
					obj.id=parentEl.find("span:first").text();
				}else{
					obj.beReplyName=parentEl.find("h3").text();
					obj.id=parentEl.find("span:first").text();
				}
				obj.content=content;
				obj.time = time;
				var replyString = createReplyComment(obj);
				$(".replybox").remove();
				parentEl.find(".reply-list").append(replyString).find(".reply-list-btn:last").click(function(){alert("不能回复自己");});
								
				$.ajax({
				    url:'dbUpdate',
				    type:'POST', //GET
				    async:false,    //或false,是否异步
				    data:{
				    	   replyname:name,
					       content:obj.content,
					       address:"",
					       time:obj.time,
					       osname:"",
					       bereplyname:obj.beReplyName,
					       browse:"",
					       id:obj.id,
					       flag:0,
					       query:0
				    },
				    timeout:5000,    //超时时间
				    dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
				    success:function(data,textStatus,jqXHR){//data是成功后，接收的返回值

				        
				    }
			   	});
				//console.log("ajax传输成功");
				 location.assign(location);
			}else{
				alert("空内容");
			}
		});
	}
	
	
	$.fn.addCommentList=function(options){
		var defaults = {
			data:[],
			add:""
		}
		var option = $.extend(defaults, options);

			var dataList = option.data;
			var json;  
			$.ajax({
			    url:'dbUpdate',
			    type:'POST', //GET
			    async:false,    //或false,是否异步
			    data:{
			    	  query:1
			    },
			    timeout:5000,    //超时时间
			    dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
			   
			    success:function(data){//data是成功后，接收的返回值			        
			       //－18是因为不知道为啥，末尾总是有一个"serve at /myblog"
			    	var temp=data.length-18;
			    	
			       var str="";
			       for(var i=0;i<=temp-1;i++){
			    	   str+=data[i];
			       }
			    
			       json=  JSON.parse(str); //可以将json字符串转换成json对象 
			    	   
			    },
			    error: function(e) {
	                console.log("error")
	            },
		   	});
						
		//	console.log("///"+json);
			var maxn=0;
			for(var i=0;i<=json.length-1;i++){
				//console.log(json[i].id);
				if(json[i].id>maxn) maxn=json[i].id;
			}
			console.log(maxn);
			
			var num=0;
			for(var i=maxn;i>=1;i--){
				//找楼主的评论
				var obj = new Object();
				for(var t=0;t<=json.length-1;t++){
					if(json[t].id==i&&json[t].flag==1){
						obj = json[t];
						obj.img="./img/reply.jpg";
						break;
					}
				}
				
				var list =[];
				for(var t=0;t<=json.length-1;t++){
					if(json[t].id==i&&json[t].flag==0){
						var obj1 = json[t];
						obj1.img="./img/reply.jpg";
						list.push(obj1);
					}
				}
				
				obj.replyBody=list;	
				dataList[num++]=obj;
			}

			
			var totalString = "";
			for(var i=0;i<dataList.length;i++){
				var obj = dataList[i];
			//	console.log(obj.replyBody+"~~~");
				var objString = crateCommentInfo(obj);
				
				totalString = totalString+objString;
			}
			
			//console.log(totalString);
			
			$(this).append(totalString).find(".reply-btn").click(function(){
				if($(this).parent().parent().find(".replybox").length > 0){
					$(".replybox").remove();
				}else{
					$(".replybox").remove();
					replyClick($(this));
				}
			});
			$(".reply-list-btn").click(function(){
				if($(this).parent().parent().find(".replybox").length > 0){
					$(".replybox").remove();
				}else{
					$(".replybox").remove();
					replyClick($(this));
				}
			})
	
		
		//添加新数据
		if(option.add != ""){
			obj = option.add;
			var str = crateCommentInfo(obj);
		//	console.log(str+"???");
			$(this).prepend(str).find(".reply-btn").click(function(){
				replyClick($(this));
			});
		}
	}	
	
	
	
})(jQuery);