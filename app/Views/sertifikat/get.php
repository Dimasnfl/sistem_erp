 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Sertifikat</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="/">Home</a></li>
             <li class="breadcrumb-item active">Data Sertifikat</li>
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
           <?php if (!empty(session()->getFlashdata('message'))) : ?>
             <div class="alert alert-success">
               <?php echo session()->getFlashdata('message'); ?>
             </div>
           <?php endif ?>
           <div class="card">
             <div class="card-header">
               <h3 class="card-title">
                 <div class="btn-group">
                   <!-- <a href="<?= site_url('modul/add') ?>" class="btn btn-outline-success"><i class="fas fa-plus"></i></a> -->
                 </div>
                 <div class="btn-group">
                   <button type="button" class="btn btn-outline-success"><i class="fas fa-file-upload"></i>.Import Excel</button>
                   <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown">
                     <span class="sr-only">Toggle Dropdown</span>
                   </button>
                   <div class="dropdown-menu" role="menu">
                     <a class="dropdown-item has-icon" href="<?= base_url('Import_Sertifikat_Example.xlsx') ?>"><i class="fas fa-file-excel"></i>.Download Contoh Format</a>
                     <div class="dropdown-divider"></div>
                     <a class="dropdown-item has-icon" href="#" data-toggle="modal" data-target="#sertifikat-import-modul"><i class="fas fa-file-import"></i>.Upload File</a>
                   </div>
                 </div>
               </h3>

             </div>
             <!-- /.card-header -->
             <div class="card-body table-responsive p-0" style="height: 510px;">
               <table class="table table-head-fixed table-striped text-nowrap table-bordered">
                 <thead>
                   <tr>
                     <!-- <th>KODE</th>
                     <th>NAMA SERTIFIKAT</th>
                     <th>HARGA SERTIFIKAT</th>
                     <th>GRADE</th>
                     <th>RESULT</th>
                     <th>TANGGAL UJIAN</th>
                     <th>NIM MAHASISWA</th>
                     <th>NAMA MAHASISWA</th>
                     <th>REGULER</th>
                     <th>KELAS</th>
                     <th>NAMA DOSEN</th> -->
                     <th>NO</th>
                     <th>JP</th>
                     <th>NIM</th>
                     <th>SAS File</th>
                     <th>GRADE</th>
                     <th>RESULT</th>
                     <th>REGULER</th>
                     <th>TANGGAL UJIAN</th>
                     <th>RUANGAN</th>
                     <th>KELAS</th>
                     <th>STATUS</th>
                     <th>NAMA DOSEN</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php
                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                    $no = 1 + (10 * ($page - 1));
                    foreach ($sertifikat as $key => $value) : ?>
                     <tr>
                     <td><?= $no++ ?></td>

                       <td><?= $value['kode'] ?></td>
                       <td><?= $value['nim'] ?></td>
                       <td><?= $value['nama'] ?></td>
                       <td><?= $value['nilai'] ?></td>
                       <td><?= strtoupper($value['result']) ?></td>
                       <td><?= strtoupper($value['reguler']) ?></td>
                       <td><?= date('d/m/Y', strtotime($value['tanggal_ujian'])) ?></td>
                       <td><?= strtoupper($value['ruangan']) ?></td>
                       <td><?= strtoupper($value['kelas']) ?></td>
                       <td><?= strtoupper($value['status']) ?></td>
                       <td><?= $value['nama_dosen'] ?></td>

                     </tr>

                   <?php endforeach; ?>


                 </tbody>
               </table>
               <?= $pager->links('default', 'pagination') ?>
             </div>
             <!-- /.card-body -->
           </div>
           <!-- /.card -->
         </div>
       </div>
   </section>
   <!-- /.content -->
 </div>
 <!-- /.content-wrapper -->

 <!-- modal import modul -->
 <div class="modal fade" id="sertifikat-import-modul">
   <div class="modal-dialog">
     <div class="modal-content bg-primary">
       <div class="modal-header">
         <h4 class="modal-title">Import Sertifikat</h4>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <form action="<?= site_url('sertifikat/import') ?>" method="post" enctype="multipart/form-data">
         <div class="modal-body">
           <label>File Excel</label>
           <div class="custom-file">
             <input type="file" name="file_excel" class="file-input" id="file_excel" required>
             <!-- <label for="file_excel" class="custom-file-label"></label> -->
           </div>
         </div>
         <div class="modal-footer justify-content-between">
           <button type="button" class="btn btn-outline-light" data-dismiss="modal">Cancel</button>
           <button type="submit" class="btn btn-outline-light">Submit</button>
         </div>
       </form>
     </div>
     <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
 </div>
 <!-- /.modal -->
