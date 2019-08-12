$(document).on("turbolinks:load", function(){
  $("#contact-btn").click(openModal);

  $(".modal__close-btn").click(closeModal);

  $(document).click(function(e) {
    if($(e.target).hasClass("modal")){
      closeModal();
    }
  });

  function openModal(){
    $("#contact-modal").css({"display": "flex", "visibility": "visible"});
  }

  function closeModal(){
    $("#contact-modal").css({"display": "none", "visibility": "hidden"});
  }
});