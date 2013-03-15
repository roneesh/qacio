$ ->

  commentleft = 0
  commenttop = 0
  content = " "
  number_to_remove = 0
  id = 0
  to_rem_class = ""
  to_rem_objects = ""

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
      data: { id : document_version_id, content: annotation_text, number: annotation_count, xcoor: commentleft, ycoor: commenttop }
    }))
    # $("<div><p>Hello</p></div>").appendTo("#body")
    if annotation_text != ""
      $("#image-area").append("<div anno='#{annotation_count}' id='#{annotation_count}' class='#{annotation_count} black' style='left: #{commentleft}px; top: #{commenttop}px;'><p>#{annotation_count}</p></div>")
      $('.annotation-list').append("<li class='#{annotation_count}'>Annotation number #{annotation_count} <br/> '#{annotation_text}'<br/><a id='#{annotation_count}' class='#{annotation_count}' href='#'>Delete</a></li>")

# Deletes an annotation bubble if clicked
  # $("#image-area").on "click", ".black", (e) ->
  #   console.log(e)
  #   number_to_remove = $(e.target).attr("id")
  #   $(".\#{number_to_remove}").remove()
  #   console.log($.ajax({
  #     url: "/delete_annotation",
  #     type: "DELETE"
  #     data: {number: number_to_remove}
  #   }))

# Delete's annotation if Delete link clicked
  $('#comment-area').on "click", 'a', (e) ->
    console.log e
    to_rem_class = $(e.target).attr('class')
    to_rem_objects = ".#{to_rem_class}"
    $("#{to_rem_objects}").remove()
    console.log($.ajax({
      url: "/delete_annotation/#{to_rem_class}",
      type: "DELETE"
      data: {number: to_rem_class}
    }))

