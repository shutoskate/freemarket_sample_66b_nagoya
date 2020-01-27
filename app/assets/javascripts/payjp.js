$(function(){
  $("#token_submit").click(function(e){
    Payjp.setPublicKey("pk_test_fdecd306854b31c885512ef5");
    e.preventDefault(); //ボタンを一旦無効化します
    let card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    }; //入力されたデータを取得します。
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      } else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  })
})

