(function(){
  $(document).on("ready", function() {
    init();
  });
  var init = function() {
    slider();
    if ($("#main-slider").length) {
      getWidth();
      overviewSliderOverview();
      dropDown();
    }
    if ($(window).width() > 767) {
      sliderBook();
    }
    if ($(window).width() > 890) {
      resizeSlide();
    }
    
    if ($(".service-archive").length) {
      overviewSliderRestaurant();
      overviewSliderCoffee();
      overviewSliderSpa();
      overviewSliderPool();
    }
    DatePicker();
    rollTop();
    // chatBox();
    likeFacebook();

  };
  var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
  };
  var getWidth = function() {
    w_param = getUrlParameter("w");
    width = $(window).width();
    if (w_param == undefined) {
      window.location.href="?w="+width;
    }
  }
  var resizeSlide = function() {
    var height = $(".vihotel-video").height();
    $(".carousel.slide").css("height", height);
    $(".background-video").css("height", height);
    $(".vihotel-video img").css("height", height);
    $(".vihotel-video video").css("height", height);
  }
  var likeFacebook = function() {
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=992014527588145&autoLogAppEvents=1";
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


