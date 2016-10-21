$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    console.log("THIS")
    var self = $(this),
    user = self.data('user'),
    chore = self.data('chore');

    var up_request = $ajax({
      method: "PATCH",
      data: {user_id: user},
      URL: '/chores/`$(chore.id)`'
    });

    up_request.done(function(data)) {
      chore.html(user_id = user)
    }
  });
});
