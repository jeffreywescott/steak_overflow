var descriptionHandler = {
  showDescription: function(e, xhr) {
    xhr.abort(); // stop the AJAX call
    var $descriptionDiv = $(this).closest('.topic').find('.description');
    if ( $descriptionDiv.hasClass("closed") ) {
      $descriptionDiv.slideDown("slow")
      $descriptionDiv.removeClass("closed")
      $descriptionDiv.addClass("open")
    } else {
      $descriptionDiv.slideUp("slow")
      $descriptionDiv.removeClass("open")
      $descriptionDiv.addClass("closed")
    }
  }
}

$(document).ready(function() {
  $('.title').on('ajax:beforeSend', descriptionHandler.showDescription)
});