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

<div class="m-3">
    <div class="row">
        <div class="col border border-dark">
            <h3>petunjuk</h3>
            <div class="row">
                <div class="col">col</div>
                <div class="col">col</div>
            </div>
        </div>
        <div class="col border border-dark">
            <h3>petunjuk</h3>
            <div class="row">
                <div class="col">col</div>
                <div class="col">col</div>
            </div>
        </div>
    </div>
</div>

<?= $this->endsection(); ?>