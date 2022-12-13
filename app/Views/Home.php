<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner" style="height: 500px;">
        <div class="carousel-item active">
            <img src="img/gunung.jpg" style="height: 500px;" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="img/mainhall.jpg" style="height: 500px;" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="img/gunung.jpg" style="height: 500px;" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<div class="m-3 ms-5">
    <h2 class="d-flex justify-content-center">Artikel</h2>
    <div class="row d-flex justify-content-center">
        <div class="card mb-3 ms-2 shadow sm-floar-left" style="max-width: 740px;">
            <?php foreach ($artikel as $t) : ?>
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="/img/artikel/<?= $t->img; ?>" class="img-fluid rounded-start" style="max-height: 250px; " alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><strong><?= $t->judul; ?></strong></h5>
                            <p class="card-text"><?= word_limiter($t->body, 20) ?>.</p>

                            <a href="/detail/<?= $t->slug; ?>" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <hr style="background-color :gray">
            <?php endforeach; ?>
        </div>
    </div>
</div>
</div>

<?= $this->endsection('content'); ?>