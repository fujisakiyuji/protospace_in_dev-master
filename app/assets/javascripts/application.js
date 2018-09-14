// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .



$(function() {
  $("#like-button").on("click", function(){
  var $id = $(".idid").text();
  var $likeSum = $("#like-sum");
  var $heart = $("#like-button img");
  var $current_url = location.href;
  like_function($id, $(this), $likeSum, $heart, $current_url);
  });
});

function like_function(id, likeBtn, likeSum, heartImg, current_url) {
  if (likeBtn.hasClass("increment-button")) {
    $.ajax({url: current_url + "/likes", type: "post", data: {prototype_id: id, dataType: "json"}})
    .done(function(data){
      likeBtn.removeClass("increment-button").addClass("decrement-button")
      heartImg.attr("src", "/assets/icon_heart_red.svg")
      likeSum.text(data)
    }).fail(function(XMLHttpRequest) {
      if(XMLHttpRequest.status == "401" ){
        window.location.href = "/users/sign_in"
      } else {
        alert(XMLHttpRequest.status + "エラー")
      }
    })
  } else {
    $.ajax({url: current_url + "/likes/" + id, type: "delete", data: {prototype_id: id, dataType: "json"}})
    .done(function(data){
      likeBtn.removeClass("decrement-button").addClass("increment-button")
      heartImg.attr("src", "/assets/icon_heart.svg")
      likeSum.text(data)
    }).fail(function(XMLHttpRequest) {
      alert(XMLHttpRequest.status + "エラー")
    })
  }
}
