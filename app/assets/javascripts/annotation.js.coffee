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

# Cancels the form
  $("#image-area").on "click", "#cancel", (e) ->
    $('.image-comment').remove()


# Creates annotation in db after user hits submit
  $("#image-area").on "click", "#submit", (e) ->
    annotation_text = $('#text').val()
    $('.image-comment').remove()
    annotation_count += 1
    console.log($.ajax({
      url: "/create_annotation",
      type: "POST",
      data: { id : document_version_id, content: annotation_text, number: annotation_count }
    }))
    # $("<div><p>Hello</p></div>").appendTo("#body")
    if annotation_text != ""
      $("#image-area").append("<div id='#{annotation_count}' class='black' style='left: #{commentleft}px; top: #{commenttop}px;'></div>")
      $('.annotation-list').append("<li id='#{annotation_count}'>#{annotation_count}. #{annotation_text} <br/><a class='anno_delete' href='#'>Delete</a></li>")

# Removes annotation bubble if clicked
  $("#image-area").on "click", ".black", (e) ->
    $(e.target).remove()
    console.log($.ajax({
      url: "/delete_annotation",
      type: "DELETE"
    }))

# Delete's annotation if Delete link clicked
  # $('.anno_delete').on "click", (e) ->
  #   $()
