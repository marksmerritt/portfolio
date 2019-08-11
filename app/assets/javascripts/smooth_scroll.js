$(document).on("turbolinks:load", function(){
  var scrollLinks = $(".scroll");

  scrollLinks.click(function(e){
    e.preventDefault();
    $("body,html").animate({
      scrollTop: $(this.hash).offset().top
    }, 1000);
  });

});