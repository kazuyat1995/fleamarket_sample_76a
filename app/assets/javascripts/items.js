$(function(){
  function buildFileField (index) {
    var html = `<div data-index="${index}" class="js-file_group" id="group_${index}">
                  <div class="image-previews" id="image_preview_${index}"></div>
                  <div class="file-field">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_src">
                  </div>
                  <input type="checkbox" name="_destroy" data-index="image.${index}" class="destroy">
                  <input type="hidden" name="id" value="image.object.id">
                </div>`;
    return html;
  }

  function shiftArray() {
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  }

  function addFileField(n) {
    // プレビュー画像枚数がn枚以下のときfileIndexの先頭の数字を使ってinputを作る
    if ($('.image-preview').length < n){
      $('#image-box').append(buildFileField(fileIndex[0]));
      var indexNum = fileIndex[0] - 1;
      shiftArray();
    } else {
      var indexNum = fileIndex[0] - 1;
      shiftArray();
    }
    return indexNum
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4];

  $('#image-box').on('change', '.js-file', function(e) {
    var indexNum = addFileField(3);
    // プレビュー表示 
    var file = $(`#item_images_attributes_${indexNum}_src`).prop('files')[0];
    var fileReader = new FileReader();

    fileReader.onloadend = function() {
      var src = fileReader.result
      var html = `<img src="${src}" class="image-preview">
                  <i class="fas fa-trash-alt js-remove"></i>`
      $(`#image_preview_${indexNum}`).prepend(html);
    }
    fileReader.readAsDataURL(file);
  
    $(`#item_images_attributes_${indexNum}_src`).hide();
    $(`#image_preview_${indexNum}`).fadeIn('slow');
  });

  // 商品情報編集時
  if(window.location.href.match(/\/items\/\d+\/edit/)) {
    // newの時に非表示にしたinputを再利用するとrequiredが更新されてしまう為
    $('form').find('input').removeAttr('required');

    // プレビュー表示
    var indexNum = 0
    var inputfile = $('.js-file').length
    for (var step = 0; step < inputfile; step++) {
      $(`#item_images_attributes_${indexNum}_src`).hide();
      $(`#image_preview_${indexNum}`).fadeIn('slow');
      var indexNum = indexNum + 1
      shiftArray();
    }
    fileIndex.unshift(fileIndex[0]-1);
    fileIndex.pop();

    addFileField(4);
  }

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().siblings(".destroy").attr('checked', 'checked');
    $(this).parent().siblings(".file-field").remove();
    $(this).parent().remove();

    if ($('.js-file').length <= $('.image-preview').length){
      $('#image-box').append(buildFileField(fileIndex[0]));
      shiftArray();
    }

    // 削除処理後に生成されたinput要素が１つのときにrequiredを付与する
    if ($('.js-file').length == 1){
      $('.js-file').attr('required', 'true');
    }
  });

  // 販売価格内訳表示
  $('#retail-price').on('change keyup', function(){
    var retailPrice = $(this).val();
    fee = parseInt(retailPrice * 0.1);
    profit = retailPrice - fee;
    // 販売手数料は小数点切り捨て

    $('#fee').html(fee);
    $('#profit').html(profit);
  })
});