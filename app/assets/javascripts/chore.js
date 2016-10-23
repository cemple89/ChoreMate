$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    user = self.data('user');
    chore = self.data('chore');
    points = self.data('points');
    score = self.data('score');
    last_completed = self.data('last_completed')
    var user_chorescore = $("#user-chorescore-" + user);

    var claim_chore = $.ajax({
       type: "GET",
       data: {user_id: user},
       url: `/chores/${chore}/edit`

    })
    claim_chore.done(data => {
      var arr = $('.mychore')
      for(let chore in arr)
      {
        allchores = arr[chore]
        if(data.chore_id == allchores.id){
          allchores.children[6].innerHTML = "Last Completed By: " + data.completed
        }
      }
    })
    var chore_score = $.ajax({
      type: "PATCH",
      data: {chore_points: points},
      url: `/users/${user}`
    })
    chore_score.done(data => {
      var brr = $('.user-information')
      for(let score in brr)
      {
        currentuserscore = brr[score]
        if(data.user_id == currentuserscore.id){
          currentuserscore.children[1].innerHTML = "Chorescore: " + data.completed
        }
      }
    })
  });
})
