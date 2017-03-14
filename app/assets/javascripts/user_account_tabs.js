document.addEventListener("turbolinks:load", function(){
  $('.side-menu').on('click', function(event) {
    event.preventDefault()
    var jobsDashboard = event.target.dataset.tab;
    $('.jobs-dashboard').removeClass('show').removeClass('wtv');
    $('#jobs-'+ jobsDashboard).addClass('show');
    console.log(event)
  });
});
