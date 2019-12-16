$(function(){
  var slider = ".item-details__content__left__main"; // スライダー
  var thumbnailItem = ".item-details__content__left__list__image"; // サムネイル画像

  //slickスライダー初期化(スライダー定義)
  $(slider).slick({
    arrows: false
  });

  //サムネイル画像をクリックしたときにスライダー切り替え
  $(thumbnailItem).on('click',function(){
    $(slider).slick("slickGoTo", $(this).index());
  });

  //サムネイル画像にマウスオーバーしたときにスライダー切り替え
  $(thumbnailItem).on('mouseover', function() {
    $(slider).slick('slickGoTo', $(this).index());
  });
});