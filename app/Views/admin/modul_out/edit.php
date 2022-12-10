 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-0">
         <div class="col-md-1">
           <a href="<?= site_url('/Modul_out') ?>" class="btn btn-outline-danger"><i class="fas fa-arrow-left"></i></a>
         </div>
         <div class="col-sm-5">
           <h1>Detail Transaksi</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
             <li class="breadcrumb-item"><a href="/Modul_out">Proses Transaksi</a></li>
             <li class="breadcrumb-item active">Detail Transaksi</li>
           </ol>
         </div>
       </div>
     </div><!-- /.container-fluid -->
   </section>

   <!-- Main content -->
   <section class="content">
     <div class="container-fluid">
       <!-- /.row -->
       <div class="row">
         <div class="col-12">
           <div class="card">
             <div class="card-body">
               <form action="<?= site_url('/modul_out') ?>" method="post" autocomplete="off">
                 <input type="hidden" name="_method" value="POST">

                 <div class="form-group">
                   <label>JP</label>
                   <input type="text" class="form-control" name="k_jp" value="<?= $shopping_cart->k_jp ?>" placeholder="-" readonly>
                 </div>
                 <div class="form-group">
                   <label>NIM</label>
                   <input type="text" class="form-control" name="id_user" value="<?= $shopping_cart->id_user ?>" placeholder="-" readonly>
                 </div>
                 <div class="form-group">
                   <label>MODUL YANG DIBELI</label>
                   <input type="text" class="form-control" name="id_produk" value="<?= $shopping_cart->id_produk ?>" placeholder="-" readonly>
                 </div>

                 <div class="form-group">
                   <label>SERTIFIKAT YANG DIAMBIL</label>
                   <input type="text" class="form-control" name="k_sertifikat" value="<?= $shopping_cart->k_sertifikat ?>" placeholder="-" readonly>
                 </div>
                 <div class="form-group">
                   <label>JUMLAH</label>
                   <input type="number" class="form-control" name="qty" value="<?= $shopping_cart->qty ?>" placeholder="-" readonly>
                 </div>
                 <div class="form-group">
                   <label>TOTAL HARGA</label>
                   <input type="number" class="form-control" name="harga" value="<?= $shopping_cart->harga ?>" placeholder="-" readonly>
                 </div>
                 <div class="form-group">
                   <label>TANGGAL CHECKOUT</label>
                   <input type="date" class="form-control" name="tanggal_checkout" value="<?= $shopping_cart->tanggal_checkout ?>" placeholder="-" readonly>
                 </div>
                 <button type="submit" class="btn btn-outline-success"><i class="fas fa-check"></i>.Konfirmasi Transaksi</button>
               </form>
             </div>
           </div>
           <!-- /.card -->
         </div>
       </div>
   </section>
   <!-- /.content -->
 </div>
 <!-- /.content-wrapper -->