(function() {
  var activate;

  activate = function() {
    // $('#huldigen').click ->
    //     degree = Math.random() * 360
    //     $('.page-header').css('transform', 'rotate(' + degree + 'deg)')
    $('#neon-shizzle-button').click(function() {
      return $('#neon-shizzle').css('display', 'flex');
    });
    return $('#close-neon-shizzle').click(function() {
      return $('#neon-shizzle').css('display', 'none');
    });
  };

  $(document).ready(activate);

}).call(this);
