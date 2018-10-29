$(function ($) {
    $('.js-dtp').each(function(i,key){
        var format=$(key).data('format');
        $(key).datetimepicker({
            format:format,
            showClear:true
        });
    });

    $('.js-exportable').DataTable({
        responsive:true,
        dom:'<"html5buttons"B>lTfgtip',
        buttons:['copy','csv','excel','pdf','print']
    });
});