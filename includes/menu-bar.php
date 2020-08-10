<html>

<style>
#heading{
	background:#DC143C	;
			background:url(a.jpeg) no-repeat;
			  opacity: 0.8;


	 
		height:500px;
		padding:6px;

}
#heading:hover{
	opacity:0.9;
}
#imp-heading{
	background:#DC143C;
	font-size:16px;
	    font-family: "Comic Sans MS", cursive, sans-serif;
		

}
#para-heading{
	
	
	margin-top:55px;
		    font-family: "Comic Sans MS", cursive, sans-serif;
			font-size:45px;
			color:#7B68EE	;		

}
#par-heading{
	
	
	margin-top:12px;
		    font-family: "Comic Sans MS", cursive, sans-serif;
			font-size:25px;
			color:#FAEBD7		;

}
#pa-heading{
	color:white;
	margin-top:32px;
			font-size:19px;
				

}
</style>
<body>
<div class="header-nav animate-dropdown" id="heading">
    <div class="container">

        <div class="yamm navbar navbar-default" role="navigation" >
            <div class="navbar-header" >
                <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="nav-bg-class " >
                <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
	<div class="nav-our">
		<ul class="nav navbar-nav">
			<li class="active dropdown yamm-fw">
				<a href="index.php" data-hover="dropdown" class="dropdown-toggle" id="imp-heading" >Home</a>
				
			</li>
              <?php $sql=mysqli_query($con,"select id,categoryName  from category limit 6");
while($row=mysqli_fetch_array($sql))
{
    ?>

			<li class="dropdown yamm">
				<a href="category.php?cid=<?php echo $row['id'];?>"> <?php echo $row['categoryName'];?></a>
			
			</li>
			<?php } ?>

			
		</ul><!-- /.navbar-nav -->
		<div class="clearfix"></div>
		
<p id="para-heading"><b>Venue Management</b></p>		
<p id="par-heading">Book your venue here!!</p>	
<p id="pa-heading">choose your great venue yo make your event best.choose your best </br>photographer,great catering,sound system.venue management make </br>your event like best event till now......</p>	
<a href="login.php"><button class="btn btn-danger" type="button" style="width:200px">Log In</button></a>

	</div>
</div>


            </div>
        </div>
    </div>
</div>


</html>
</body>