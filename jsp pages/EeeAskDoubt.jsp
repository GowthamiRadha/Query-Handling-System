<%@ page import="com.srkr.star.*,java.sql.*"%>

<!DOCTYPE jsp>

<html>

<head><title>Express your doubt</title>

	

	<script type="text/javascript">
	function validate()
	{
	
		alert(" posting is successful");
	
	}
	
	</script>
	
	<style>
	
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
 	
 	textarea
 	{
 		height:50%;
 		width:100%;
 		font-size:23px;
 	}
 	
  	input[type="submit"]
	{
		width:40%;
		margin-left:0px;
		border:none;
		outline:none;
		height:30px;
		background:#fb2525;
		color:#fff;
		font-size:18px;
		border-radius:20px;	
	}
	
  	input[type="submit"]:hover
	{
		cursor:pointer;
		background:#2B3856;
		color:white;
	}
		
	</style>
	
</head>

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
<a href="eee.jsp">EEE</a>

<a  href="EeeAskDoubt.jsp">Ask a Doubt</a>
 

<a href="EeeReplyDoubt1.jsp">Reply to a Doubt</a>


<a href="EeeViewDoubt1.jsp">View Doubts</a>

<a href="BranchSelection.jsp">Branch Selection</a>

<a href="Logout.jsp">LogOut</a>

</div>
	
<br>	
	
<%
	String RegNo=(String)session.getAttribute("regNo");
	
%>
	
	
	
	
	
	
	


	<div align="center">
	
	
	<form action="EeeAskDoubt.jsp" method="post" name="f">
	
	
	

	
	<select name="subject" required>
	
							<option disabled selected>Select Subject</option>
							
							<option>English-1</option>
							<option>Mathematics-1</option>
							<option>Engineering Mechanics</option>
							<option>Engineering Chemistry</option>
							<option>Mathematics-2</option>
							<option>Environmental Studies</option>
							<option>English-2</option>
							<option>Mathematics-3</option>
							<option>Engineering Physics</option>
							<option>Circuit Theory</option>
							<option>Computer Programming Using C</option>
							<option>Engineering Drawing</option>
							<option>Mathematical-4/option>
							<option>Network Analysis & Synthesis</option>
							<option>Electromagnetic Field Theory</option>
							<option>Electrical Measurments & Instruments</option>
							<option>Electronic Devices & Circuits</option>
							<option>Engineering Mechanics & Strength of Materials</option>
							<option>Electrical Machines-1</option>
							<option>Signals & Systems</option>
							<option>Analog Electric Circuits</option>
							<option>Prime Movers & Pumps</option>
							<option>Electrical Power Generation Transmission & Distribution</option>
							
						</select>
						
						<br/><br/>
						
	<textarea placeholder="Express your doubt here" rows="" cols="" name="doubt" required></textarea><br/><br/>
	
	<input type="submit" value="POST" onclick="validate()">
	
						
	
	</form>
	
<% 
	
				String subject=request.getParameter("subject");
				String regNo=(String)session.getAttribute("regNo");
				String doubt=request.getParameter("doubt");
				
				if(subject!=null && regNo!=null && doubt!=null)
				{
	   				if(subject!="" && regNo!="" && doubt!="")
	   				{
						EeeAskDoubt d=new EeeAskDoubt();
						boolean flag=d.setEeeAskDoubt(regNo,subject,doubt);
						subject="";
						regNo="";
						doubt="";
	   				}
				}
%>
	

		
		<br/><br/>
		
	</div>
	
	<script>
		if ( window.history.replaceState ) 
		{
 			 window.history.replaceState( null, null, window.location.href );
		}
	</script>		
</body>
</html>