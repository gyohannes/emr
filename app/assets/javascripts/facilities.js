$(function () {
    $.ajax({
        url: '/organization_structures/load_tree',
        success: function(response){
            $('#facility_tree').treeview({
                data: response,
                levels: 2,
                onNodeSelected: function (event, data) {
                    $.ajax({
                        url:'/facilities/load_facilities',
                        data: { node: data.id},
                        success: function (response) {
                            $('#facilities').html(response)
                            $('.js-exportable').DataTable({
                                dom: '<"html5buttons"B>lTfgtip',
                                serverSide: true,
                                responsive: true,
                                buttons: [
                                    'copy', 'csv', 'excel', 'pdf', 'print'
                                ]
                            });
                        }
                    })
                }
            });
        }
    });

});