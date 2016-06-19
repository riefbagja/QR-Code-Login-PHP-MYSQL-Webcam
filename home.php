<?php 

if( !session_id() )
{
    session_start();
}

if(@$_SESSION['logged_in'] != true){
    echo '
    <script>
    	alert("Anda harus melakukan login terlebih dahulu!");
    	self.location.replace("index.php");
    </script>';
}

?>

Welcome ! <br />
<a href="logout.php">Logout</a>