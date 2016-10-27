$(document).ready(function() {

  $('.js-claim-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    user = self.data('user');
    chore = self.data('chore');
    points = self.data('points');
    score = self.data('score');
    last_completed = self.data('last_completed');
    completion_interval = self.data('completion_interval');

    var claim_chore = $.ajax({
       type: "GET",
       data: {user_id: user,
              last_completed: last_completed,
              completion_interval: completion_interval
             },
       url: `/chores/${chore}/edit`

    })
    claim_chore.done(data => {
      var arr = $('.mychore')
      for(let chore in arr)
      {

        allchores = arr[chore]
        if(data.chore_id == allchores.id){

          allchores.children[1].children[2].innerHTML = "Last Completed By " + data.name + " on " + data.last_completed
          allchores.children[1].children[4].innerHTML = "Due On " + data.due_by
          allchores.children[2].innerHTML = "Chore Claimed"
        }
      }
    })
    var chore_score = $.ajax({
      type: "PATCH",
      data: {chore_points: points},
      url: `/users/${user}`
    })
    chore_score.done(data => {
      var arr = $('.user-information')
      for(let score in arr)
      {
        currentuserscore = arr[score]
        if(data.user_id == currentuserscore.id){
          currentuserscore.children[1].innerHTML = data.completed
        }
      }
    })
  });


  $('.js-delete-chore').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    chore = self.data('chore');

    var delete_chore = $.ajax({
      type: "DELETE",
      data: {chore_id: chore},
      url: `/chores/${chore}`
    })

    delete_chore.done(data=> {
      var arr = $('.mychore')
      for(let chore in arr)
      {
        deletedchore = arr[chore]
        if(data.chore_id == deletedchore.id){
          deletedchore.parentElement.remove();
        }
      }
    })
  })
})
