<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 ms-2 me-2 g-3 mb-3 mt-3">
    <?php if ($nilai == NULL) : ?>
        <div class="container text-center mt-3">
            <h1>Sertifikat</h1>
            <div class="alert alert-warning d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:">
                    <use xlink:href="#exclamation-triangle-fill" />
                </svg>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                        </symbol>
                    </svg>

                    Anda Belum Mengikuti Ujian Sertifikat Apapun
                </div>
            </div>
        </div>
</div>
<?php else : ?>
    <?php foreach ($nilai as $nilai) : ?>
        <div class="col mb-3">
            <div class="card">
                <div class="card-header text-center mt-3">
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
                        <div class="alert alert-primary d-flex align-items-center mt-3" role="alert">
                            <i class="fas fa-spinner"></i>
                            Sertifikat Anda Sedang Dalam Proses Cetak
                        </div>
                    <?php } else if ($nilai['result'] == 'Passed' && $nilai['status'] == 'Sudah Diambil') { ?>
                        <div class="alert alert-success d-flex align-items-center mt-3" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:">
                                <use xlink:href="#check-circle-fill" />
                            </svg>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                                    </symbol>
                                </svg>
                                Anda Sudah Mengambil Sertifikat ini
                            </div>
                        </div>
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