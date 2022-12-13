<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= $title ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" type="text/css" href="/css/trix.css">
  <script type="text/javascript" src="/js/trix.js"></script>

  <!-- notif -->
  <script>
    var siteurl = '<?= site_url(); ?>';
  </script>
  <script src="js/jquery.js"></script>
  <script src="js/script.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      setInterval(function() {

        $.ajax({
          url: siteurl + "admin.modul/get_tot",
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

  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= base_url('adminLTE/plugins/fontawesome-free/css/all.min.css') ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= base_url('adminLTE/dist/css/adminlte.min.css') ?>">
</head>

<body class="sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-collapse" style="height: auto;">
  <!-- Site wrapper -->
  <div class="wrapper">