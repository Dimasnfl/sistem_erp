<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">



      <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-archive"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Jenis Modul</span>
                <span class="info-box-number">
                  <?=countData('moduls') ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-book"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Jumlah Modul Keseluruhan</span>
                <span class="info-box-number">
                <?php foreach($sum_modul->getResult() as $key=>$value): ?>
                <?= $value->ketersediaan ?> pcs
                <?php endforeach ?>
              </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">#</span>
                <span class="info-box-number">##</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">#</span>
                <span class="info-box-number">##</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        <div class="row">
          <div class="col-md-12">
            <!-- DONUT CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><i class="fas fa-book"></i>  Chart Jenis Modul</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="modul_kategori" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">
            <!-- PIE CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Example Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>
    <strong>by <a href="">Tim ERP Widyatama</a></strong>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->









<!-- ======================================================================================FOOTER====================================================================================== -->

<!-- jQuery -->
<script src="<?=base_url('adminLTE/plugins/jquery/jquery.min.js')?>"></script>
<!-- Bootstrap 4 -->
<script src="<?=base_url('adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js')?>"></script>

<!-- AdminLTE App -->
<script src="<?=base_url('adminLTE/dist/js/adminlte.min.js')?>"></script>

<!-- ChartJS -->
<script src="<?=base_url('adminLTE/plugins/chart.js/Chart.min.js')?>"></script>
</body>
</html>

<!-- SCRIPT MENU AKTIF -->
<script>
$(function () {
    var url = window.location;
    // aktif single sidebar menu
    $('ul.nav-sidebar a').filter(function () {
        return this.href == url;
    }).addClass('active');

    // aktif single sidebar menu dan treeview menu
    $('ul.nav-treeview a').filter(function () {
        return this.href == url;
    }).parentsUntil(".nav-sidebar > .nav-treeview")
        .css({'display': 'block'})
        .addClass('menu-open').prev('a')
        .addClass('active');
});
</script>


<!-- SCRIPT CHART JS -->
<script>
  //-------------
    //- MODUL CHART -
    //-------------
var modul_kategori = document.getElementById('modul_kategori');
        var data_modul_kategori = [];
        var label_modul_kategori = [];

        <?php foreach($modul_per_kategori->getResult() as $key=>$value): ?>
            data_modul_kategori.push(<?= $value->jumlah ?>);
            label_modul_kategori.push('<?= $value->nama_modul ?>');
        <?php endforeach ?>

        var data_modul_per_kategori = {
            datasets:[{
                data : data_modul_kategori,
                backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de','#7209b7', '#f72585', '#669bbc', '#7f5539', '#6b9080', '#9a031e', '#52b788', '#233d4d', '#772f1a', 
                '#d9ed92', '#656d4a', '#f2b5d4', '#ffee32', '#44355b', '#ee5622', '#660708', '#550527', '#393d3f', '#22007c', '#0080ff', '#00ff80', '#3c1518', '#918450', '#827081'],
            }],
            labels: label_modul_kategori,
        }
        var donutOptions     = {
            maintainAspectRatio : false,
            responsive : true,
        }
        var chart_modul_kategori = new Chart(modul_kategori,{
            type: 'pie',
            data : data_modul_per_kategori,
            options: donutOptions
        });


  //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          'Chrome',
          'IE',
          'FireFox',
          'Safari',
          'Opera',
          'Navigator',
      ],
      datasets: [
        {
          data: [700,500,400,600,300,100],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    })

    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
    var pieData        = donutData;
    var pieOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    new Chart(pieChartCanvas, {
      type: 'pie',
      data: pieData,
      options: pieOptions
    })
</script>