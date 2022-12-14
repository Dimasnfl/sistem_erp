 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
     <div class="container-fluid">
       <div class="row mb-0">
         <div class="col-md-1">
           <a href="<?= site_url('/admin.users') ?>" class="btn btn-outline-danger"><i class="fas fa-arrow-left"></i></a>
         </div>
         <div class="col-sm-5">
           <h1>Form Tambah Admin Baru</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="<?= site_url('dashboard.admin') ?>">Home</a></li>
             <li class="breadcrumb-item"><a href="<?= site_url('admin.users') ?>">Data Admin</a></li>
             <li class="breadcrumb-item active">Tambah Data Admin</li>
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
               <?php if (!empty(session()->getFlashdata('error'))) : ?>
                 <div class="alert alert-danger alert-dismissible fade show" role="alert">
                   <h4>Terjadi Kesalahan</h4>
                   </hr />
                   <?php echo session()->getFlashdata('error'); ?>
                 </div>
               <?php endif; ?>
               <form class="form-horizontal" action="<?= site_url('users') ?>" method="post" autocomplete="off">
                 <div class="form-group row">
                   <label for="inputNIM" class="col-sm-2 col-form-label">NIM</label>
                   <div class="input-group col-sm-10">
                     <input type="number" class="form-control <?= $validation->hasError('nim') ? 'is-invalid' : '' ?>" name="nim" placeholder="Masukkan NIM">
                   </div>
                 </div>
                 <div class="form-group row">
                   <label for="inputNama" class="col-sm-2 col-form-label">Nama</label>
                   <div class="input-group col-sm-10">
                     <input type="text" class="form-control <?= $validation->hasError('nama') ? 'is-invalid' : '' ?>" name="nama" placeholder="Masukkan Nama Lengkap">
                   </div>
                 </div>
                 <div class="form-group row">
                   <label for="inputJurusan" class="col-sm-2 col-form-label">Jurusan</label>
                   <div class="input-group col-sm-10">
                     <select name="id_jurusan" class="form-control">
                       <option value="" hidden>- Pilih Jurusan -</option>
                       <?php foreach ($jurusan as $key => $value) : ?>
                         <option value="<?= $value['id'] ?>"><?= $value['nama'] ?></option>
                       <?php endforeach; ?>
                     </select>
                   </div>
                 </div>
                 <div class="form-group row">
                   <label for="inputReguler" class="col-sm-2 col-form-label">Reguler</label>
                   <div class="input-group col-sm-10">
                   <select class="form-control" name="reguler">
                     <option selected>- Pilih Reguler -</option>
                     <option value="A">A</option>
                     <option value="B1">B1</option>
                     <option value="B2">B2</option>
                   </select>
                   </div>
                 </div>
                 <div class="form-group row">
                   <label for="inputNoHP" class="col-sm-2 col-form-label">Nomor HP</label>
                   <div class="input-group col-sm-10">
                     <input type="number" class="form-control <?= $validation->hasError('no_hp') ? 'is-invalid' : '' ?>" name="no_hp" placeholder="Masukkan Nomor Handphone">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="input-group col-sm-10">
                      <input type="email" class="form-control <?= $validation->hasError('email') ? 'is-invalid' : '' ?>" name="email" placeholder="Masukkan Email">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                   <div class="input-group col-sm-10">
                     <input type="password" class="form-control <?= $validation->hasError('password1') ? 'is-invalid' : '' ?>" name="password1" id="pwd" placeholder="Masukkan Password">
                     <span class="input-group-append">
                       <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                     </span>
                   </div>
                 </div>
                 <div class="form-group row">
                   <label for="inputPassword" class="col-sm-2 col-form-label">Konfirmasi Password</label>
                   <div class="input-group col-sm-10">
                     <input type="password" class="form-control <?= $validation->hasError('password2') ? 'is-invalid' : '' ?>" name="password2" id="pwd2" placeholder="Konfirmasi Password">
                     <span class="input-group-append">
                       <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                     </span>
                   </div>
                 </div>
                 <div class="form-group row">
                   <div class="offset-sm-2 col-sm-10">
                     <button type="submit" class="btn btn-outline-success"><i class="fas fa-paper-plane"></i>.Save</button>
                     <button type="reset" class="btn btn-outline-secondary"><i class="fas fa-redo"></i>.Reset</button>
                   </div>
                 </div>

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