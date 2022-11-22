<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-primary elevation-4">
  <!-- Brand Logo -->
  <a href="" class="brand-link bg-primary">
    <img src="<?= base_url('adminLTE/dist/img/ERP_logo.png') ?>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .9">
    <span class="brand-text">ERP Widyatama</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <!-- <img src="<?= base_url('adminLTE/dist/img/avatar5.png') ?>" class="img-circle elevation-2" alt="User Image"> -->
      </div>
      <div class="info">
        <a class="d-block">ADMIN</a>
        <!-- Status -->
        <a><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>

    <!-- SidebarSearch Form -->
    <div class="form-inline">
      <div class="input-group" data-widget="sidebar-search">
        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-sidebar">
            <i class="fas fa-search fa-fw"></i>
          </button>
        </div>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="dashboard.admin" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              Data Modul
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= site_url('admin.Modul') ?>" class="nav-link">
                <i class="fas fa-archive nav-icon"></i>
                <p>Stok Modul</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= site_url('Modul_out') ?>" class="nav-link">
                <i class="fas fa-list nav-icon"></i>
                <p>Pembelian Modul</p>
              </a>
            </li>
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-certificate"></i>
            <p>
              Data Sertifikat
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= site_url('admin.Sertifikat') ?>" class="nav-link">
                <i class="far fa-copy nav-icon"></i>
                <p>Data Sertifikat</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= site_url('admin.SertifikatList') ?>" class="nav-link">
                <i class="fas fa-list nav-icon"></i>
                <p>List Sertifikat</p>
              </a>
            </li>
          </ul>
        </li>

        <li class="nav-item">
        <a href="<?= site_url('admin.Laporan') ?>" class="nav-link">
        <i class="fas fa-shopping-cart nav-icon"></i>
            <p>
              Laporan Transaksi
            </p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>