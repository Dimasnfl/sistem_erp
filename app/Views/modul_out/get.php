 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Pembelian Modul</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="/">Home</a></li>
             <li class="breadcrumb-item active">Pembelian Modul</li>
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
                   <!-- <form action="" method="get" autocomplete="off">
                     <div class="input-group" style="width: 300px;">
                       <?php $request = \Config\Services::request(); ?>
                       <input type="text" class="form-control float-right" placeholder="Cari Data Modul" name="keyword" value="<?= $request->getGet('keyword') ?>">
                       <div class="input-group-append">
                         <button type="submit" class="btn btn-outline-primary">
                           <i class="fas fa-search"></i>
                         </button>
                       </div>
                     </div>
                   </form> -->
                 </div>
               </h3>
               <div class="card-tools">
                 <!-- <a href="<?= site_url('listmodul/restore') ?>" class="btn btn-outline-danger"><i class="fas fa-undo"></i>.Restore All</a> -->
                 <form action="<?= site_url('modul_out/restore2') ?>" method="post" class="d-inline" onsubmit="return confirm('Kembalikan Semua Modul Ke Stok ?')">
                   <button class="btn btn-outline-danger">
                     <i class="fas fa-undo"></i>.Restore All
                   </button>
                 </form>
               </div>

             </div>
             <!-- /.card-header -->
             <div class="card-body table-responsive p-0" style="height: 510px;">
               <table class="table table-head-fixed table-striped text-nowrap table-bordered">
                 <thead>
                   <tr>
                     <th>NO</th>
                     <th>KODE</th>
                     <th>NAMA MODUL</th>
                     <th>JUMLAH</th>
                     <th>Di Check Out Pada</th>
                     <th class="text-center">ACTION</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php

                    foreach ($modul_out as $key => $value) : ?>
                     <tr>
                       <td> <?= $key + 1 ?> </td>
                       <td><?= strtoupper($value->kode_modul) ?></td>
                       <td><?= $value->nama_modul ?></td>
                       <td><?= $value->qty ?></td>
                       <td><?= date('d/m/Y - H:i', strtotime($value->date)) ?></td>
                       <td class="text-center">
                         <form action="<?= site_url('modul_out/restore/' . $value->id_out) ?>" method="get" class="d-inline" onsubmit="return confirm('Kembalikan Modul (<?= ($value->nama_modul) ?>) dengan ID (<?= ($value->id_out) ?>) Ke Stok ?')">
                           <input type="hidden" name="_method" value="GET">
                           <button class="btn btn-outline-danger">
                             <i class="fas fa-undo"></i>
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