$(function(){
  // カテゴリー等選択時のスクロール---------------------
   $('a[href^="#"]').on('click', function(){
     console.log("aa")
     var speed = 400; 
     var href= $(this).attr("href");
     var target = $(href == "#" || href == "" ? 'html' : href);
     var position = target.offset().top;
     $('body,html').animate({scrollTop:position}, speed, 'swing');
     return false;
    });
   

});
