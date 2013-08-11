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
    // $(document).on('ajax:beforeSend', 'form#new_comment', this.beforeSend);
    $(document).on('ajax:success', 'form#new_comment', this.onSuccess);
    $(document).on('ajax:error', 'form#new_comment', this.onError);
  },

  // beforeSend: function(e) {
  //   debugger
  //   // $(e.target).find('.errors').remove();
  // },

  onSuccess: function(e, response, status, xhr) {

    var $commentForm = $(e.target);
    var $commentsDiv = $('.comments_display')
    $commentsDiv.replaceWith(response.html); 
    $commentForm.find('input[name="question[comment]"]').val('');
    var offset = $commentsDiv.find('li:last-child').offset();
  },

  onError: function(e, xhr, status, message) {
    console.log("failure in javascript!")
  }
}
