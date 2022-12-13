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
    <link rel="stylesheet" href="<?= base_url('adminLTE/plugins/fontawesome-free/css/all.min.css') ?>">
</head>


<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-light shadow sticky-top">
        <div class="container-fluid">
            <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
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

            <?php $session = session(); ?>
            <?php if (session()->has('logged_in') == true) : ?>

                <!-- Cart -->
                <a href="cart" class="me-2" style="color: black;"><i class="bi bi-cart-fill">
                        <?php if ($count == "0") :  ?>
                            <span class='badge badge-warning' id='lblCartCount'></span>
                        <?php else : ?>
                            <span class='badge badge-warning' id='lblCartCount'> <?php echo $count ?> </span>
                        <?php endif; ?>
                    </i></a>

                <!-- Notifications -->
                <div class="dropdown">
                    <button type="button" class="btn me-3 position-relative" data-bs-toggle="dropdown" style="border: none;">
                        <i class="bi bi-bell-fill">
                            <span class="badge rounded-pill text-bg-warning" id="tot"></span>
                        </i>
                    </button>
                    <div class="dropdown-menu">
                        <div class="row" id="pesan">

                        </div>
                        <button type="button" class="btn btn-info" onclick="notif()">Clear Notifications</button>
                    </div>
                </div>
                <a class="nav-link dropdown-toggle me-4" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="img/ERP.png" class="rounded-circle" width="40px" height="40px">
                    <?php echo $session->get('nama') ?>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="/history">History</a>
                    </li>
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

            <!-- </div> -->
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

    <script>
        var siteurl = '<?= site_url(); ?>';
    </script>
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            setInterval(function() {

                $.ajax({
                    url: siteurl + "/notif_user",
                    type: "POST",
                    dataType: "json",
                    data: {},
                    success: function(data) {
                        if (data.tot == 0) {
                            $("#pesan").html("No New Messages");
                        } else {
                            $("#pesan").empty();
                            $("#tot").html(data.tot);
                            $.each(data.msg, function() {
                                $("#pesan").append("<div> <a class='text-sm' href='#' style='text-decoration: none;'>" + this['body'] + "</a></div>");

                            });
                        }
                    }
                });
            }, 2000);
        })
    </script>
</body>

</html>