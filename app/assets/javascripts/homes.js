(function(){
  $(document).on("ready", function() {
    init();
  });
  var init = function() {
    slider();

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
    rollTop();
    chatBox();
    likeFacebook();
  };
  var likeFacebook = function() {
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=992014527588145";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
  }
  var chatBox = function() {
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/57fd179f9ca1830bdc904e05/default';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
  }

  var rollTop = function() {
    $(".backtop").click(function() {
      $("html, body").animate({ scrollTop: 0 }, "slow");
      return false;
    });
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
        if ($(this).scrollTop() > $("#main-content").height() + $('.booking-desktop #book-block').height() +60) {
          $('.booking-desktop #book-block').css("position", "relative");
        } else {
          $('.booking-desktop #book-block').css("position", "fixed");
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


