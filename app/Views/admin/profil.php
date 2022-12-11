<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-0">
                <div class="col-md-1">
                    <a href="<?= site_url('dashboard.admin') ?>" class="btn btn-outline-danger"><i class="fas fa-arrow-left"></i></a>
                </div>
                <div class="col-sm-5">
                    <h1>Profile Admin</h1>
                </div>
                <div class="col-sm-5">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="dashboard.admin">Home</a></li>
                        <li class="breadcrumb-item active">Profile Admin</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <?php if (!empty(session()->getFlashdata('message'))) : ?>
                        <div class="alert alert-success">
                            <?php echo session()->getFlashdata('message'); ?>
                        </div>
                    <?php endif ?>
                    <!-- /.row -->
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fas fa-user"></i>
                                Profile Information
                            </h3>
                        </div>
                        <div class="card-body">
                            <!-- <ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#update_profile" role="tab" aria-controls="custom-content-below-profile" aria-selected="true">Ubah Informasi</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#update_password" role="tab" aria-controls="custom-content-below-settings" aria-selected="false">Ubah Password</a>
                                </li>
                            </ul> -->


                            <!-- UBAH INFORMASI -->
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="update_profile" role="tabpanel">
                                    <br>
                                    <?php $session = session(); ?>
                                    <?php if (session()->has('logged_in') == true) : ?>
                                        <form class="form-horizontal" action="<?= site_url('profil/edit/change_profil/' . $session->id) ?>" method="post" autocomplete="off">
                                            <input type="hidden" name="_method" value="PUT">
                                            <div class="form-group row">
                                                <label for="inputNama" class="col-sm-2 col-form-label">Nama Lengkap</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="nama" value="<?= $users->nama ?>" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputEmail" class="col-sm-2 col-form-label">Alamat Email</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" name="email" value="<?= $users->email ?>" required>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="offset-sm-2 col-sm-10">

                                                    <button type="submit" class="btn btn-outline-success" onclick="return confirm('Yakin Akan Mengubah Informasi Profil Admin ?')"><i class="fas fa-paper-plane"></i>.Save</button>
                                                    <button type="reset" class="btn btn-outline-secondary"><i class="fas fa-redo"></i>.Reset</button>
                                                </div>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="tab-content">
                                <!-- UBAH PASSWORD -->
                                <div class="tab-pane fade show active" id="update_password" role="tabpanel">
                                    <br>
                                    <?php $session = session(); ?>
                                    <?php if (session()->has('logged_in') == true) : ?>
                                        <?php if (!empty(session()->getFlashdata('error'))) : ?>
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                <h4>Terjadi Kesalahan</h4>
                                                </hr />
                                                <?php echo session()->getFlashdata('error'); ?>
                                            </div>
                                        <?php endif; ?>
                                        <form class="form-horizontal" action="<?= site_url('profil/edit/change_password/' . $session->id) ?>" method="post" autocomplete="off">
                                            <input type="hidden" name="_method" value="PUT">
                                            <!-- <div class="form-group row">
                                                <label for="inputPassword" class="col-sm-2 col-form-label">Password Lama</label>
                                                <div class="input-group col-sm-10">
                                                    <input type="password" class="form-control " name="old_password" id="pwd" value="" placeholder="Masukkan Password Lama">
                                                    <span class="input-group-append">
                                                        <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                                                    </span>
                                                </div>
                                            </div> -->
                                            <div class="form-group row">
                                                <label for="inputPassword" class="col-sm-2 col-form-label">Password Baru</label>
                                                <div class="input-group col-sm-10">
                                                    <input type="password" class="form-control <?= $validation->hasError('new_password') ? 'is-invalid' : '' ?>" name="new_password" id="pwd" value="" placeholder="Masukkan Password Baru">
                                                    <span class="input-group-append">
                                                        <button type="button" style="border: none;"><i class="far fa-eye-slash"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputPassword" class="col-sm-2 col-form-label">Konfirmasi Password</label>
                                                <div class="input-group col-sm-10">
                                                    <input type="password" class="form-control <?= $validation->hasError('confirm_password') ? 'is-invalid' : '' ?>" name="confirm_password" id="pwd2" value="" placeholder="Konfirmasi Password Baru">
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
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->