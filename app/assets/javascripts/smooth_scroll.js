$(document).on("turbolinks:load", function(){
  var scrollLinks = $(".scroll");

  scrollLinks.click(function(e){
    e.preventDefault();
    console.log($(this.hash).offset().top);
    $("body,html").animate({
      scrollTop: $(this.hash).offset().top - 100
    }, 1000);
  });

});