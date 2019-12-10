$(function() {
  //クリックしたときのファンクションをまとめて指定
  $('.top_tab li').click(function(){
    //.index()を使いクリックされたタブが何番目かを調べ、
    //indexという変数に代入します。
    var index = $('.top_tab li').index(this);
    //コンテンツを一度消して、すべて非表示にし、
    $('.top_content li').removeClass('hide');
    $('.top_content li').css('display','none');
    //クリックされたタブと同じ順番のコンテンツを表示します。
    $('.top_content li').eq(index).css('display','block');
    //一度タブについているクラスselectを消し、
    $('.top_tab li').removeClass('select');
    //クリックされたタブのみにクラスselectをつけます。
    $(this).addClass('select')
  });
});

$(function() {
  //クリックしたときのファンクションをまとめて指定
  $('.under_tab li').click(function(){
    //.index()を使いクリックされたタブが何番目かを調べ、
    //indexという変数に代入します。
    var index = $('.under_tab li').index(this);
    //コンテンツを一度消して、すべて非表示にし、
    $('.under_content li').removeClass('hide');
    $('.under_content li').css('display','none');
    //クリックされたタブと同じ順番のコンテンツを表示します。
    $('.under_content li').eq(index).css('display','block');
    //一度タブについているクラスselectを消し、
    $('.under_tab li').removeClass('select');
    //クリックされたタブのみにクラスselectをつけます。
    $(this).addClass('select')
  });
});