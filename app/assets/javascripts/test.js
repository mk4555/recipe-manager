$(function() {
  $('#hello').on('click',function(e){
    $.ajax({
      method: "GET",
      url: '/ingredients'
    }).done(function(data){
      console.log(data)
    })
  })
})
