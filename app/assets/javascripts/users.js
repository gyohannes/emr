$(function () {
    $.ajax({
        url: '/organization_structures/load_tree',
        success: function(response){
            $('#user_tree').treeview({
                data: response,
                levels: 2,
                onNodeSelected: function (event, data) {
                    $.ajax({
                        url:'/admin/users/load_users',
                        data: { node: data.id},
                        success: function (response) {
                            $('#users').html(response)
                            $('.js-exportable').DataTable({
                                dom: '<"html5buttons"B>lTfgtip',
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