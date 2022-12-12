 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
     <!-- Content Header (Page header) -->
     <section class="content-header">


         <div class="container-fluid">
             <div class="row mb-2">
                 <div class="col-sm-6">
                     <h1>List Artikel</h1>
                 </div>
                 <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                         <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
                         <li class="breadcrumb-item active">List Artikel</li>
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
                     <?php if (!empty(session()->getFlashdata('berhasil'))) : ?>
                         <div class="alert alert-success">
                             <i class="fas fa-check"></i> <?php echo session()->getFlashdata('berhasil'); ?>
                         </div>
                     <?php endif ?>
                     <?php if (!empty(session()->getFlashdata('sukses'))) : ?>
                         <div class="alert alert-danger">
                             <i class="fas fa-trash"></i> <?php echo session()->getFlashdata('sukses'); ?>
                         </div>
                     <?php endif ?>
                     <?php if (!empty(session()->getFlashdata('updated'))) : ?>
                         <div class="alert alert-success">
                             <i class="fas fa-check"></i> <?php echo session()->getFlashdata('updated'); ?>
                         </div>
                     <?php endif ?>
                     <div class="card">
                         <div class="card-header">
                             <h3 class="card-title">
                                 <div class="btn-group">
                                     <a href="<?= site_url('admin.artikel/add') ?>" class="btn btn-outline-success"><i class="fas fa-plus"></i> Add New Artikel</a>
                                 </div>
                             </h3>
                             <div class="card-tools">
                             </div>
                         </div>
                         <!-- /.card-header -->
                         <div class="card-body table-responsive " style="max-width: 1800px;">
                             <table class="table  table-striped text-nowrap table-bordered">
                                 <thead>
                                     <tr>
                                         <th style="width: 70px;">No.</th>
                                         <th>Judul</th>
                                         <th style="max-width: 750px;">Isi Artikel</th>
                                         <th class="text-center" style="width: 250px;">ACTION</th>
                                     </tr>
                                 </thead>
                                 <tbody>

                                     <tr>
                                         <?php $i = 1; ?>
                                         <?php foreach ($artikel as $a) : ?>

                         </div>
                         <td><?php echo $i ?></td>
                         <td><?php echo $a->judul ?></td>
                         <td style="max-width: 750px;"><?php echo word_limiter($a->body, 10) ?></td>
                         <td class="text-center">
                             <a href="admin.artikel/edit/<?= $a->slug; ?>" class="btn btn-outline-warning">
                                 <i class="fas fa-pen"></i>.Edit
                             </a>
                             <form action="admin.artikel/delete/<?= $a->id; ?>" method="POST" class="d-inline">
                                 <?= csrf_field(); ?>
                                 <input type="hidden" name="_method" value="DELETE">
                                 <button class="btn btn-outline-danger" onclick="return confirm('Apakah anda yakin mau menghapus artikel ini?');">
                                     <i class="fas fa-trash"></i>.Delete
                                 </button>
                             </form>
                         </td>
                         </tr>
                         <?php $i++; ?>
                     <?php endforeach ?>

                     </tbody>
                     </table>
                     </div>
                     <!-- /.card-body -->
                 </div>
                 <!-- /.card -->
             </div>


     </section>
     <!-- /.content -->
 </div>
 <!-- /.content-wrapper -->


 <!-- /.modal -->