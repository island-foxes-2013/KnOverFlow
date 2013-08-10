var AnswersController = {
  bindEvents: function() {
    // ajax:beforeSend (before form is submitted)
    // ajax:success (when server returns successfully)
    // ajax:error (when server returns unsuccessfully)
    // ajax:complete (when server returns no matter what)
    $('form#new_answer').on('ajax:success', this.onSuccess);
  },

  onSuccess: function(e, response, status, xhr) {
    // e is the event
    // response is a JSON object with an html attribute
    $('.answers').append(response.html);
    $(e.target).find('input[name="answer[content]"]').val('');
    var offset = $('.answers div:last-child').offset();
    var offsetTop = offset.top;
    $('html, body').animate({
        scrollTop: offsetTop
    }, 500);
  }
};


$(document).ready(function() {

  AnswersController.bindEvents();

});