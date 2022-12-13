<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<h1 class="text-center mt-3 mb-3">History</h1>

<div class="container">
    <h2>Modul</h2>
    <div class="table-responsive">
        <table class="table table-hover table-condensed mt-3">
            <thead class="table-primary">
                <tr>

                    <th style="width:20%" class="text-center">Kode</th>

                    <th style="width:30%" class="text-center">Product</th>

                    <th style="width:20%" class="text-center">Harga</th>

                    <th style="width:15%" class="text-center">Jumlah</th>

                    <th style="width:15%" class="text-center">Tanggal Checkout</th>

                </tr>
            </thead>
            <tbody>
                <?php foreach ($show as $history) : ?>
                    <?php if ($history['id_produk'] != null) : ?>
                        <tr>
                            <td class="text-center"><?= $history['id_produk']; ?></td>
                            <td class="text-center"><?= $history['nama_modul']; ?></td>
                            <td class="text-center">Rp. <?= $harga = $history['harga'] * $history['qty'];
                                                        number_format($harga, 0, ".", ".") ?></td>
                            <td class="text-center"><?= $history['qty']; ?></td>
                            <td class="text-center"><?php $date = date_create($history['tanggal_checkout']);
                                                    echo date_format($date, 'd F Y') ?></td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</div>

<div class="container">
    <h2>Sertifikat</h2>
    <div class="table-responsive">
        <table class="table table-hover table-condensed mt-3">
            <thead class="table-primary">
                <tr>

                    <th style="width:20%" class="text-center">Kode</th>

                    <th style="width:30%" class="text-center">Product</th>

                    <th style="width:20%" class="text-center">Harga</th>

                    <th style="width:15%" class="text-center">Jumlah</th>

                    <th style="width:15%" class="text-center">Tanggal Checkout</th>

                </tr>
            </thead>
            <tbody>
                <?php foreach ($show as $history) : ?>
                    <?php if ($history['id_produk'] == null) : ?>
                        <tr>
                            <td class="text-center"><?= $history['kode_sertifikat']; ?></td>
                            <td class="text-center"><?= $history['nama_sertifikat']; ?></td>
                            <td class="text-center">Rp. <?= number_format($history['harga'], 0, ".", ".") ?></td>
                            <td class="text-center"><?= $history['qty']; ?></td>
                            <td class="text-center"><?php $date = date_create($history['tanggal_checkout']);
                                                    echo date_format($date, 'd F Y') ?></td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</div>

<?= $this->endsection(); ?>