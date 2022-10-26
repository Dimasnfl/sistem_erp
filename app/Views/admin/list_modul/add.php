 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Form Tambah Stok Modul</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item"><a href="/Modul">Data Modul</a></li>
              <li class="breadcrumb-item active">Tambah Data Modul</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- /.row -->
        <div class="row">
          <div class="col-8">
                <div class="card">
                    <div class="card-body">
                        <form action="<?=site_url('listmodul')?>" method="post" autocomplete="off">
                            <div class="form-group">
                                <label>PILIH MODUL YANG AKAN DITAMBAHKAN</label>
                                <select name="id_modul" class="form-control" required>
                                  <option value="" hidden>- Pilih Modul -</option>
                                  <?php foreach ($moduls as $key => $value) : ?>
                                    <option value="<?=$value->id?>"><?=$value->kode?> - <?=$value->nama?> - Rp.<?=$value->harga?></option>
                                  <?php endforeach; ?>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-outline-success"><i class="fas fa-paper-plane"></i>.Save</button>
                            <button type="reset" class="btn btn-outline-secondary"><i class="fas fa-redo"></i>.Reset</button>
                        </form>
                    </div>
                </div>
            <!-- /.card -->
          </div>
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->