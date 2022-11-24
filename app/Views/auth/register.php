<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<!-- Register Section -->
<div class="row">
    <div class="col-sm-8 mt-4">
        <img src="img/mainhall.jpg" alt="Logo ERP" width="100%" height="95%">
    </div>
    <div class="col-sm-4 mt-4">
        <div class="container-sm mt-3 p-4">

            <?php if (!empty(session()->getFlashdata('error'))) : ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <h4>Periksa Entrian Form</h4>
                    </hr />
                    <?php echo session()->getFlashdata('error'); ?>
                </div>
            <?php endif; ?>

            <form action="/register" method="POST">
                <?= csrf_field(); ?>

                <h1 class="h3 mb-3 fw-normal">Register Account</h1>

                <!-- NAMA -->
                <div class="form-floating mt-2">
                    <input type="text" class="form-control" id="nama" name="nama" placeholder="Example" value="<?= set_value('nama') ?>">
                    <label for="nama">Nama</label>
                </div>

                <!-- NIM -->
                <div class="form-floating mt-2">
                    <input type="number" class="form-control" id="nim" name="nim" placeholder="xxxxxxxx" value="<?= set_value('nim') ?>">
                    <label for="nim">NIM</label>
                </div>

                <!-- JURUSAN -->
                <div class="mt-2">
                    <select class="form-select text-start" style="height: 58px;" name="id_jurusan" value="<?= set_value('Jurusan') ?>">
                        <option selected>Jurusan</option>
                        <?php foreach ($jurusans as $jurusan) : ?>
                            <option value="<?php echo $jurusan['id'] ?>"><?php echo $jurusan['nama'] ?></option>
                        <?php endforeach ?>
                    </select>
                </div>

                <!-- EMAIL -->
                <div class="form-floating mt-2">
                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" value="<?= set_value('email') ?>">
                    <label for="email">Email address</label>
                </div>

                <!-- PASSWORD -->
                <div class="form-floating mt-2">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                    <label for="password">Password</label>
                </div>

                <!-- REGULER -->
                <div class="mt-2">
                    <select class="form-select text-start" style="height: 58px;" name="reguler" value="<?= set_value('reguler') ?>">
                        <option selected>Reguler</option>
                        <option value="A">A</option>
                        <option value="B">B1</option>
                        <option value="B">B2</option>
                    </select>
                </div>

                <!-- NO HANDPHONE -->
                <div class="form-floating mt-2">
                    <input type="text" class="form-control" id="no_hp" name="no_hp" placeholder="000000" value="<?= set_value('no_hp') ?>">
                    <label for="no_hp">No Handphone</label>
                </div>

                <button class="w-100 btn btn-lg btn-primary mt-2" type="submit">Register</button>
            </form>
        </div>
    </div>
</div>
<!-- End Register Section -->

<?= $this->endsection(); ?>