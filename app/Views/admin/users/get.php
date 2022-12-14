 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Data Admin</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
             <li class="breadcrumb-item active">Data Admin</li>
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
                   <a href="<?= site_url('users/add') ?>" class="btn btn-outline-success"><i class="fas fa-plus"></i>. Add New Admin</a>
                 </div>
               </h3>

             </div>
             <!-- /.card-header -->
             <div class="card-body table-responsive p-0" style="height: 510px;">
               <table class="table table-head-fixed table-striped text-nowrap table-bordered">
                 <thead>
                   <tr>
                     <th>NO</th>
                     <th>NIM</th>
                     <th>NAMA ADMIN</th>
                     <th>JURUSAN</th>
                     <th>REG</th>
                     <th>EMAIL</th>
                     <th>NO. HP</th>
                     <th>ACTION</th>
                   </tr>
                 </thead>
                 <tbody>
                   <?php
                    foreach ($users as $key => $value) : ?>
                     <tr>
                       <td><?= $key + 1 ?></td>
                       <td><?= $value->nim?></td>
                       <td><?= $value->nama?></td>
                       <td><?= strtoupper($value->jurusan)?></td>
                       <td><?= strtoupper($value->reguler)?></td>
                       <td><?= $value->email?></td>
                       <td><?= $value->no_hp?></td>
                       <td class="text-center">
                         <a href="<?= site_url('users/edit/' . $value->id) ?>" class="btn btn-outline-warning"><i class="fas fa-pencil-alt"></i></a>
                         <form action="<?= site_url('users/' . $value->id) ?>" method="post" class="d-inline" onsubmit="return confirm('Hapus Akses Admin Bernama <?= $value->nama?>?')">
                           <input type="hidden" name="_method" value="DELETE">
                           <button class="btn btn-outline-danger">
                             <i class="fas fa-trash"></i>
                           </button>
                         </form>
                       </td>
                     </tr>

                   <?php endforeach; ?>


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