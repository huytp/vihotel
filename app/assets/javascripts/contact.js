(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    validateContact();
    if ($(".vietnamese-lang").length > 0) {
      changeLanguage();
    }
  }

  var changeLanguage = function() {
    $.extend( $.validator.messages, {
      required: "Hãy nhập.",
      remote: "Hãy sửa cho đúng.",
      email: "Hãy nhập email.",
      url: "Hãy nhập URL.",
      date: "Hãy nhập ngày.",
      dateISO: "Hãy nhập ngày (ISO).",
      number: "Hãy nhập số.",
      digits: "Hãy nhập chữ số.",
      creditcard: "Hãy nhập số thẻ tín dụng.",
      equalTo: "Hãy nhập thêm lần nữa.",
      extension: "Phần mở rộng không đúng.",
      maxlength: $.validator.format( "Hãy nhập từ {0} kí tự trở xuống." ),
      minlength: $.validator.format( "Hãy nhập từ {0} kí tự trở lên." ),
      rangelength: $.validator.format( "Hãy nhập từ {0} đến {1} kí tự." ),
      range: $.validator.format( "Hãy nhập từ {0} đến {1}." ),
      max: $.validator.format( "Hãy nhập từ {0} trở xuống." ),
      min: $.validator.format( "Hãy nhập từ {1} trở lên." )
    });
  }

  var validateContact = function() {
    $("#new_contact").validate({
      rules: {
        "contact[full_name]": {
          required: true,
          maxlength: 40,
        },
        "contact[phone]": {
          required: true,
          maxlength: 15,
          number: true,
        },
        "contact[email]": {
          required: true,
          email: true,
        },
        "contact[title]": {
          required: true,
          maxlength: 50,
        },
        "contact[content]": {
          required: true,
          maxlength: 500,
        },
      }
    });
  }
}).call(this)