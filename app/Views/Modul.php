<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<h1>Modul</h1>

<div class="container-fluid">
    <div class="justify-content-md-center border border-dark p-3">
        <table class="table table-bordered border-dark text-center">
            <thead>
                <tr>
                    <th scope="col" style="width: 10%;">Kode</th>
                    <th scope="col" style="width: 15%;">Nama Modul</th>
                    <th scope="col" style="width: 15%;">Ketersediaan</th>
                    <th scope="col" style="width: 15%;">Harga</th>
                    <?php if (session()->has('logged_in') == true) :  ?>
                        <th scope="col" style="width: 25%;">Pesanan</th>
                    <?php endif;  ?>
                </tr>
            </thead>
            <tbody class="align-middle">
                <?php foreach ($show as $modul) : ?>
                    <tr>
                        <td><?php echo $modul['kode_modul'] ?></td>
                        <td><?php echo $modul['nama_modul'] ?></td>
                        <td><?php echo $modul['ketersediaan'] ?></td>
                        <td><?php
                            echo number_format($modul['harga_modul'], 0, ".", ".") ?></td>
                        <?php if (session()->has('logged_in') == true) :  ?>
                            <?php if ($modul['ketersediaan'] == 0) : ?>
                                <td>
                                    <p>Modul Kosong</p>
                                </td>
                            <?php else : ?>
                                <form action="/add-to-cart/<?= $modul['kode_modul'] ?>" method="POST">
                                    <?= csrf_field() ?>
                                    <td>
                                        <div class="row g-3 align-items-center d-flex justify-content-center">
                                            <div class="col-auto">
                                                <input type="number" min="1" max="<?= $modul['ketersediaan']; ?>" id="qty" name="qty" class="form-control border border-dark formnumber" style="width: 200px;">
                                            </div>
                                            <div class="col-auto">
                                                <button class="btn btn-primary" type="submit">Masukkan Keranjang</button>
                                            </div>

                                        </div>



                                    </td>
                                </form>
                            <?php endif; ?>
                        <?php endif;  ?>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endsection(); ?>