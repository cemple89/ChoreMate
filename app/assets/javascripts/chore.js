$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    user = self.data('user');
    chore = self.data('chore');
    points = self.data('points');
    score = self.data('score');
    var user_chorescore = $("#user-chorescore-" + user);

    var claim_chore = $.ajax({
       type: "GET",
       data: {user_id: user},
       url: `/chores/${chore}/edit`

  })
  claim_chore.done(data => {
    document.getElementById('chore-claim-message').innerHTML = data.message;
    })
    var chore_score = $.ajax({
      type: "PATCH",
      data: {chore_points: points},
      url: `/users/${user}`

    })

    chore_score.done(data => {
      document.getElementById(user_chorescore).innerHTML = (score + points)
    });
  });
})
