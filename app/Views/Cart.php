<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<table id="cart" class="table table-hover table-condensed mt-3">

    <thead>

        <tr>

            <th style="width:25%" class="text-center">Kode</th>

            <th style="width:25%" class="text-center">Product</th>

            <th style="width:25%" class="text-center">Harga</th>

            <th style="width:25%" class="text-center"></th>

        </tr>

    </thead>

    <tbody>
        <?php $total = 0 ?>
        <?php if ($items) : ?>
            <?php foreach ($items as $item) : ?>
                <?php $total += $item['harga']; ?>
                <tr>
                    <td class="text-center"><?= $item['kode']; ?></td>
                    <td class="text-center"><?= $item['nama']; ?></td>
                    <td class="text-center"><?= $item['harga']; ?></td>
                    <td class="text-center">
                        <a href="/remove-from-cart/<?= $item['id'] ?>" class="btn btn-danger" role="button">Remove</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>



    </tbody>

    <tfoot>

        <tr>

            <td colspan="5" class="text-end">
                <h3><strong>Total Rp. <?= $total; ?></strong></h3>
            </td>

        </tr>

        <tr>

            <td colspan="5" class="text-end">

                <a href="/modul" class="btn btn-warning"><i class="fa fa-angle-left"></i> Kembali</a>

                <button class="btn btn-success">Checkout</button>

            </td>

        </tr>

    </tfoot>

</table>

<?= $this->endsection(); ?>