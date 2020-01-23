$(function(){

  // カテゴリー等選択時のスクロール---------------------
  //  #で始まるアンカーをクリックした場合に処理
   $('a[href^="#"]').on('click', function(){
     console.log("aa")
      // 移動先を数値で取得
      var position = target.offset().top;
      // スムーススクロール
      $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
   });
     var target = $(href == "#" || href == "" ? 'html' : href);
     // スムーススクロール
     $('body,html').animate({scrollTop:position}, speed, 'swing');
     return false;
    });
   

});
