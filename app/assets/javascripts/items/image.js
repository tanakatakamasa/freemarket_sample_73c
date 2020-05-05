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