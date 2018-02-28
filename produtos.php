<?php
   include('sessao/sessao.php');
?>

<?php
//use phpGrid\C_DataGrid;

include_once('inc/head.php');
?>

<h1>Inventario Grandes Lagos</h1>

<?php
$_GET['currentPage'] = 'produtos';
include_once('inc/menu.php');
?>

<h1 style="margin-top: 20px;"></h1>

<script type="text/javascript" language="javascript" >
$(document).ready(function() {
    var dataTable = $('#tabela1').DataTable( {
        "processing": true,
        "serverSide": true,
        "oLanguage": {
            "sLoadingRecords": "Por favor, aguarde - carregando...",
            "sSearch": "Procurar:",
            "sLengthMenu": "Mostrar _MENU_ itens",
            "sInfo": "Mostrando de _START_ ate _END_ (_TOTAL_ no total)",
          "oPaginate": {
            "sPrevious": "Anterior",
            "sNext": "Proxima"
        }
    },
    "ajax":{
                url :"processamento/produtos_processamento.php", // json datasource
                type: "post",  // method  , by default get
                error: function(){  // error handling
                    $(".tabela1-error").html("");
                    $("#tabela1").append('<tbody class="employee-grid-error"><tr><th colspan="4">Nenhum dado no banco</th></tr></tbody>');
                    $("#tabela1_processing").css("display","none");

                }
            }
        } );
} );
</script>

<table id="tabela1" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Nome do Produto</th>
            <th>Patrimonio</th>
            <th>Rotulo</th>
            <th>Localizacao</th>
        </tr>
    </thead>
</table>

<?php
include_once('inc/footer.php');
?>