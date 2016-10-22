$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    user = self.data('user');
    chore = self.data('chore');
    points = self.data('points')
    var claim_chore = $.ajax({
       type: "GET",
       data: {user_id: user},
       url: `/chores/${chore}/edit`
  })
  claim_chore.done(data => {
    document.getElementById('chore-claim-message').innerHTML = data.message;
    })

    var chore_score = $.ajax({
      type: "GET",
      data: {chorescore: points}
      url: `/users/${user}/edit`
    })
    chore_score.done(data) => {
      document.getElementById('chore-score-message').innerHTML =
      data.message;
    });
  });
})
