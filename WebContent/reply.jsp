<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import ="java.sql.ResultSetMetaData"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.Statement"%>


<html>
<head>
<link rel="shortcut icon" href="img//URLpicture.jpg" />
   <meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <!--  <meta http-equiv="content-type" content="text/html; charset=utf-8">  -->
<meta name="viewport" content="width=device-width,initial-scale=0.5"/>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="renderer" content="webkit" />
    <title>评论页</title>
    <meta name="keywords" content="高燔的博客">
    <meta name="description" content="高燔的博客">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/base2.css"  rel="stylesheet">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="js/base.js" type="text/javascript"></script>
    <script src="js/jquery.slides.min.js" type="text/javascript"></script>


<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<style>
.container{
		width: 1000px;
	}
	.commentbox{
		width: 900px;
		margin: 20px auto;
		
	}
	.mytextarea {
	    width: 600px;
	    overflow: auto;
	    word-break: break-all;
	    height: 100px;
	    color: #000000;
	    font-size: 1em;
	    resize: none;
	}
	.mynamearea {
	    width: 150px;
	    overflow: auto;
	    word-break: break-all;
	    height: 100px;
	    color: #000;
	    font-size: 1em;
	    resize: none;
	}
	.comment-list{
		width: 900px;
		margin: 20px auto;
		clear: both;
		padding-top: 20px;
	}
	.comment-list .comment-info{
		position: relative;
		margin-bottom: 20px;
		margin-bottom: 20px;
		border-bottom: 1px solid #ccc;
		color: #00ffff;
		font-weight:bold;
		font-size:16px;
	}
	.comment-list .comment-info header{
		width: 10%;
		position: absolute;
	}
	.comment-list .comment-info header img{
		width: 100%;
		border-radius: 50%;
		padding: 5px;
	}
	.comment-list .comment-info .comment-right{
		padding:5px 0px 5px 11%; 
	}
	.comment-list .comment-info .comment-right h3{
	
	    color:#ffffff;
		margin: 5px 0px;
	}
	.comment-list .comment-info .comment-right .comment-content-header{
		height: 25px;
		
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span{
		padding-right: 2em;
		font-size:12px;
		color: #ffffff;
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,.send,.reply-list-btn{
		cursor: pointer;
	
	}
	.comment-list .comment-info .comment-right .reply-list {
		border-left: 3px solid #ccc;
		padding-left: 7px;
		
	}
	.comment-list .comment-info .comment-right .reply-list .reply{
		color: #ffffff;
		border-bottom: 1px dashed #ccc;
		font-size:12px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply div span{
		color: #00ffff;
		font-size:14px;
		padding-left: 10px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply p span{
	
		padding-right: 2em;
		color: #ffffff;
	}
	</style>

</head>


<body style="background: url(img_hp/bg2.png)">
<div class="head_box">
    <div class="header">
        <div class="header_logo">
             <a style="color:#3a76bf; font-size:18px; font-weight: bold;"  href="http://49.233.155.20/MyBlog/index.html">高燔の博客|天行健,君子自强不息</a>  
        </div>
        <div class="header_nav">
       
        
          <ul class="clearfix">
           <li><a style="color:#000000; font-size:16px; " href="http://49.233.155.20/MyBlog/index.html">首页</a></li>
              
                <li class="have_second">
                    <a style="color:#000000; font-size:16px; " href="http://49.233.155.20/MyBlog/trans_list.html">转载文章分享</a>
                    
                   <ul class="nav_second">
                      
                        <li><a style="color:#000000; font-size:15px; " href="http://49.233.155.20/MyBlog/trans_java_list.html">JAVA</a></li>
                        <li><a style="color:#000000; font-size:15px; " href="http://49.233.155.20/MyBlog/trans_blockchain_list.html">区块链技术</a></li>
                         <li><a style="color:#000000; font-size：15px; " href="http://49.233.155.20/MyBlog/trans_computer_list.html">计算机基础知识</a></li>
                   
                    </ul>
                     
                </li>
                
                <li class="have_second">
                    <a style="color:#000000; font-size:16px; "href="http://49.233.155.20/MyBlog/daily_list.html">日常随笔分享</a>
                    
                   <ul class="nav_second">
                        <i></i>
                        <li><a style="color:#000000; font-size:15px; " href="http://49.233.155.20/MyBlog/study_daily_list.html">学习笔记</a></li>
                        <li><a style="color:#000000; font-size:15px; " href="http://49.233.155.20/MyBlog/article_daily_list.html">随笔文章</a></li>
                   		<li><a style="color:#000000; font-size:15px; " href="http://49.233.155.20/MyBlog/debug_daily_list.html">debug记录</a></li>
                    </ul>
                     
                </li>
                <li><a style="color:#000000; font-size:16px; " href="http://49.233.155.20/MyBlog/list.html">原创博文分享</a></li>
                <li><a style="color:#000000; font-size:16px; " href="http://49.233.155.20/MyBlog/about_me.html">关于我</a></li>
                  <li><a    style="color:#3a76bf; font-size:20px; font-weight: bold;" href="http://49.233.155.20/MyBlog/reply.jsp">留言墙</a></li>
            </ul>
        </div>
       
       <!--  
        <div class="header_search">
            <a href="#" class="header_search_btn">
                <!--<img src="img/search.png">
                <i></i>
            </a>
        </div>

        <div class="header_nav_small_btn">
            <span class="small_btn"></span>
        </div>
--> 
    </div>

</div>






<div class="container">
	<div class="commentbox">
			<textarea cols="80" rows="50" placeholder="写个昵称吧......" class="mynamearea" id="content2"></textarea>
		<textarea cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
		<div class="btn btn-info pull-right" id="comment">评论</div>
	</div>
	<div class="comment-list">

	</div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.comment.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>


<%
int columnSize=0;
%>

<%
try{
         Class.forName("com.mysql.cj.jdbc.Driver");//记载数据库驱动，注册到驱动管理器
         String url="jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
         String username="root";
         String password="980402";
         Connection conn=DriverManager.getConnection(url,username,password);
         if(conn!=null){
          //   out.println("数据库连接成功！！！");
             
             PreparedStatement ps = null;
             ResultSet rs = null;
    String sql1 = "select MAX(id) from reply;";
                ps = conn.prepareStatement(sql1);
                 rs = ps.executeQuery();
                 //获取列数
               
                 while(rs.next()) {
                	// out.println("??"+rs.getInt(1));
                	 columnSize=rs.getInt(1);
                 }
               	         
             
             
         }else{
             //out.println("数据库连接失败！！！");
         }
     }catch(ClassNotFoundException e){
         e.printStackTrace();
     }

%>           

<script type="text/javascript">
//获取os,time,browser;
	var os , ti, brow;
	 var temp = <%= columnSize%>;
	 temp++;
	 
	 //依次需要根据各自方法获得time,browser,os,存入数据库中，
	 //使用then 链式调用这三个promise方法：
	getNowDateFormat()
	.then(getExploreName)
	.then(getOsInfo)
	.then(function(data){
	    console.log(os+"  "+ti+"  "+brow);
	});


	//初始化数据
	
	var arr = [];
	var addr=returnCitySN["cip"]+','+returnCitySN["cname"];
	// console.log(returnCitySN["cip"]+','+returnCitySN["cname"]+"???")
	
	
	$(function(){
		$(".comment-list").addCommentList({data:arr,add:""});
	
		//我理解的回掉函数：某一函数能被“存储”在变量中，能作为函数参数被传递。即：一个函数F()被作为参数传递给另一个函数g(f),f在g中被调用，f即位一个回掉函数
		//这里是一个回掉函数，只不过回掉的是一个匿名函数
		//等同于以下写法：
	    <%--
	    			$("#comment").click(f);
	    			function f(){
		    			.......;
		    			.......;
		    			.......;
	    			
	    			}
	    --%>
		$("#comment").click(function(){
			var obj = new Object();
			obj.img="./img/reply.jpg";
			obj.replyName=$("#content2").val();
			obj.content=$("#content").val();
			obj.address=addr;
			obj.browse=brow;
			obj.time =ti;
			obj.osname=os;
			obj.bereplyname="";
			obj.replyBody="";
			obj.id=temp;
			console.log("?????"+obj.time);
			//$(".comment-list").addCommentList({data:[],add:obj});
		    
			if(obj.replyName=="")obj.replyName="匿名";			
			$.ajax({
			    url:'dbUpdate',
			    type:'POST', //GET
			    async:false,    //或false,是否异步
			    data:{
			       // name:'yang',age:25//想要传输过去的数据 key：value，另一个页面通过 key接收value的值
			       replyname:obj.replyName,
			       content:obj.content,
			       address:obj.address,
			       time:obj.time,
			       osname:obj.osname,
			       bereplyname:obj.bereplyname,
			       browse:obj.browse,
			       id:temp,
			       flag:1,
			       query:0
			    },
			    timeout:5000,    //超时时间
			    dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
			    success:function(data,textStatus,jqXHR){//data是成功后，接收的返回值   
			    }
		   	});
			
			 location.assign(location);
		
		});

	})

	
	
	
		function filterNum(num){
		if(num < 10){
			return "0"+num;
		}else{
			return num;
		}
	}
	

	//以下为三个promise方法，通过 resolve 方法把 Promise 的状态置为完成态（Resolved），并且链式调用的时候用 then 方法就能捕捉到变化，可以通过resolve获取到data,进而继续向下执行。
	//而 reject 方法就是把 Promise 的状态置为已失败（Rejected），这时 then 方法执行“失败”时将触发的代码（暂且没写）
	
	function getNowDateFormat(){
	    console.log('获取时间');
	       var p = new Promise(function(resolve, reject){        //做一些异步操作
	       	var nowDate = new Date();
	   		var year = nowDate.getFullYear();
	   		var month = filterNum(nowDate.getMonth()+1);
	   		var day = filterNum(nowDate.getDate());
	   		var hours = filterNum(nowDate.getHours());
	   		var min = filterNum(nowDate.getMinutes());
	   		var seconds = filterNum(nowDate.getSeconds());
	   		ti= year+"-"+month+"-"+day+" "+hours+":"+min+":"+seconds;
			  resolve(ti);
	       });
		  
	       return p;
	}
	 
	
	function getExploreName(data){
	  console.log("获取到的时间是："+ data);
	  console.log("获取浏览器");
	     var p = new Promise(function(resolve, reject){        //做一些异步操作
	     	 var userAgent = navigator.userAgent;
	 		   if(userAgent.indexOf("Opera") > -1 || userAgent.indexOf("OPR") > -1){
	 		     brow= 'Opera';
	 		   }
	 		   else if(userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1){
	 			   brow= 'IE';
	 		   }
	 		   else if(userAgent.indexOf("Edge") > -1){
	 			   brow= 'Edge';
	 		   }
	 		   else if(userAgent.indexOf("Firefox") > -1){
	 			   brow= 'Firefox';
	 		   }
	 		   else if(userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1){
	 			   brow= 'Safari';
	 		   }
	 		   else if(userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1){
	 			   brow= 'Chrome';
	 		   }
	 		   else if(!!window.ActiveXObject || "ActiveXObject" in window){
	 			   brow= 'IE>=11';
	 		   }
	 		   else{
	 			   brow= 'Unkonwn';
	 		   }
	 		      resolve(brow);
	     });
	     return p;
	}
	 
	function getOsInfo(data){
		 console.log("获取到的浏览器是："+ data);
		  console.log("获取操作系统");
	      var p = new Promise(function(resolve, reject){        //做一些异步操作
	      	var userAgent = navigator.userAgent.toLowerCase();
	    	    var name = 'Unknown';
	    	    var version = 'Unknown';
	    	    if (userAgent.indexOf('win') > -1) {
	    	        name = 'Windows';
	    	        if (userAgent.indexOf('windows nt 5.0') > -1) {
	    	            version = 'Windows 2000';
	    	        } else if (userAgent.indexOf('windows nt 5.1') > -1 || userAgent.indexOf('windows nt 5.2') > -1) {
	    	            version = 'Windows XP';
	    	        } else if (userAgent.indexOf('windows nt 6.0') > -1) {
	    	            version = 'Windows Vista';
	    	        } else if (userAgent.indexOf('windows nt 6.1') > -1 || userAgent.indexOf('windows 7') > -1) {
	    	            version = 'Windows 7';
	    	        } else if (userAgent.indexOf('windows nt 6.2') > -1 || userAgent.indexOf('windows 8') > -1) {
	    	            version = 'Windows 8';
	    	        } else if (userAgent.indexOf('windows nt 6.3') > -1) {
	    	            version = 'Windows 8.1';
	    	        } else if (userAgent.indexOf('windows nt 6.2') > -1 || userAgent.indexOf('windows nt 10.0') > -1) {
	    	            version = 'Windows 10';
	    	        } else {
	    	            version = 'Unknown';
	    	        }
	    	    } 
	    	    os=version;
	  		     resolve(os);
	      });
	      return p;
	}	
	
	
	
	
	
	
	
	
	
</script>



</body>
</html>