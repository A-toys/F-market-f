$(function () {
  $('.sell__main__box__upload__box__preview').on('dragover', function (e) {
    e.preventDefault();
  })
  $('.sell__main__box__upload__box__preview').on('drop', function (event) {
    event.preventDefault();

  });
  const uploadItems = '#image_ul';
  const uploadItems2 = '#box__drop2';
  const uploadDropBox = '#guide_box';
  const uploadDropBox2 = '#guide_box2';
  // 画像アップロード時プレビュー表示
  $('#image_uploder').on('change', function (e) {
    let files = e.target.files;
    $.each(files, function (index, file) {
      let reader = new FileReader();
      if (file.type.indexOf("image") < 0) {
        alert("画像ファイルを指定してください。");
        return false;
      }
      //アップロードした画像を設定する
      reader.onload = (function (file) {
        return function (e) {
          let itemLength = $(uploadItems).children('li').length;
          if (itemLength == 10) {
            return false;
          } else if(itemLength < 4) {
            $(uploadItems).prepend(`<li class="sell__main__box__upload__items">
                                  <figure class="sell__main__box__upload__items__figure">
                                    <img src='${e.target.result}' title='${file.name}' width="105px" height="120px">
                                  </figure>
                                  <div class="sell__main__box__upload__items__btn">
                                    <a class="sell__main__box__upload__items__btn__edit" href="#">編集</a>
                                    <a class="sell__main__box__upload__items__btn__delite" href="#">削除</a>
                                  </div>
                                 </li>`);
            $(uploadDropBox).removeClass().addClass(`sell__main__box__upload__box__preview__guide-${itemLength + 1}`)
          }else if(itemLength >= 4) {
              $(uploadDropBox).css('display', 'none')
              $(uploadItems2).css('display','block');
              $(uploadItems).prepend(`<li class="sell__main__box__upload__items">
                                  <figure class="sell__main__box__upload__items__figure">
                                  <img src='${e.target.result}' title='${file.name}' width="105px" height="120px">
                                </figure>
                                <div class="sell__main__box__upload__items__btn">
                                  <a class="sell__main__box__upload__items__btn__edit" href="#">編集</a>
                                  <a class="sell__main__box__upload__items__btn__delite" href="#">削除</a>
                                </div>
                              </li>`);
            $(uploadDropBox).removeClass().addClass(`sell__main__box__upload__box__preview__guide-second-${itemLength + 1}`)
            }
        };
        
      })(file);
      reader.readAsDataURL(file);
    });
  });
  $(document).on('click', '.sell__main__box__upload__items__btn__delite', function () {
    $(this).parents('.sell__main__box__upload__items').remove();
    $("#image_uploder").remove();
    let itemLength = $(uploadItems).children('li').length;
    $(uploadDropBox).removeClass().addClass(`sell__main__box__upload__box__preview__guide-${itemLength}`)
  });
  $(document).on('click', '#edit_delite', function () {
    $(this).parents('.sell__main__box__upload__items').remove();
    $("#image_editer").remove();
    let itemLength = $(uploadItems).children('li').length;
    $(uploadDropBox).removeClass().addClass(`sell__main__box__upload__box__preview__guide-${itemLength}`)
  });
})


