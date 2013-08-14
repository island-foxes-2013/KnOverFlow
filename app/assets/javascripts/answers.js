$(document).ready(function() {
  AnswersController.bindEvents();
});

var AnswersController = {
  bindEvents: function() {
    // ajax:beforeSend (before form is submitted)
    // ajax:success (when server returns successfully)
    // ajax:error (when server returns unsuccessfully)
    // ajax:complete (when server returns no matter what) 

    // listen for new_question_answer_path link
    $(document).on('ajax:success', $('div#click_new_answer'), this.onLinkSuccess);
    
    // listen for something other than document eventually
    // here I'll need page to go away on complete
    $(document).on('ajax:beforeSend', 'form#new_answer', this.beforeSend);
    $(document).on('ajax:success', 'form#new_answer', this.onSuccess);
    $(document).on('ajax:error', 'form#new_answer', this.onError);
  },

  beforeSend: function(e) {
    $(e.target).find('.errors').remove();
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
    if (xhr.responseJSON == null)
    {
      window.alert("remember to log in or create an account");
    }
    else
    {
      $(e.target).parent().html(xhr.responseJSON.html);
    }
  }, 

  onLinkSuccess: function(e, partial, status, xhr) {
    $(this).find('div#create_answer').html(partial.html);
    $(this).find('div.answer_display').remove();
  }
  //Vote Ajax Call
  // $(document.on("click", '.up_vote' function(){
  //   $(".up_vote").bind('ajax:success', function(){
  //     alter("Success!")
  //   }
  // });
};
