$ ->

  $("#image-area").on "click", (e) ->
    console.log e
    document_id = document_version_id
    unless $(e.target).hasClass("black") 
      commentleft = e.offsetX + 35;
      commenttop = e.offsetY + 35;
      $("#image-area").append("<div class='black' style='left: #{e.offsetX}px; top: #{e.offsetY}px;'>#{annotation_count+1}</div>")
      annotation_count += 1
      form = "<form id='#{annotation_count}' class='comment' action='#'>"
      text_input = "<input type='text' class='comment-entry' placeholder='Annotation #{annotation_count}' style='left: #{commentleft}px; top: #{commenttop}px;'>"
      submit = "<input type='submit'>"
      submissions = "<input type='submit class='submit-btn'>"
      cancel = "<button id='#{annotation_count}' class='cancel-btn'>Cancel</button>"
      closers = "</form>"
      $('body').append(form+text_input+submit+cancel+closers)
      # $("body").append("<form id='#{annotation_count}' class='comment'><input type='text' class='comment-entry' style='left: #{commentleft}px; top: #{commenttop}px;'></input></form>")
      # console.log($.ajax({
      #   url: "/create_annotation",
      #   type: "POST",
      #   data: { id : document_version_id, content: "RONEESH" }
      # }))


  $("#image-area").on "click", ".black", (e) ->
    annotation_count -= 1
    $(e.target).remove()

  $('.cancel-btn').on "click", ->
    $('this').parent.remove()

  $('.submit-btn').on "click", ->
     console.log($.ajax({
        url: "/create_annotation",
        type: "POST",
        data: { id : document_version_id, content: "RONEESH" }
      }))
