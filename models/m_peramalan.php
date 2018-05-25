<?php 

Class Peramalan{
	
	
/*	public $id_produk;
	public $nama_produk;
	public $id_user;
	public $jumlah_stok;
	public $harga;
	public $foto_produk;
	public $deskripsi;*/
	

	function __construct(/*$id_produk,$nama_produk,$id_user,$jumlah_stok,$harga,$foto_produk,$deskripsi*/)
	{
		/*$this->id_produk=$id_produk;
		$this->nama_produk=$nama_produk;
		$this->id_user=$id_user;
		$this->jumlah_stok=$jumlah_stok;
		$this->harga=$harga;
		$this->foto_produk=$foto_produk;
		$this->deskripsi=$deskripsi;*/

	}
	public static function showPeramalan($nama_produk){
		$list=[];

		$db = DB::getInstance();

		$req = $db->query("SELECT p.nama_produk, SUM(dp.jumlah) as 

			jumlah_terjual,DATE_FORMAT(dp.tanggal,'%M') as 

			bulan, Year(dp.tanggal) as tahun
			FROM detail_penjualan dp 
			JOIN produk p ON dp.id_produk=p.id_produk
			WHERE p.nama_produk='$nama_produk'

			GROUP by dp.id_produk,Month(dp.tanggal)");



		foreach ($req as $item) {
			$list[]=array(
				
				'nama_produk'=>$item['nama_produk'],
				'jumlah_terjual'=>$item['jumlah_terjual'],
				'bulan'=>$item['bulan'],
				'tahun'=>$item['tahun']
			

				);
		}
		if (isset($list)) {
			return $list;
		} else {
			return null;
		}
		




	}

	public static function optionProduk(){
		$list=[];

		$db = DB::getInstance();

		$req = $db->query("SELECT `nama_produk` FROM `produk` ");

		foreach ($req as $item) {
			$list[] = array(
				'nama_produk'=>$item['nama_produk']


				);
		}


		if (isset($list)) {
			return $list;
		} else {
			return null;
		}
		
	}
}

?>