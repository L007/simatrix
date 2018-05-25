<?php 
Class PeramalanController{

	public function showPeramalan(){
		
		$produk=Peramalan::optionProduk();
		$posts=Peramalan::showPeramalan($_GET["produk"]);
		require_once("views/pages/penjual/lihatPeramalan.php");


	}
	
}
?>
