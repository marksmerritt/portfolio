$(document).on("turbolinks:load", function(){
  $(".modalable-link").each(function(i){
    $(this).on("click", function(e){
      if($(e.target).hasClass(`modalable-link--${i+1}`)){
        openModal(i);        
      }
    });
  });

  $(".modal__close-btn").click(closeModal);

  $(document).click(function(e){
    if($(e.target).hasClass("modal")){
      closeModal();
    }
  });

  function openModal(i){
    console.log($(`#modal--${i+1}`));
    $(`#modal--${i+1}`).css({"display": "flex", "visibility": "visible"});
  }

  function closeModal(i){
    $(".modal").css({"display": "none", "visibility": "hidden"});
  }
});