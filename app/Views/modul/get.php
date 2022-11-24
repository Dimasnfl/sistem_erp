 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Stok Modul</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="/">Home</a></li>
             <li class="breadcrumb-item active">Stok Modul</li>
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
                   <a href="<?= site_url('modul/add') ?>" class="btn btn-outline-success"><i class="fas fa-plus"></i></a>
                 </div>
                 <div class="btn-group">
                   <a href="<?= site_url('modul_in/add') ?>" class="btn btn-outline-warning"><i class="fas fa-th"></i></a>
                 </div>
                 <div class="btn-group">
                   <button type="button" class="btn btn-outline-success"><i class="fas fa-file-upload"></i>.Import Excel</button>
                   <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown">
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
                <form action="" method="get" autocomplete="off">
                 <div class="input-group" style="width: 300px;">
                   <?php $request = \Config\Services::request(); ?>
                   <input type="text"  class="form-control float-right" placeholder="Cari Data Modul" name="keyword" value="<?= $request->getGet('keyword')?>">
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
                     <th>KODE</th>
                     <th>NAMA MODUL</th>
                     <th>HARGA</th>
                     <th>KETERSEDIAAN</th>
                     <th class="text-center">ACTION</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php
                    
                    foreach ($moduls as $key => $value) : ?>
                     <tr>
                       <td><?= strtoupper($value->kode_modul) ?></td>
                       <td><?= $value->nama_modul ?></td>
                       <td><?= rupiah($value->harga_modul) ?></td>
                       <td><?= $value->ketersediaan ?> <a>pcs</a></td>
                       <td class="text-center">
                         <a href="<?= site_url('modul/edit/' . $value->id) ?>" class="btn btn-outline-warning"><i class="fas fa-pencil-alt"></i></a>
                         <form action="<?= site_url('modul/' . $value->id) ?>" method="post" class="d-inline" onsubmit="return confirm('Hapus Data Modul Bernama <?= ($value->nama_modul) ?>?')">
                           <input type="hidden" name="_method" value="DELETE">
                           <button class="btn btn-outline-danger">
                             <i class="fas fa-trash"></i>
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
