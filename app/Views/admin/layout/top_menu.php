<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-warning">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">

    <!-- fullscreen -->
    <li class="nav-item">
      <a class="nav-link" data-widget="fullscreen" href="#" role="button">
        <i class="fas fa-expand-arrows-alt"></i>
      </a>
    </li>

    <!-- notif -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false">
        <i class="far fa-bell"></i>
        <span class="badge badge-danger navbar-badge" id="tot"></span>
      </a>

      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
        <div class="dropdown-item text-center" id="pesan"></div>

        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item dropdown-footer" onclick="delete_all()">Clear Notifications</a>
      </div>

    </li>

    <?php $session = session(); ?>
    <?php if (session()->has('logged_in') == true) : ?>
      <!-- Profil -->
      <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><i class="far fa-user"></i> Hi, <?= $session->nama ?></a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-1 shadow">
          <li> <a class="dropdown-item" data-slide="true" href="<?= site_url('/profil/edit/' . $session->id) ?>" role="button">
              <i class="fas fa-cog"></i> Profile Setting
            </a></li>
          <li><a class="dropdown-item" data-slide="true" href="<?= site_url('/logout') ?>" role="button" onclick="return confirm('Log Out ?')">
              <i class="fas fa-sign-out-alt"></i> LogOut
            </a></li>
        </ul>
      </li>
    <?php endif; ?>


  </ul>
</nav>
<!-- /.navbar -->