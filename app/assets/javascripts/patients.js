$(function () {
    $("#patient_search_MRN, #patient_search_first_name, #patient_search_father_name, " +
        "#patient_search_grand_father_name, #patient_search_phone_number").
    on("input", function () {
        var mrn = $("#patient_search_MRN").val();
        var first_name = $("#patient_search_first_name").val();
        var father_name = $("#patient_search_father_name").val();
        var grand_father_name = $("#patient_search_grand_father_name").val();
        var phone_number = $("#patient_search_phone_number").val();
        var first_name = $("#patient_search_first_name").val();
        $.ajax({
            url: '/patients/load_patients',
            data: {mrn: mrn, first_name: first_name, father_name: father_name,
                grand_father_name: grand_father_name, phone_number: phone_number},
            success: function (response) {
                $("#patients_list").html(response)
                $('.js-exportable').DataTable({
                    dom: '<"html5buttons"B>lTfgtip',
                    responsive: true,
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                });
            }
        })
    });
})