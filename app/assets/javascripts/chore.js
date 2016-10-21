$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    user = self.data('user');
    chore = self.data('chore');
    $.ajax({
       type: "GET",
       data: {user_id: user},
       url: `/chores/${chore}/edit`
  })
  .done(data => {
    document.getElementById('chore-claim-message').innerHTML = data.message;
    });
  });
})
