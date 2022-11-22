 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>Laporan Transaksi</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
             <li class="breadcrumb-item active">Laporan Transaksi</li>
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
                   <form action="" method="get" autocomplete="off">
                     <div class="input-group" style="width: 1100px;">
                       <?php $request = \Config\Services::request(); ?>
                       <div class="col-auto">
                         <div class="form-group">
                           <input type="date" id="inputFrom" name="from" value="<?= $request->getGet('from') ?>" class="form-control">
                         </div>
                       </div>
                       <div class="col-auto">
                         <label class="col-form-label">-</label>
                       </div>
                       <div class="col-auto">
                         <div class="form-group">
                           <input type="date" id="inputTo" name="to" value="<?= $request->getGet('to') ?>" class="form-control">
                         </div>
                       </div>
                       <div class="col-auto">
                         <button type="submit" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
                       </div>
                     </div>


                     <!-- modal import modul -->
                     <div class="modal fade" id="modal-filter">
                       <div class="modal-dialog">
                         <div class="modal-content bg-primary">
                           <div class="modal-header">
                             <h4 class="modal-title">Filter Data</h4>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">&times;</span>
                             </button>
                           </div>
                           <div class="modal-body">
                             <form action="" method="get" autocomplete="off">
                               <div class="input-group" style="width: 470px;">
                                 <div class="col-6">
                                   <label>PILIH MODUL</label>
                                   <select name="filter_modul" class="form-control">
                                     <option value="" hidden>- Pilih Modul -</option>
                                     <?php foreach ($filter_modul as $key => $value) : ?>
                                       <option value="<?= $value->kode_modul ?>"><?= $value->kode_modul ?> - <?= $value->nama_modul ?></option>
                                     <?php endforeach; ?>
                                   </select>
                                 </div>
                                 <div class="col-6">
                                   <label>PILIH JURUSAN</label>
                                   <select name="filter_jurusan" class="form-control">
                                     <option value="" hidden>- Pilih Jurusan -</option>
                                     <?php foreach ($filter_jurusan as $key => $value) : ?>
                                       <option value="<?= $value['id'] ?>"><?= $value['nama'] ?></option>
                                     <?php endforeach; ?>
                                   </select>
                                 </div>
                               </div>

                           </div>
                           <div class="modal-footer justify-content-between">
                             <button type="button" class="btn btn-outline-light" data-dismiss="modal">Cancel</button>
                             <button type="submit" class="btn btn-outline-light">Submit</button>
                           </div>
                   </form>
                   </form>
                 </div>
                 <!-- /.modal-content -->
             </div>
             <!-- /.modal-dialog -->
           </div>
           <!-- /.modal -->

           
           </form>

           </h3>
           <div class="card-tools">
             <a href="<?= site_url('admin.Laporan') ?>" class="btn btn-outline-secondary"><i class="fas fa-undo"></i></a>
             <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-filter"><i class="fas fa-filter"></i></button>
           </div>

         </div>
         <!-- /.card-header -->
         <div class="card-body table-responsive p-0" style="height: 510px;">
           <table class="table table-head-fixed table-striped text-nowrap table-bordered">
             <thead>
               <tr>
                 <th>NO</th>
                 <th>NIM</th>
                 <th>NAMA MAHASISWA</th>
                 <th>JURUSAN</th>
                 <th>REGULER</th>
                 <th>MODUL</th>
                 <th>SERTIFIKAT</th>
                 <th>QTY</th>
                 <th>TOTAL HARGA</th>
                 <th>TANGGAL CHECK OUT</th>

               </tr>
             </thead>
             <tbody>
               <?php

                foreach ($laporan as $key => $value) : ?>
                 <tr>
                   <td> <?= $key + 1 ?> </td>
                   <td><?= $value->id_user ?></td>
                   <td><?= $value->nama_user ?></td>
                   <td><?= $value->nama_jurusan ?></td>
                   <td><?= $value->reguler ?></td>
                   <td><?= $value->id_produk ?></td>
                   <td><?= $value->id_sertifikat ?></td>
                   <td><?= $value->qty ?></td>
                   <td><?= rupiah($value->harga) ?></td>
                   <td><?= date('d/M/Y', strtotime($value->tanggal_checkout)) ?></td>

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