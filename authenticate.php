<?php 

$connection = mysql_connect("localhost", "root", "");
$db = mysql_select_db("puskesmas", $connection);

if( !session_id() )
{
    session_start();
}



	if(isset($_POST['send'])){

		$arr= array();
		$cek_anggota = $_POST['credential'];

		$query = mysql_query("select nomor_identitas from pasien where nomor_identitas='$cek_anggota'", $connection);
        $rows = mysql_num_rows($query);
            if ($rows == 1) {
	                $_SESSION['logged_in'] = true;
					$arr['success'] = true;
                } else {
                	$arr['success'] = false;
                }

            	echo json_encode($arr);
                mysql_close($connection);
	}

?>