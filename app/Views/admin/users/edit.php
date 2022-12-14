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
           <h1>Form Edit Data Admin</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="<?= site_url('dashboard.admin') ?>">Home</a></li>
             <li class="breadcrumb-item"><a href="<?= site_url('admin.users') ?>">Data Admin</a></li>
             <li class="breadcrumb-item active">Edit Data Admin</li>
           </ol>
         </div>
       </div>
     </div><!-- /.container-fluid -->
   </section>

   <!-- Main content -->
   <section class="content">
     <div class="card card-primary card-outline">
       <div class="card-header">
         <h3 class="card-title">
           <i class="fas fa-cog"></i>
          Ubah Informasi Data
         </h3>
       </div>
       <div class="card-body">
         <div class="tab-content">
           <!-- UBAH PASSWORD -->
           <div class="tab-pane fade show active" id="change_information" role="tabpanel">
             <br>
             <form action="<?= site_url('users/edit/change_info/' . $users->id) ?>" method="post" autocomplete="off">
               <input type="hidden" name="_method" value="PUT">
               <div class="form-group row">
                 <label for="inputNIM" class="col-sm-2 col-form-label">NIM</label>
                 <div class="input-group col-sm-10">
                   <input type="number" class="form-control <?= $validation->hasError('nim') ? 'is-invalid' : '' ?>" name="nim" placeholder="Masukkan NIM" value="<?= $users->nim ?>" readonly>
                 </div>
               </div>
               <div class="form-group row">
                 <label for="inputNama" class="col-sm-2 col-form-label">Nama</label>
                 <div class="input-group col-sm-10">
                   <input type="text" class="form-control <?= $validation->hasError('nama') ? 'is-invalid' : '' ?>" name="nama" placeholder="Masukkan Nama Lengkap" value="<?= $users->nama ?>">
                 </div>
               </div>
               <div class="form-group row">
                 <label for="inputNoHP" class="col-sm-2 col-form-label">Nomor HP</label>
                 <div class="input-group col-sm-10">
                   <input type="number" class="form-control <?= $validation->hasError('no_hp') ? 'is-invalid' : '' ?>" name="no_hp" placeholder="Masukkan Nomor Handphone" value="<?= $users->no_hp ?>">
                 </div>
               </div>
               <div class="form-group row">
                 <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                 <div class="input-group col-sm-10">
                   <input type="email" class="form-control <?= $validation->hasError('email') ? 'is-invalid' : '' ?>" name="email" placeholder="Masukkan Email" value="<?= $users->email ?>">
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
       </div>
     </div>



     <div class="card card-primary card-outline">
       <div class="card-header">
         <h3 class="card-title">
           <i class="fas fa-key"></i>
           Form Ubah Password Admin
         </h3>
       </div>
       <div class="card-body">
         <div class="tab-content">
           <!-- UBAH PASSWORD -->
           <div class="tab-pane fade show active" id="change_password" role="tabpanel">
             <br>
             <?php if (!empty(session()->getFlashdata('error'))) : ?>
               <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 <h4>Terjadi Kesalahan</h4>
                 </hr />
                 <?php echo session()->getFlashdata('error'); ?>
               </div>
             <?php endif; ?>
             <form action="<?= site_url('users/edit/change_password/'. $users->id) ?>" method="post" autocomplete="off">
             <input type="hidden" name="_method" value="PUT">
               <div class="form-group row">
                 <label for="inputPassword" class="col-sm-2 col-form-label">Password Baru</label>
                 <div class="input-group col-sm-10">
                   <input type="password" class="form-control <?= $validation->hasError('password1') ? 'is-invalid' : '' ?>" name="password1" id="pwd" placeholder="Masukkan Password Baru">
                   <span class="input-group-append">
                     <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                   </span>
                 </div>
               </div>
               <div class="form-group row">
                 <label for="inputPassword" class="col-sm-2 col-form-label">Konfirmasi Password Baru</label>
                 <div class="input-group col-sm-10">
                   <input type="password" class="form-control <?= $validation->hasError('password2') ? 'is-invalid' : '' ?>" name="password2" id="pwd2" placeholder="Konfirmasi Password Baru">
                   <span class="input-group-append">
                     <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                   </span>
                 </div>
               </div>
               <div class="form-group row">
                 <div class="offset-sm-2 col-sm-10">
                 <button type="submit" class="btn btn-outline-success" onclick="return confirm('Yakin Akan Mengubah Password Admin ?')"><i class="fas fa-paper-plane"></i>.Ubah Password</button>
                   <button type="reset" class="btn btn-outline-secondary"><i class="fas fa-redo"></i>.Reset</button>
                 </div>
               </div>
             </form>
           </div>
         </div>
       </div>
     </div>

   </section>
   <!-- /.content -->
 </div>
 <!-- /.content-wrapper -->