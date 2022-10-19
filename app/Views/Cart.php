<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<table id="cart" class="table table-hover table-condensed mt-3">

    <thead>

        <tr>

            <th style="width:50%">Product</th>

            <th style="width:10%">Price</th>

            <th style="width:25%" class="text-center">Subtotal</th>

            <th style="width:15%"></th>

        </tr>

    </thead>

    <tbody>

        <?php if ($items) : ?>
            <?php foreach ($items as $item) : ?>
                <tr>
                    <td><?= $item['id']; ?></td>
                    <td><?= $item['harga']; ?></td>
                    <td></td>
                    <td>
                        <a href="/remove-from-cart/<?= $item['id'] ?>" class="btn btn-danger" role="button">remove</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>

        <?php $total = 0 ?>

    </tbody>

    <tfoot>

        <tr>

            <td colspan="5" class="text-end">
                <h3><strong>Total</strong></h3>
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