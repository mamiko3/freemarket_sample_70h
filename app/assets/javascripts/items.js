$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `
                <div class="js-file_group" data-index="${index}">
                <input type="file" class="abc" value="textarea" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">
                <span class="js-remove">
                削除
                </span>
                </div>
                 `
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.abc', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    console.log(fileIndex);
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    console.log(fileIndex);

  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.abc').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});