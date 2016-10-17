(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    validateReservation();
  }

  var validateReservation = function() {
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
        }

      }
    });
  }
}).call(this)