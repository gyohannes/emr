$("#art_patient_referral_attributes_referred_from").change(function () {
    var referred_from = $(this).val();
    $.ajax({
        url: '/art_patients/load_referral',
        data: {referred_from: referred_from},
        cache: true,
        async: false,
        success: function (response) {
            $("#referral_info").html(response)
        }
    });
});