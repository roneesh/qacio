$ ->

  commentleft = 0
  commenttop = 0
  content = " "

  $("#image-area").on "click", (e) ->
    console.log e
    document_id = document_version_id
    unless $(e.target).hasClass("black") || $(e.target).hasClass("comment-entry") || $(e.target).hasClass("annotate-btn")
      commentleft = e.offsetX - 11
      commenttop = e.offsetY - 11
      form = "<form id='#{annotation_count}' style='left: #{e.offsetX}px; top: #{e.offsetY}px;' class='image-comment' action='#'>"
      text_input = "<input type='text' id='text' class='comment-entry' placeholder='Annotation here' style='left: #{commentleft}px; top: #{commenttop}px;'>"
      submit = "<input type='submit' id='submit' class='submit-btn annotate-btn'>"
      cancel = "<button id='cancel' class='annotate-btn cancel-btn'>Cancel</button>"
      closers = "</form>" 
      $('.image-comment').remove()
      $("#image-area").append(form+text_input+submit+cancel+closers)

  $("#image-area").on "click", ".black", (e) ->
    annotation_count -= 1
    $(e.target).remove()
    console.log($.ajax({
      url: "/delete_annotation"
    }))

  $("#image-area").on "click", "#cancel", (e) ->
    $('.image-comment').remove()
    annotation_count -= 1

  $("#image-area").on "click", "#submit", (e) ->
    annotation_text = $('#text').val()
    $('.image-comment').remove()
    annotation_count += 1
    console.log($.ajax({
      url: "/create_annotation",
      type: "POST",
      data: { id : document_version_id, content: annotation_text }
    }))
    # $("<div><p>Hello</p></div>").appendTo("#body")
    if annotation_text != ""
      $("#image-area").append("<div class='black' style='left: #{commentleft}px; top: #{commenttop}px;'></div>")
      $('.annotation-list').append("<li>#{annotation_text}</li>")

