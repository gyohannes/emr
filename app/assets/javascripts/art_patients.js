$(function () {
    $("#art_patient_search_MRN, #art_patient_search_art_number, #art_patient_search_first_name, #art_patient_search_father_name, " +
        "#art_patient_search_grand_father_name, #art_patient_search_phone_number,#art_patient_search_gender").
    on("input", function () {
        var mrn = $("#art_patient_search_MRN").val();
        var art_number = $("#art_patient_search_art_number").val();
        var first_name = $("#art_patient_search_first_name").val();
        var father_name = $("#art_patient_search_father_name").val();
        var grand_father_name = $("#art_patient_search_grand_father_name").val();
        var phone_number = $("#art_patient_search_phone_number").val();
        var gender = $("#art_patient_search_gender").val();
        var age = $("#art_patient_search_age").val();
        $.ajax({
            url: '/art_patients/load_patients',
            data: {mrn: mrn, art_number: art_number, first_name: first_name, father_name: father_name,
                grand_father_name: grand_father_name, phone_number: phone_number, gender: gender, age: age},
            success: function (response) {
                $("#art_patients_list").html(response)
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