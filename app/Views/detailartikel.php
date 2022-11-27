<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="container mt-3">
    <h1>Detail Artikel</h1>
    <div class="row mb-1 ms-2">

        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item active">Detail Artikel</li>
        </ol>

    </div>
</div>
<div class="container card shadow">
    <h1 style="text-align: center;"><?php echo $artikel->judul ?></h1>
    <img src="/img/artikel/<?= $artikel->img; ?>" style="height: 440px;" class="img-fluid justify-content-center" alt="...">
    <p>
        <?= $artikel->body; ?>
    </p>
</div>

<?= $this->endsection(); ?>