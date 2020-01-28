$(function($){
  $('.tab').click(function(){
    var idx=$('.tab').index(this);
    $(this).addClass('active')
    $(this).siblings('.tab').removeClass('active');
    $(this).closest('.mypage-tabs').next('.tab-content').children().find('.panel').removeClass('show');
    $('.panel').eq(idx).addClass('show');
  });
});