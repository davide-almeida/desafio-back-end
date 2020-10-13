// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// require turbolinks
// require_tree .
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-notify
//= require bootstrap/js/bootstrap.bundle.min.js
//= require jquery-easing/jquery.easing.min.js
//= require sb-admin-2.js
//= require chart.js/Chart.min.js
//= require demo/chart-area-demo.js
//= require demo/chart-pie-demo.js
//= require datatables/jquery.dataTables.min.js
//= require datatables/dataTables.bootstrap4.min.js
//= require demo/datatables-demo.js

// DataTable config
jQuery( document ).ready(function( $ ) {
    if ($("#datatable").length) {
        $('#datatable').DataTable( {
            responsive: true,
            "pagingType": "simple_numbers",
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json",
                buttons: {
                    pageLength: {
                        _: "Exibir %d registros"
                    }
                }
            }
        });
    }
});

// Tooltip enable
$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip({
        container: 'body'
    });
});