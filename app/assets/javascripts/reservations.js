(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    validateReservation();
  }

  var validateReservation = function() {
    $.validator.addMethod("greaterThan",
    function(value, element, params) {
        if (!/Invalid|NaN/.test(new Date(value))) {
            return new Date(value) >= new Date($(params).val());
        }
        return isNaN(value) && isNaN($(params).val())
            || (Number(value) > Number($(params).val()));
    }, ($(".vietnamese-lang").length > 0) ? "Không được nhỏ hơn ngày đến" : "Should not be less than check in date");

    $("#new_reservation").validate({
      rules: {
        "reservation[full_name]": {
          required: true,
          maxlength: 40,
        },
        "reservation[phone]": {
          required: true,
          maxlength: 15,
          number: true,
        },
        "reservation[email]": {
          required: true,
          email: true,
        },
        "reservation[check_in]": {
          required: true,
        },
        "reservation[check_out]": {
          required: true,
          greaterThan: "#reservation_check_in"
        },
        "reservation[number_of_room]": {
          required: true,
          number: true,
          max: 10,
          min: 1,
        },
        "reservation[number_adult]": {
          required: true,
          number: true,
          max: 100,
          min: 1,
        },
        "reservation[number_children]": {
          required: false,
          number: true,
          max: 100,
          min: 0,
        },
        "reservation[requirement]": {
          required: false,
          maxlength: 1000,
        },
        "reservation[company]": {
          required: false,
          maxlength: 100,
        },
        "reservation[address]": {
          required: false,
          maxlength: 200,
        },
      }
    });
  }
}).call(this)