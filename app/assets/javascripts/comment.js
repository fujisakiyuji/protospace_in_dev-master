$(function(){
  function buildHTML(comment){
    var html = `<div class="table">
                  <p>
                    <strong>
                      <a href=/users/${comment.user_id}>${comment.user_name}:</a>
                    </strong>
                    ${comment.text}
                  </p>
                  <p class="delete">
                    <a href="#" id="#comment-delete">
                      delete
                    </a>
                  </p>
                  <p class="edit">
                    <a href="#" id="#comment-edit">
                      edit
                    </a>
                  </p>
                </div>
                `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.textbox').val('')
    })
    // .fail(function(){
    //   alert('error')
    // })
  })
});
