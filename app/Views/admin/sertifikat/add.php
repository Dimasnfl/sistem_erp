 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-0">
         <div class="col-md-1">
           <a href="<?= site_url('/admin.Sertifikat') ?>" class="btn btn-outline-danger"><i class="fas fa-arrow-left"></i></a>
         </div>
         <div class="col-sm-5">
           <h1>Form Tambah Data Sertifikat</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
             <li class="breadcrumb-item"><a href="/Modul">Data Sertifikat</a></li>
             <li class="breadcrumb-item active">Tambah Data Sertifikat</li>
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
               <form action="<?= site_url('sertifikat') ?>" method="post" autocomplete="off">
                 <div class="form-group">
                   <label>KODE SERTIFIKAT</label>
                   <input type="text" class="form-control" name="kode_sertifikat" placeholder="Masukkan Kode Sertifikat" required>
                 </div>
                 <div class="form-group">
                   <label>NAMA SERTIFIKAT</label>
                   <input type="text" class="form-control" name="nama_sertifikat" placeholder="Masukkan Nama Sertifikat" required>
                 </div>
                 <div class="form-group">
                   <label>HARGA</label>
                   <input type="number" class="form-control" name="harga_sertifikat" placeholder="Masukkan Harga Sertifikat" required>
                 </div>
                 <button type="submit" class="btn btn-outline-success"><i class="fas fa-paper-plane"></i>.Save</button>
                 <button type="reset" class="btn btn-outline-secondary"><i class="fas fa-redo"></i>.Reset</button>
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