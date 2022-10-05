<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<!-- Login Section -->
<div class="row">
    <div class="col-sm-8 mt-4">
        <img src="img/mainhall.jpg" alt="Logo ERP" width="100%" height="95%">
    </div>
    <div class="col-sm-4 mt-4">
        <div class="container-sm mt-5 p-4">

            <h1 class="h3 mb-3 fw-normal">Login Account</h1>
            <?php if (!empty(session()->getFlashdata('error'))) : ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <?php echo session()->getFlashdata('error'); ?>
                </div>
            <?php endif; ?>
            <?php if (!empty(session()->getFlashdata('berhasil'))) : ?>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <?php echo session()->getFlashdata('berhasil'); ?>
                </div>
            <?php endif; ?>

            <form action="/login" method="POST">
                <?= csrf_field(); ?>

                <div class="form-floating mt-2">
                    <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mt-2">
                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <button class="w-100 btn btn-lg btn-primary" type="submit" name="login">Login</button>
            </form>
        </div>
    </div>
</div>
<!-- End Login Section -->

<?= $this->endsection(); ?>