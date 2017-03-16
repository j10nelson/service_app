document.addEventListener("turbolinks:load", function(){
  $('.side-menu button').on('click', function(event) {

    event.preventDefault()
    var jobsDashboard = event.target.dataset.tab;
    $('.jobs-dashboard').removeClass('show').removeClass('wtv');
    // $('#personal-d'+ jobsDashboard).hide()
    $('#jobs-'+ jobsDashboard).addClass('show');
    console.log(event)
  });
});

// document.addEventListener("turbolinks:load", function(){
//   $('.side-menu').on('click', function(event) {
//     event.preventDefault()
//     var jobsDashboard = event.target.dataset.tab;
//     $('#personal-details').show()
//
//     // $('.personal-dashboard').removeClass('show2');
//     // $('#personal-'+ jobsDashboard).addClass('show2');
//     console.log(event)
//   });
// });
