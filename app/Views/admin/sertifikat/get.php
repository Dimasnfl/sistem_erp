 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Data Sertifikat</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
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
                   <button type="button" class="btn btn-outline-primary"><i class="fas fa-file-upload"></i>.Import Excel</button>
                   <button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">
                     <span class="sr-only">Toggle Dropdown</span>
                   </button>
                   <div class="dropdown-menu" role="menu">
                     <a class="dropdown-item has-icon" href="<?= base_url('Import_Modul_Example.xlsx') ?>"><i class="fas fa-file-excel"></i>.Download Contoh Format</a>
                     <div class="dropdown-divider"></div>
                     <a class="dropdown-item has-icon" href="#" data-toggle="modal" data-target="#modal-import-modul"><i class="fas fa-file-import"></i>.Upload File</a>
                   </div>
                 </div>
               </h3>
               <div class="card-tools">
                 <div class="input-group" style="width: 150px;">
                   <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                   <div class="input-group-append">
                     <button type="submit" class="btn btn-default">
                       <i class="fas fa-search"></i>
                     </button>
                   </div>
                 </div>
               </div>
             </div>
             <!-- /.card-header -->
             <div class="card-body table-responsive p-0" style="height: 510px;">
               <table class="table table-head-fixed table-striped text-nowrap table-bordered">
                 <thead>
                   <tr>
                     <th>MAHASISWA</th>
                     <th>NAMA MODUL</th>
                     <th>TANGGAL UJIAN</th>
                     <th>NILAI</th>
                     <th>STATUS</th>
                     <th>HARGA</th>
                     <th class="text-center">ACTION</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php
                    function rupiah($harga)
                    {
                      $harga = 'Rp ' . number_format($harga, 2, ",", ".");
                      return $harga;
                    }
                    foreach ($sertifikat as $key => $value) : ?>
                     <tr>
                       <td><?= $value->id_user ?></td>
                       <td><?= $value->id_modul ?></td>
                       <td><?= $value->tgl_ujian ?></td>
                       <td><?= $value->nilai ?></td>
                       <td><?= $value->id_status_nilai ?></td>
                       <td><?= rupiah($value->harga) ?></td>
                       <td class="text-center">
                         <a href="<?= site_url('admin.sertifikat/edit/' . $value->id) ?>" class="btn btn-outline-warning"><i class="fas fa-pencil-alt"></i>.Edit</a>
                         <form action="<?= site_url('admin.sertifikat/' . $value->id) ?>" method="post" class="d-inline" onsubmit="return confirm('Hapus Data Sertifikat Bernama <?= ($value->id_user) ?>?')">
                           <input type="hidden" name="_method" value="DELETE">
                           <button class="btn btn-outline-danger">
                             <i class="fas fa-trash"></i>.Delete
                           </button>
                         </form>
                       </td>
                     </tr>
                   <?php endforeach ?>
                 </tbody>
               </table>
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
 <div class="modal fade" id="modal-import-modul">
   <div class="modal-dialog">
     <div class="modal-content bg-primary">
       <div class="modal-header">
         <h4 class="modal-title">Import Modul</h4>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <form action="<?= site_url('modul/import') ?>" method="post" enctype="multipart/form-data">
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