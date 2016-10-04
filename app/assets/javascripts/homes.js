(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    slider();
    slideHome();
    if ($(window).width() > 767) {
      sliderBook();
    }
    if ($("#main-slider").length) {
      overviewSliderOverview();
      dropDown();
    }
    if ($(".service-archive").length) {
      overviewSliderRestaurant();
      overviewSliderCoffee();
      overviewSliderSpa();
      overviewSliderPool();
    }
    DatePicker();
  };

  var slideHome = function() {
    carousel();
    function carousel() {
      $(".next").click()
      setTimeout(carousel, 5000);
    }
  }

  var dropDown = function() {
    $('.dropdown-toggle').dropdown();
  }
  var slider = function() {
    if ($("#main-slider").length) {
      $(window).scroll(function(){
          if ($(this).scrollTop() > JSCONSTANT.HEIGHT_OF_MAIN_SLIDE) {
            $('.parent-navbar').slideDown("slow");
          } else {
              $('.parent-navbar').slideUp("slow");
          }
      });
    } else {
      $(".parent-navbar").css("display","block");
    }
  }
  var sliderBook = function() {
    $(window).scroll(function(){
        if ($(this).scrollTop() > $("#main-content").height() + $('#book-block').height() +60) {
          $('#book-block').css("position", "relative");
        } else {
          $('#book-block').css("position", "fixed");
        }
    });
  }
  var overviewSliderOverview = function() {
    var myIndex = 0;
    carousel();
    function carousel() {
        var i;
        var x = $(".vi-slides-overview");
        for (i = 0; i < x.length; i++) {
           x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3000);
    }
  }
  var overviewSliderRestaurant = function() {
    var myIndex = 0;
    carousel();
    function carousel() {
        var i;
        var x = $(".vi-slides-restaurant");
        for (i = 0; i < x.length; i++) {
           x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3500);
    }
  }
  var overviewSliderCoffee = function() {
    var myIndex = 0;
    carousel();
    function carousel() {
        var i;
        var x = $(".vi-slides-coffee");
        for (i = 0; i < x.length; i++) {
           x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3100);
    }
  }
  var overviewSliderSpa = function() {
    var myIndex = 0;
    carousel();
    function carousel() {
        var i;
        var x = $(".vi-slides-spa");
        for (i = 0; i < x.length; i++) {
           x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 2500);
    }
  }

  var overviewSliderPool = function() {
    var myIndex = 0;
    carousel();
    function carousel() {
        var i;
        var x = $(".vi-slides-pool");
        for (i = 0; i < x.length; i++) {
           x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 2500);
    }
  }

  var DatePicker = function() {
    var dateToday = new Date();
    $("#reservation_check_in, #reservation_check_out").datepicker({
      startDate: '0',
      format: "yyyy-mm-dd"
    })
  }

}).call(this)


