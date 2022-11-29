<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 ms-2 me-2 g-3 mb-3 mt-3">
    <?php if ($nilai == NULL) : ?>
        <div class="container mt-4">
            <p class="text-center">Anda Belum Mengikuti Ujian Sertifikat Apapun</p>
        </div>
    <?php else : ?>
        <?php foreach ($nilai as $nilai) : ?>
            <div class="col mb-3">
                <div class="card">
                    <div class="card-header">
                        Sertifikat
                    </div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <th>
                                    <h5 class="card-title font-weight-bold text-primary">Sertifikat <?= $nilai['kode_sertifikat']; ?></h5>
                                </th>
                            </tr>

                            <tr>
                                <br>
                                <td>
                                    <p class="card-text">Nama </p>

                                </td>
                                <td>
                                    <p class="card-text">: <?= $nilai['nama_user']; ?></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="card-text">NPM </p>

                                </td>
                                <td>
                                    <p class="card-text">: <?= $nilai['nim_user']; ?></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="card-text">Reguler </p>

                                </td>
                                <td>
                                    <p class="card-text">: <?= $nilai['reguler_user']; ?></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="card-text">Tanggal Ujian </p>

                                </td>
                                <td>
                                    <p class="card-text">: <?php $date = date_create($nilai['tanggal_ujian']);
                                                            echo date_format($date, 'd F Y') ?></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="card-text">Grade </p>
                                </td>
                                <td>
                                    <p class="card-text">: <?= $nilai['nilai']; ?></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="card-text">Result </p>
                                </td>
                                <td>
                                    <p class="card-text">: <?php echo $nilai['result'] ?> </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="card-text">Harga </p>
                                </td>
                                <td>
                                    <?php if ($nilai['nilai'] >= 70 && $nilai['nilai'] < 80) : ?>
                                        <p class="card-text">: Rp. <?= number_format(250000, 0, ".", ".") ?></p>
                                    <?php elseif ($nilai['nilai'] >= 80) : ?>
                                        <p class="card-text">: Rp. <?= number_format(200000, 0, ".", ".") ?></p>
                                    <?php else : ?>
                                        <p class="card-text">: - </p>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        </table>
                        <?php if ($nilai['result'] == 'Passed' && $nilai['status'] == 'Belum Cetak') { ?>
                            <a href="/add-sertifikat/<?= $nilai['id'] ?>" class="btn btn-primary mt-2">Ambil Sertifikat</a>
                        <?php } else if ($nilai['result'] == 'Passed' && $nilai['status'] == 'Proses Cetak') { ?>
                            <p class="btn btn-primary mt-2">Sertifikat Anda Sedang Dalam Proses Cetak</p>
                        <?php } else if ($nilai['result'] == 'Passed' && $nilai['status'] == 'Sudah Diambil') { ?>
                            <p class="btn btn-primary mt-2">Anda Sudah Mengambil Sertifikat ini</p>
                        <?php } else { ?>
                            <!-- <a href="#" class="btn btn-danger mt-2">Silahkan Ambil Perbaikan</a> -->
                        <?php } ?>
                    </div>
                </div>
            </div>
        <?php endforeach ?>
    <?php endif; ?>
</div>

<?= $this->endsection(); ?>