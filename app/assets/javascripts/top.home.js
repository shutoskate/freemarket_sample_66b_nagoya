$(function(){

  // カテゴリー等選択時のスクロール---------------------
  $(".select-list").on("click",function(){
    var num = $(".select-list").index(this);
    var scroll = $(".top__category-item__category-list__top--name"+[num]).offset().top;
    $("html,body").animate({
      scrollTop:scroll
    })
  });




});