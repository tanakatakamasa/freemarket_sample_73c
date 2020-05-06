$(function(){
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}", class="items_new-preview-box">
                    <div class="items_new-upper-box">
                      <img data-index="${index}" src="${url}" width="100px" height="100px">
                      <div class="items_new-js-remove">
                        削除
                      </div>
                    </div>
                  </div>`;
    return html;
  }
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="items_new-js-file_group">
                    <input class="items_new-js-file" type="file"
                    name="item[images_attributes][${num}][item_image]"
                    id="images_attributes_${num}_item_image"
                    style= "display:none;">
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.items_new-js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.items_new-hidden-destroy').hide();
  $('.items_new-image-box').on('change', '.items_new-js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $('.items_new-content').append(buildImg(targetIndex, blobUrl));
    $('.items_new-uploader__label').prepend(buildFileField(fileIndex[0]));
    $(this).css({'display':'none'});
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  $('.items_new-image-box').on('click', '.items_new-js-remove', function() {
    const targetIndex = $(this).prev().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].items_new-hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    if ($('.items_new-js-file').length == 0) $('.items_new-image-box').append(buildFileField(fileIndex[0]));
  });
});


// 以下編集のJS


$(function(){
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}", class="items_edit-preview-box">
                    <div class="items_edit-upper-box">
                      <img class= "image${index} items_edit-input_images", data-index="${index}" src="${url}" width="100px" height="100px">
                      <div class="items_edit-js-remove">
                        削除
                      </div>
                    </div>
                  </div>`;
    return html;
  }
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="items_edit-js-file_group">
                    <input class="items_edit-js-file" type="file"
                    name="item[images_attributes][${num}][item_image]"
                    id="items_images_attributes_${num}_item_image"
                    style="display:none;">
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.items_edit-js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.items_edit-hidden-destroy').hide();
  
  $('.items_edit-image-box').on('change', '.items_edit-js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('.items_edit-content').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.items_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
      $(this).css({'display':'none'});
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // 削除ボタンの設定
  $('.items_edit-image-box').on('click', '.items_edit-js-remove', function() {
    const targetIndex = $(this).parent().parent().data('index');
    // もしチェックボックスが存在すればチェックを入れる
    $(`.delete-check-box-${targetIndex}`).prop('checked', true);
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.items_edit-js-file').length == 0) $('.items_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
  });
});
