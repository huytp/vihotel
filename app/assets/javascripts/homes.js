(function(){
  $(document).on("ready", function() {
    init();
  });

  var init = function() {
    slider();
    sliderBook();
    overviewSliderOverview();
    overviewSliderRestaurant();
    overviewSliderCoffee();
    overviewSliderSpa();
  };
  var slider = function() {
    $(window).scroll(function(){
        if ($(this).scrollTop() > JSCONSTANT.HEIGHT_OF_MAIN_SLIDE) {
          $('.parent-navbar').slideDown("slow");
        } else {
            $('.parent-navbar').slideUp("slow");
        }
    });
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

}).call(this)


