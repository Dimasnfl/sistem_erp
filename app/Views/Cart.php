<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>


<table id="cart" class="table table-hover table-condensed mt-3">

    <thead>

        <tr>

            <th style="width:25%" class="text-center">Kode</th>

            <th style="width:25%" class="text-center">Product</th>

            <th style="width:25%" class="text-center">Harga</th>

            <th style="width:25%" class="text-center">Jumlah</th>

        </tr>

    </thead>

    <tbody>
        <?php $total = 0 ?>

        <?php foreach ($cart as $key => $item) : ?>
            <?php $total += $item['harga'] * $item['qty'] ?>

            <tr>
                <?php if ($item['id_produk'] != null) : ?>
                    <td class="text-center"><?= $item['id_produk']; ?></td>
                    <td class="text-center"><?= $item['nama_modul']; ?></td>
                    <td class="text-center"><?= $harga = $item['harga'] * $item['qty'];
                                            number_format($harga, 0, ".", ".") ?></td>
                    <td class="text-center">

                        <input type="number" id="qty_<?= $key ?>" name="qty" class="form-control text-center" value="<?= $item['qty']; ?>" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        <button type="button" id="update" class="btn btn-success" onclick="simpan_update('<?= $item['id_produk'] ?>','qty_<?= $key ?>' )">update</button>

                    </td>
                    <td class="text-center">
                        <a href="/remove-from-cart/<?= $item['id_produk'] ?>" class="btn btn-danger" role="button">Remove</a>
                    </td>
                <?php else : ?>
                    <td class="text-center"><?= $item['kode_sertifikat']; ?></td>
                    <td class="text-center"><?= $item['nama_sertifikat']; ?></td>
                    <td class="text-center"><?= number_format($item['harga'], 0, ".", ".") ?></td>
                    <td class="text-center"><?= $item['qty']; ?></td>
                    <td class="text-center">
                        <a href="/remove-sertifikat/<?= $item['id_sertifikat'] ?>" class="btn btn-danger" role="button">Remove</a>
                    </td>
                <?php endif; ?>
            </tr>
        <?php endforeach; ?>


    </tbody>

    <tfoot>

        <tr>

            <td colspan="5" class="text-end">
                <h3><strong id="label">Total </strong></h3>
                <h4> <strong> Rp. <?= number_format($total, 0, ".", ".") ?> </strong> </h4>
            </td>

        </tr>

        <tr>

            <td colspan="5" class="text-end">

                <a href="/modul" class="btn btn-warning"><i class="fa fa-angle-left"></i> Kembali</a>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Checkout
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">Diharapkan!!! SEGERA!!!</h1>
                            </div>
                            <div class="modal-body">
                                <p>Untuk pembayaran dapat dilakukan di PUPD dan bukti pembayaran silahkan diserahkan di ERP Center untuk di tukar dengan product yang sudah di pesam sebelum jam 16.00. </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                <form action="/checkout" method="POST">
                                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Checkout</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

    </tfoot>

</table>


<?= $this->endsection(); ?>