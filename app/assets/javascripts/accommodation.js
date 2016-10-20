(function() {
  $(document).on("ready", function() {
    init();
  });
  var init = function() {
    feature()
  }
  var feature = function() {
    $(".accomodation-feature-form input[type=checkbox]").each(function(){
      this.disabled =true;
    });
  }
}).call(this);