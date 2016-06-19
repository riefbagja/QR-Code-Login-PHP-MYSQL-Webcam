<?php 

if( !session_id() )
{
    session_start();
}

session_destroy();

?>

<script>
    alert("Terimakasih atas kunjungan anda!");
    self.location.replace("index.php");
</script>