$(function () {
    $("#art_patient_care_giver_attributes_address_same_as_patient").on('ifChanged', function () {
        $("#care_giver_address").toggle();
    })

    $("#art_patient_patient_attributes_date_of_birth").on("dp.change", function () {
        var dob = $("#art_patient_patient_attributes_date_of_birth").val()
        var age = getAge(dob);
        $("#art_patient_patient_attributes_age_years").val(age[0]);
        $("#art_patient_patient_attributes_age_months").val(age[1]);
        $("#art_patient_patient_attributes_age_days").val(age[2]);
        if ((age[0] === 5 && age[1] === 0 && age[2] === 0) || age[0] < 5) {
            $("#children_under_5").show()
        } else{
            $("#children_under_5").hide()
        }
    })

    $("#art_patient_patient_attributes_age_years,#art_patient_patient_attributes_age_months, #art_patient_patient_attributes_age_days").on("change", function () {
        var years = $("#art_patient_patient_attributes_age_years").val();
        var months = $("#art_patient_patient_attributes_age_months").val();
        var days = $("#art_patient_patient_attributes_age_days").val();
        $("#art_patient_patient_attributes_date_of_birth").val(getDate(years, months, days));
        var dob = $("#art_patient_patient_attributes_date_of_birth").val()
        var age = getAge(dob)
        if ((age[0] === 5 && age[1] === 0 && age[2] === 0) || age[0] < 5 ) {
            $("#children_under_5").show()
        } else{
            $("#children_under_5").hide()
        }
    })

    $("input[name='art_patient[referral_attributes][referred_from]']").on('ifChanged',function () {
        var referred_from = $(this).val();
        if (referred_from === 'from_with_in'){
            $("#referred_from_department").show()
            $("#referred_from_referred_type").hide();
        }else if (referred_from === 'from_outside'){
            $("#referred_from_department").hide()
            $("#referred_from_referred_type").show();
        }
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

    function getAge(dateString){
        var today  = new Date();
        var birthDate  = new Date(dateString);
        var timeDiff = Math.abs(today.getTime() - birthDate.getTime());
        var diffDays = Math.floor(timeDiff / (1000 * 3600 * 24));
        var years = Math.floor(diffDays / 365);
        diffDays = diffDays % 365;
        var months = Math.floor(diffDays/30.42)
        var days = Math.floor(diffDays % 30.42)

        return [years, months, days]
    }

    function getDate(years, months, days) {
        var date = new Date();
        var dateMilliseconds = date.setFullYear(date.getFullYear() - years, date.getMonth() - months, date.getDate() - days + 1 );
        date = new Date(dateMilliseconds);
        return date.toISOString();
    }

})