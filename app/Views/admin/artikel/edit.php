 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
     <!-- Content Header (Page header) -->
     <section class="content-header">
         <div class="container-fluid">
             <div class="row mb-2">
                 <div class="col-sm-6">
                     <h1>Form Tambah Data</h1>
                 </div>
                 <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                         <li class="breadcrumb-item"><a href="/">Home</a></li>
                         <li class="breadcrumb-item"><a href="<?= site_url('admin.artikel') ?>">List Artikel</a></li>
                         <li class="breadcrumb-item active">Edit Artikel</li>
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
                         <?php if (!empty(session()->getFlashdata('error'))) : ?>
                             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                 <h4>Periksa Entrian Form</h4>
                                 </hr />
                                 <?php echo session()->getFlashdata('error'); ?>
                             </div>
                         <?php endif; ?>
                         <div class="card-body">
                             <form action="/admin/artikel/edit/<?= $artikel->id; ?>" method="post" enctype="multipart/form-data" autocomplete="off">
                                 <?= csrf_field(); ?>
                                 <input type="hidden" name="slug" value="<?= $artikel->slug; ?>">
                                 <input type="hidden" name="imglama" value="<?= $artikel->img; ?>">
                                 <div class="form-group">
                                     <label for="judul" class="form-label">Judul</label>
                                     <input type="text" class="form-control" id="judul" name="judul" placeholder="Judul..." value="<?= $artikel->judul; ?>" autofocus>
                                 </div>
                                 <div class="mb-3">
                                     <label for="body" class="form-label">Isi Artikel</label>
                                     <input id="body" type="hidden" name="body" value="<?= $artikel->body; ?>">
                                     <trix-editor input="body"></trix-editor>
                                 </div>
                                 <div class="mb-3">
                                     <label for="img" class="form-label">Foto</label>
                                     <div class="col-sm-2 mb-2">
                                         <img src="/img/artikel/<?= $artikel->img; ?>" class="img-thumbnail img-preview">
                                     </div>
                                     <input type="file" class="form-control" id="img" name="img" value="<?= $artikel->img; ?>" onchange="previewImg()">
                                 </div>
                                 <button type="submit" class="btn btn-outline-success"><i class="fas fa-paper-plane"></i>.Ubah</button>
                                 <a href="<?= site_url('admin.artikel') ?>" class="btn btn-outline-danger"><i class="fas fa-chevron-left"></i> Kembali</a>
                             </form>
                         </div>
                     </div>
                     <!-- /.card -->
                 </div>
             </div>
     </section>
     <!-- /.content -->
     <script>
         function previewImg() {
             const img = document.querySelector('#img');
             const imgLabel = document.querySelector('.form-label');
             const imgPreview = document.querySelector('.img-preview');

             imgLabel.textContent = img.files[0].name;

             const fileimg = new FileReader();
             fileimg.readAsDataURL(img.files[0]);

             fileimg.onload = function(e) {
                 imgPreview.src = e.target.result;
             }
         }
     </script>
 </div>
 <!-- /.content-wrapper -->