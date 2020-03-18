$(document).on('turbolinks:load', ()=> {

  // プレビュー用のhtml要素生成
  const buildImg = (index ,url)=>{
    const html = `<div class="js-remove-wrapper">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <span class="js-remove" data-index="${index}">
                      <a rel="nofollow"   data-index="${index}" >削除</a>
                    </span>
                  </div>
                  `;
    return html;
  };



  $('#image-box').on('click', '.js-remove', function() {
   const targetIndex = $(this).data('index')
   const hiddenCheck = $(`input[data-index=${targetIndex}].hidden-destroy`);
   if (hiddenCheck) hiddenCheck.prop('checked', true);
   $(this).parent().remove();
   if ($('.abc').length == 0) $('#form-wrapper').append(buildFileField(fileIndex[0]));
  });
});