(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    slider();
  };
  var slider = function() {
    $(window).scroll(function(){
        if ($(this).scrollTop() > 200) {
          $('#menu').fadeOut(500);
          $('.parent-navbar').fadeIn(500);
        } else {
            $('.parent-navbar').fadeOut(500);
        }
    });
  }

}).call(this)
