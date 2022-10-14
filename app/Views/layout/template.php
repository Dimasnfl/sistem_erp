<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/styles.css">
</head>


<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow sticky-top">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="navbar-brand ms-3" href="/">
                            <img src="img/ERP.png" alt="Logo" width="75" height="40" class="d-inline-block align-text-top">
                        </a>
                    </li>
                    <li class="nav-item" style="width: 120px;">
                        <a class="nav-link text-center text-primary" href="/">Home</a>
                    </li>
                    <li class="nav-item" style="width: 120px;">
                        <a class="nav-link text-center text-primary" href="/modul">Modul</a>
                    </li>
                    <li class="nav-item" style="width: 120px;">
                        <a class="nav-link text-center text-primary" href="/sertifikat">Sertifikat</a>
                    </li>
                    <li class="nav-item" style="width: 120px;">
                        <a class="nav-link text-center text-primary" href="#">Layanan</a>
                    </li>
                    <li class="nav-item" style="width: 120px;">
                        <a class="nav-link text-center text-primary" href="#">Tentang</a>
                    </li>
                </ul>

                <?php if (session()->has('logged_in') == true) : ?>
                    <div class="dropdown">
                        <button type="button" class="btn me-3">
                            <i class="bi bi-cart-fill"></i>
                        </button>
                    </div>
                    <div class="dropdown">
                        <button type="button" class="btn me-3">
                            <i class="bi bi-bell-fill"></i>
                        </button>
                    </div>
                    <a class="nav-link dropdown-toggle me-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="img/ERP.png" class="rounded-circle" width="40px" height="40px">
                        <?php $session = session() ?>
                        <?php echo $session->get('nama') ?>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                        <li>
                            <form action="/logout" method="GET">
                                <button type="submit" class="dropdown-item">
                                    Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                <?php else : ?>
                    <ul class="navbar-nav d-flex justify-content-end">
                        <li class="nav-item" style="width: 120px;">
                            <a class="nav-link text-center text-primary" href="/login">Login</a>
                        </li>
                        <li class="nav-item" style="width: 120px;">
                            <a class="nav-link text-center text-primary" href="/register">Register</a>
                        </li>
                    </ul>
                <?php endif; ?>

            </div>
        </div>
    </nav>
    <!-- End Navbar -->

    <?= $this->rendersection('content'); ?>

    <!-- Footer -->
    <div class="container-fluid">
        <footer class="py-3 my-4">
            <p class=" text-muted text-center ">
                Copyright © ERP Center Widyatama
            </p>
        </footer>
    </div>
    <!-- End Footer -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>

</html>