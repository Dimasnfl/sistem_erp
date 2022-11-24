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
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
             <li class="breadcrumb-item active">List Sertifikat</li>
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
               <div class="card-tools">
                 <form action="" method="get" autocomplete="off">
                   <div class="input-group" style="width: 300px;">
                     <?php $request = \Config\Services::request(); ?>
                     <input type="text" class="form-control float-right" placeholder="Cari Data Sertifikat" name="keyword" value="<?= $request->getGet('keyword') ?>">
                     <div class="input-group-append">
                       <button type="submit" class="btn btn-outline-primary">
                         <i class="fas fa-search"></i>
                       </button>
                     </div>
                   </div>
                 </form>
               </div>

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
                     <th>NILAI</th>
                     <th>TANGGAL UJIAN</th>
                     <th>NAMA USER</th>
                     <th>NIM USER</th>
                     <th>RESULT</th>
                     <th>REGULER USER</th>
                     <th>KELAS</th>
                     <th>STATUS</th>
                     <th>NAMA DOSEN</th>
                     <th>RUANGAN</th>
                     <th>SERTIFIKAT ID</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php
                    $page = isset($_GET['page']) ? $_GET['page'] : 1;
                    $no = 1 + (10 * ($page - 1));
                    foreach ($sertifikat as $key => $value) : ?>
                     <tr>
                       <td><?= $no++ ?></td>

                       <td><?= $value['JP'] ?></td>
                       <td><?= $value['nilai'] ?></td>
                       <td><?= $value['tanggal_ujian'] ?></td>
                       <td><?= $value['nama_user'] ?></td>
                       <td><?= strtoupper($value['nim_user']) ?></td>
                       <td><?= strtoupper($value['result']) ?></td>
                       <td><?= $value['reguler_user'] ?></td>
                       <td><?= strtoupper($value['kelas']) ?></td>
                       <td><?= ($value['status']) ?></td>
                       <td><?= $value['nama_dosen'] ?></td>
                       <td><?= $value['ruangan'] ?></td>
                       <td><?= $value['sertifikat_id'] ?></td>

                     </tr>

                   <?php endforeach; ?>


                 </tbody>
               </table>
               <div class="card-footer clearfix">
                 <ul class="pagination pagination-md m-0 float-left">
                   <i>Showing <?= 1 + (10 * ($page - 1)) ?> to <?= $no - 1 ?> of <?= $pager->getTotal() ?> entries</i>
                 </ul>
                 <!-- <div class="float-right"> -->
                 <ul class="pagination pagination-md m-0 float-right">
                   <?= $pager->links('default', 'pagination') ?>
                 </ul>
                 <!-- </div> -->
               </div>

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
       <form action="<?= site_url('sertifikatlist/import') ?>" method="post" enctype="multipart/form-data">
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