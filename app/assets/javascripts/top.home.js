$(function(){

  // window.onload = function(){
  //   var img = 
  //   $(".top__advertising").html(img)


  // }


  // 選択時の囲線での強調--------------------
  $(".product").on("mouseenter",function(){
    var line = $(".product").index(this);
    $(".product")[line].style.border = "solid 1px skyblue";
    $(".product").on("mouseleave",function(){
      var line = $(".product").index(this);
      $(".product")[line].style.border = "";
    });
  });
  
  // カテゴリー等選択時のスクロール---------------------
  $(".select-list").on("click",function(){
    var num = $(".select-list").index(this);
    var scroll = $(".top__category-item__category-list__top--name"+[num]).offset().top;
    $("html,body").animate({
      scrollTop:scroll
    })
  });




});