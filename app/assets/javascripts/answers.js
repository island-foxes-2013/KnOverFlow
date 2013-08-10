var AnswersController = {
  bindEvents: function() {
    // ajax:beforeSend (before form is submitted)
    // ajax:success (when server returns successfully)
    // ajax:error (when server returns unsuccessfully)
    // ajax:complete (when server returns no matter what)
    $(document).on('ajax:beforeSend', 'form#new_answer', this.beforeSend);
    $(document).on('ajax:success', 'form#new_answer', this.onSuccess);
    $(document).on('ajax:error', 'form#new_answer', this.onError);
  },

  beforeSend: function(e) {
    $(e.target).parent().find('.errors').remove();
  },

  onSuccess: function(e, response, status, xhr) {
    var $answerForm = $(e.target);
    var $answersDiv = $('.answers')
    $answersDiv.append(response.html);
    $answerForm.find('input[name="answer[content]"]').val('');
    var offset = $answersDiv.find('div:last-child').offset();
    var offsetTop = offset.top;
    $('html, body').animate({
        scrollTop: offsetTop
    }, 500);
  }, 

  onError: function(e, xhr, status, message) {
    // use .html and change the arugements
    $(e.target).parent().html(xhr.responseJSON.html);
    // $(e.target).after("<div class='error'>"+xhr.responseJSON.messages.join(',')+"</div>");
  }
};


$(document).ready(function() {

  AnswersController.bindEvents();

});