// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery/dist/jquery.js
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require tag-it
//= require_tree .

// ユーザーアイコンの編集デザイン
$(function(){
  $fileField = $('#file')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// フラッシュメッセージフェードアウト
$(function(){
  setTimeout("$('.time-limit').fadeOut('slow')", 2500)
})
// 検索フォーム
$(function(){
  $('.search_btn').on('click',function(){
  $(".search_open, .search_close").toggleClass("search_open search_close");
    $('.search').toggleClass('search_active');
    $('.go_btn').toggleClass('search_active_go_btn');
  });
  });