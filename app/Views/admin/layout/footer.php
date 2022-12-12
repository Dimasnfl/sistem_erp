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

<!-- jQuery -->
<script src="<?= base_url('adminLTE/plugins/jquery/jquery.min.js') ?>"></script>
<!-- Bootstrap 4 -->
<script src="<?= base_url('adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- AdminLTE App -->
<script src="<?= base_url('adminLTE/dist/js/adminlte.min.js') ?>"></script>

<!-- ChartJS -->
<script src="<?= base_url('adminLTE/plugins/chart.js/Chart.min.js') ?>"></script>
</body>

</html>

<!-- SCRIPT MENU AKTIF -->
<script>
  $(function() {
    var url = window.location;
    // aktif single sidebar menu
    $('ul.nav-sidebar a').filter(function() {
      return this.href == url;
    }).addClass('active');

    // aktif single sidebar menu dan treeview menu
    $('ul.nav-treeview a').filter(function() {
        return this.href == url;
      }).parentsUntil(".nav-sidebar > .nav-treeview")
      .css({
        'display': 'block'
      })
      .addClass('menu-open').prev('a')
      .addClass('active');
  });
</script>

<!-- change password -->
<script>
  $(document).ready(function() {
    $(".far").bind("click", function() {

      if ($('#pwd').attr('type') == 'password') {
        $('#pwd').attr('type', 'text');
        $('.far').removeClass('fa-eye-slash');
        $('.far').addClass('fa-eye');
      } else if ($('#pwd').attr('type') == 'text') {
        $('#pwd').attr('type', 'password');
        $('.far').removeClass('fa-eye');
        $('.far').addClass('fa-eye-slash');
      }
    })
  });

  $(document).ready(function() {
    $(".far").bind("click", function() {

      if ($('#pwd2').attr('type') == 'password') {
        $('#pwd2').attr('type', 'text');
        $('.far').removeClass('fa-eye-slash');
        $('.far').addClass('fa-eye');
      } else if ($('#pwd2').attr('type') == 'text') {
        $('#pwd2').attr('type', 'password');
        $('.far').removeClass('fa-eye');
        $('.far').addClass('fa-eye-slash');
      }
    })
  });
</script>

<!-- notif -->
<script type="text/javascript">
  $(document).ready(function() {
    setInterval(function() {

      $.ajax({
        url: siteurl + "admin.modul/get_tot",
        type: "POST",
        dataType: "json",
        data: {},
        success: function(data) {
          if (data.tot == 0) {} else {
            $("#pesan").empty();
            $("#tot").html(data.tot);
            $.each(data.msg, function() {
              $("#pesan").append("<div class='mb-2'>" + this['body'].substr(0, 28) + "... </div>");

            });
          }
        }
      });
    }, 2000);
  })
</script>


<!-- SCRIPT CHART JS -->
<script>
  //-------------
  //- DONUT CHART -
  //-------------
  // Get context with jQuery - using jQuery's .get() method.
  var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
  var donutData = {
    labels: [
      'Chrome',
      'IE',
      'FireFox',
      'Safari',
      'Opera',
      'Navigator',
    ],
    datasets: [{
      data: [700, 500, 400, 600, 300, 100],
      backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
    }]
  }
  var donutOptions = {
    maintainAspectRatio: false,
    responsive: true,
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
  var pieData = donutData;
  var pieOptions = {
    maintainAspectRatio: false,
    responsive: true,
  }
  //Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  new Chart(pieChartCanvas, {
    type: 'pie',
    data: pieData,
    options: pieOptions
  })
</script>