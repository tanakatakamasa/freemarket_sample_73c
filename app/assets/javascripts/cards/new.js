document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_4b1377c49c676a603e23dbc4"); //公開鍵
    const btn = document.getElementById('token_submit');
    btn.addEventListener("click", (e) => {
      e.preventDefault(); //ボタンを一旦無効化

      //カード情報をまとめてcardという変数へ代入
      const card = {
        number: document.getElementById("card_number").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value,
        cvc: document.getElementById("cvc").value
      };

      //createTokenメソッドを使ってpayjpとやりとりをして、card変数に入った情報と引き換えにトークンを生成
      Payjp.createToken(card, (status, response) => {

        if (status === 200) { //成功した場合は、法律上データベースへカード情報を保存してはいけないので削除
          $("#card_number").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#cvc").removeAttr("name");

          //cn__card__inner__tokenのidがついているformへ、name属性をpayjp-tokenとして、トークンを飛ばす
          $("#cn__card__inner__token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          //type=hiddenで隠しタグにすることで、<input>タグで ブラウザ上に非表示のままデータを送信することができる

          document.inputForm.submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },false);
