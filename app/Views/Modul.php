<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<h1>Modul</h1>

<div class="container-fluid">
    <div class="justify-content-md-center border border-dark p-3">
        <table class="table table-bordered border-dark text-center">
            <thead>
                <tr>
                    <th scope="col">Kode</th>
                    <th scope="col">Nama Modul</th>
                    <th scope="col">Ketersediaan</th>
                    <th scope="col">Harga</th>
                    <?php if (session()->has('logged_in') == true) :  ?>
                        <th scope="col">Pesanan</th>
                    <?php endif;  ?>
                </tr>
            </thead>
            <tbody class="align-middle">
                <?php foreach ($show as $modul) : ?>
                    <tr>
                        <td><?php echo $modul['kode'] ?></td>
                        <td><?php echo $modul['nama'] ?></td>
                        <td><?php echo $modul['ketersediaan'] ?></td>
                        <td><?php echo $modul['harga'] ?></td>
                        <?php if (session()->has('logged_in') == true) :  ?>
                            <td><a href="/add-to-cart/<?= $modul['id'] ?>" class="btn btn-success" role="button">Masukkan Keranjang</a></td>
                        <?php endif;  ?>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endsection(); ?>