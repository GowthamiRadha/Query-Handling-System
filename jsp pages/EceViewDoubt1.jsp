<%@ page import="com.srkr.star.*,java.sql.*"%>
<!DOCTYPE jsp>
<html>
<head><title>View Doubts</title>

</head>
<style>
select
 	{
		color:black;
		font-size:16px;
		text-align:center;
		padding:5px;
		border-radius:10px;
		text-align:center;
		outline:none;
 	}
 	select:hover
 	{
 		cursor:pointer;
 	}
 

input[type="submit"]
{
	width:20%;
	margin-left:0px;
	border:none;
	outline:none;
	height:40px;
	background:#fb2525;
	color:#fff;
	font-size:18px;
	border-radius:20px;	
}
input[type="submit"]:hover
{
	cursor:pointer;
	background:#ffc107;
	color:#000;
}
.border
{
	
	border: ridge 2px;
    	
    width: 100%;
    
    overflow: auto;
    margin:0;
		
	
}
.border1
{
	background:	#808080;
	width:13%;
	float:left;
}

.regNo
{
	color:white;
	margin:0px;
	font-size:20px;
	float:left:
}
.date
{
	font-size:16px;
	margin:0px;
	color:green;
	float:left:
}
.doubt
 {
 	outline:none;
 	border:none;
 	width:85%;
 	margin:0;
 	font-size:25px;
 	background:#008080;
 	
 }
 .answer
 {
 	min-height:60px;;
 	width:100%;
 	margin-top:0;
 	border-bottom:none;
 	font-size:20px;
 	background:#000000;
 	color:white;
 }

body
	{
	margin-left:218px;
	margin-right:226px;
	}
		
				marquee
				{
					font-size:20px;
					
					margin-top:-5px;
					color:black;
				}

	 			 #blink_me 
	  			{
  					animation: blinker 1s linear infinite;
  					animation-duration: 1s;
				}

				@keyframes blinker 
				{
  			   100% {
    					opacity: 0;
  					}
				}
				.news
				{
				position:absolute;
				font-weight: 900;
   				text-align:center;
    			width: 10%;
    			height:4%;
    			color:white;
    			font-size:20px;
    			margin-top:-7px;
       			margin-bottom:0px;
    			float:left;
   				z-index: +1;
    			background:red;
    			border:none;
			}
					.navbar 
			{
  				overflow: hidden;
  				background-color: #3b5998;
 				
  				
  				width:100.1%;
			}

			.navbar a 	
			{
  				float: left;
  				display: block;
  				color: #f2f2f2;
  				text-align: center;
  				padding: 8px 19px;
  				text-decoration: none;
  				font-size: 18px;
			}

			.navbar a:hover 
			{
  				background: #ddd;
  				color: black;
			}
			.navbar a.active 
			{
    			background-color:black;
			}
			.title
			{
			
				
				margin-top:0px;
				
				margin-bottom:0px;
				
			}
</style>
<body>
<div>
<p class="news"><span id="blink_me">Notifications</span></p>
		<span>	
		<marquee behavior="scroll" scrolldelay="100" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
		Class work for B.Tech 2/4, 3/4 and 4/4 will commence from 11-06-2018</marquee>
		</span>
		</div>
		
		<div  class="title">
		
			<img src="login.png">
		
		</div>	

<div align="center" class="navbar" >
<a href="ece.jsp">ECE</a>

<a  href="EceAskDoubt.jsp">Ask a Doubt</a>
 

<a href="EceReplyDoubt1.jsp">Reply to a Doubt</a>


<a href="EceViewDoubt1.jsp">View Doubts</a>

<a href="BranchSelection.jsp">Branch Selection</a>

<a href="Logout.jsp">LogOut</a>

</div>
<br>
<form action="EceViewDoubt1.jsp" method="post">

<div align=center><select name="subject" required>
							<option>---Select Subject---</option>
							<option>English-1</option>
							<option>Mathematics-1</option>
							<option>Mathematics-2</option>
							<option>Engineering Physics</option>
							<option>C-language</option>
							<option>Environmental Studies</option>
							<option>English-2</option>
							<option>Mathematics-3</option>
							<option>Engineering Chemistry</option>
							<option>Mathematics-4</option>
							<option>Elements of Electronics Engineering</option>
							<option>Engineering Drawing</option>
							<option>Data Structures</option>
							<option>Circuit Analysis & Synthesis</option>
							<option>Discrete Mathematical Structures</option>
							<option>Electrical Technology</option>
							<option>Analog Electric Circuits</option>
							<option>Elementary Data Structures</option>
							<option>Computer Organization</option>
							<option>Probability Theory & Random Processes</option>
							<option>Switching Theory and Logic Design</option>
							<option>Electro magnetic Field Theory & Transmission Lines</option>
							<option>Pulse And Digital Circuits</option>
							<option>Analog Communications</option>
							<option>Signals & Systems</option>
							</select><br/><br/>
		<input type="submit" value="submit">
						</div>	</form>

<br/><br/>
<form action="EceViewDoubt1.jsp" method="get">

 <% 
String subject=request.getParameter("subject");
   String doubt;
	if(subject!=null)
	{
	
	try
	{
			JdbcConnection jc=new JdbcConnection();
			Connection con=jc.getConnection();
			
			Statement st =  con.createStatement();
			ResultSet rs=st.executeQuery("select * from eceAskDoubt where subject='"+subject+"'");
			
			//Statement st1=con.createStatement();
			//ResultSet rs1=st1.executeQuery("select * from cseReplyDoubt where subject='"+subject+"' && doubt='"+doubt+"'");
			
			while(rs.next() )
			{%>
			<div class="border">
			<div style="width:cover;min-height:60px;background:#FFFFCC;">
			<div class="border1">
								<p class="regNo"><%= rs.getString(1) %></p>
								<p class="date"><%= rs.getString("askDoubt_date") %></p>
			</div>
								
						<span class="text1"><%=doubt=rs.getString("doubt")%>
							
			</span>
			</div>
									
				
<%	  
		try
					{
					  Statement st1 =  con.createStatement();
					  ResultSet rs1=st1.executeQuery("select * from eceReplyDoubt where doubt='"+doubt+"'");
					  while(rs1.next())
					  {%>
					<div class="border1">  					
					<p class="regNo"><%= rs.getString(1) %></p>
					<p class="date"><%= rs.getString("askDoubt_date") %></p>
					 </div> 
					<p class="answer"><%=rs1.getString("answer")%></p>
			
<% 				}
				  }
				  catch(Exception e)
				  {
					  System.out.println(e);
				  }%></div><br><br><br><% 
			}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	}
 %>
</form>
</body>
</html>
<script>
if ( window.history.replaceState ) 
{
  window.history.replaceState( null, null, window.location.href );
}
</script>