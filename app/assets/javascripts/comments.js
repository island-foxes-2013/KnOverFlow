// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  CommentsController.bindEvents();
});

var CommentsController = {
  bindEvents: function () {
        // ajax:beforeSend (before form is submitted)
    // ajax:success (when server returns successfully)
    // ajax:error (when server returns unsuccessfully)
    // ajax:complete (when server returns no matter what)    
    // listen for something other than document
    $(document).on('ajax:beforeSend', 'new#new_comment', this.beforeSend);
    $(document).on('ajax:success', 'new#new_comment', this.onSuccess);
    $(document).on('ajax:error', 'new#new_comment', this.onError);
  },

  beforeSend: function(e) {
    $(e.target).find('.errors').remove();
  },

  onSuccess: function(e, response, status, xhr) {
    var $commentForm = $(e.target);
    var $commentsDiv = $('.question_display ul')
    $commentsDiv.append()
  }
}
