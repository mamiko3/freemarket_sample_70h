
$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `
                <div class="js-file_group" data-index="${num}">
                  <input type="file" class="abc" value="textarea" name="item[images_attributes][${num}][image]" id="item_images_attributes_${num}_image">
  
                </div>
                 `;
    return html;
  }
  // プレビュー用のhtml要素生成
  const buildImg = (index ,url)=>{
    const html = `<div class="js-remove-wrapper">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <span class="js-remove" data-index="${index}">
                      <a rel="nofollow"  ,delete: :method, data-index="${index}"">削除</a>
                    </span>
                  </div>
                  `;
    return html;
  };

  

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0,lastIndex);
  $('.hidden-destroy').hide();

 // file_fieldのnameに動的なindexをつける為の配列

  $('#image-box').on('change', '.abc', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    const targetIndex =$(this).parent().data('index');
    const file =e.target.files[0];
    const blobUrl =window.URL.createObjectURL(file);
    if(img =$(`img[data-index="${targetIndex}"]`)[0]){
      img.setAttribute('src',blovUrl)
    }else{
      $('#previews').append(buildImg(targetIndex,blobUrl));
      $('#form-wrapper').append(buildFileField(fileIndex[0]));
      $(this).parent().css({'display':'none'});
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }

  });

  

  $('#image-box').on('click', '.js-remove', function() {
   const targetIndex = $(this).parent().data('index');
   const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
   if (hiddenCheck) hiddenCheck.prop('checked', true);
   $(this).parent().remove();
   $(`img[data-index="${targetIndex}"]`).remove();
   if ($('.abc').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

});
  $(function(){
  $('.subimage_li img').click(function(){
  // マウスオーバーしている画像をメインの画像に反映
  $('.mainimage img').attr('src', $(this).attr('src'));
  
  });
});
