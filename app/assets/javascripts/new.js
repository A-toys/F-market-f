$(function(){
  $('.sell__main__box__price__box__group__right__1').on('input', function(){
    var data = $('.sell__main__box__price__box__group__right__1').val();
    var profit = Math.round(data * 0.9) 
    var fee = (data - profit)
    $('.sell__main__box__price__box__tax__1').html(fee)
    $('.sell__main__box__price__box__tax__1').prepend('¥')
    $('.sell__main__box__price__box__profit__1').html(profit)
    $('.sell__main__box__price__box__profit__1').prepend('¥')
    $('#price').val(profit)
    if(profit == '') {
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
})
