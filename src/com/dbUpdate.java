package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;
/**
 * Servlet implementation class dbUpdate
 */
@WebServlet("/dbUpdate")
public class dbUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public dbUpdate() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   response.setContentType("text/html;charset=utf-8");
			// 设置响应头允许ajax跨域访问
			response.setHeader("Access-Control-Allow-Origin", "*");
			// 星号表示所有的异域请求都可以接受
			response.setHeader("Access-Control-Allow-Methods", "GET,POST");
			
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("json");
		
		//获取ajax传来的数据
		String time=request.getParameter("time");
		String browse=request.getParameter("browse");
		String osname=request.getParameter("osname");
		String replyname=request.getParameter("replyname");
		String bereplyname=request.getParameter("bereplyname");
		String address=request.getParameter("address");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		String flag=request.getParameter("flag");
		String query=request.getParameter("query");
		
		//System.out.println(id+"???");
		//System.out.println(query);
		  String json = "";
		  
		if(query.equals("1")) {

			String s="select * from reply;";
			
			//PrintWriter out = response.getWriter();
			// out.println(s);
			
			try{
		         Class.forName("com.mysql.cj.jdbc.Driver");
		         String url="jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		         String username="root";
		         String password="980402";
		         Connection conn=DriverManager.getConnection(url,username,password);
		         if(conn!=null){
		            // out.println("数据库连接成功");
		             PreparedStatement ps = null;
		             ResultSet rs = null;
		             ps = conn.prepareStatement(s);
		             rs = ps.executeQuery();
		             //获取列数
		             ResultSetMetaData md= rs.getMetaData();
		             int columnSize = md.getColumnCount();
		             List<reply>list=new ArrayList<reply>();
		            // out.println("查询结果如下:");
		             while(rs.next()) {
		               reply rp = new reply();
	                   for(int i = 1; i <= columnSize ; i++){
	                     //out.println(rs.getObject(i));
	                	 switch(i) {
	                	 	case 1:rp.setid(rs.getObject(i));break;
	                	 	case 2:rp.setflag(rs.getObject(i));break;
	                	 	case 3:rp.setreplyname(rs.getObject(i));break;
	                	 	case 4:rp.setbereplyname(rs.getObject(i));break;
	                	 	case 5:rp.setosname(rs.getObject(i));break;
	                	 	case 6:rp.setaddress(rs.getObject(i));break;
	                	 	case 7:rp.settime(rs.getObject(i));break;
	                	 	case 8:rp.setcontent(rs.getObject(i));break;
	                	 	case 9:rp.setbrowse(rs.getObject(i));break;
	                	 }	                	
	                   }
	                   list.add(rp);
	                 //  out.println(rp.tostring());
	                   //out.println();
		             }
		           
		             json=new Gson().toJson(list);
		     	     PrintWriter out2 = response.getWriter();
		     	   
		 			 out2.write(json);
		 			// System.out.println(json);
		 			 out2.flush();
		             	//out.println("\n结束查询");		             
		         }else{
		            // out.println("数据库连接失败");
		         }
		     }catch(ClassNotFoundException e){
		         e.printStackTrace();
		     } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			


			
			
			String sql ="insert into reply (id,flag,replyname,bereplyname,time,osname,browse,content,address) values ("+id+","+flag+","+"'"+replyname+"',"+"'"+bereplyname+"',"+"'"+time+"',"+"'"+osname+"',"+"'"+browse+"',"+"'"+content+"',"+"'"+address+"'"+");";
			  
			
			//PrintWriter out = response.getWriter();
			// out.println(sql);
			
			
			//out.write(String.valueOf((time+"  "+browse+" "+osname+"  "+replyname+"  "+bereplyname+"  "+address+" "+content+" "+id+"  "+flag)));
			try{
		         Class.forName("com.mysql.cj.jdbc.Driver");
		         String url="jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		         String username="root";
		         String password="980402";
		         Connection conn=DriverManager.getConnection(url,username,password);
		         if(conn!=null){
		         //    out.println("数据库连接成功"); 
		             Statement stat=conn.createStatement();
		             stat.execute(sql);
		          
		         }else{
		         //    out.println("数据库连接失败");
		         }
		     }catch(ClassNotFoundException e){
		         e.printStackTrace();
		     } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		doGet(request, response);
	}

}
