document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_4b1377c49c676a603e23dbc4");
    const btn = document.getElementById('token_submit'); //IDがtoken_submitの場合に取得されます
    btn.addEventListener("click", (e) => {　//ボタンが押されたときに作動します
      e.preventDefault();　//ボタンを一旦無効化します

      //カード情報生成
      const card = {
        number: document.getElementById("card_number").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value,
        cvc: document.getElementById("cvc").value
      }; //入力されたデータを取得します。

      //Payjp.createTokenというメソッドを使ってトークン生成、まだpayjpへは送らず生成だけ
      Payjp.createToken(card, (status, response) => {

        if (status === 200) { //成功した場合
          $("#card_number").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#cvc").removeAttr("name"); //法律上カード情報を自分のサーバにpostしてはいけないのでここで削除しまいます

          // formにinput要素をappendして、name属性にトークンのキー名payjp-tokenを指定します。
          // これにより生成したトークンをsubmitでpayjp-tokenとしてばして、createアクションでを使います
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成
          // <input>タグのtype属性でtype="hidden"を指定すると、 ブラウザ上に表示されない非表示データを送信することができます。 

          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません。"); //確認用
        }

      });
    });
  },false);
