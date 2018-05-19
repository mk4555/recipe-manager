$(function() {
  $('#test').on('click',function(e){
    $.get('/ingredients').success(function(resp){
      console.log(resp)
    })
  })
})
