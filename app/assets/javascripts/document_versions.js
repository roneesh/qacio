/*!
 * jQuery Annotation Plugin
 * http://www.zurb.com/playground/javascript-annotation-plugin
 *
 * Copyright 2010, ZURB
 * Released under the MIT License
 */


$ ->

  $("#image-area").on "click", (e) ->
    console.log e
    document_id = document_version_id
    unless $(e.target).hasClass("black") 
      commentleft = e.offsetX + 35;
      commenttop = e.offsetY + 35;
      $("#image-area").append("<div class='black' style='left: #{e.offsetX}px; top: #{e.offsetY}px;'>#{annotation_count+1}</div>")
      annotation_count += 1
      $("body").append("<form><input type='text' class='comment-entry' style='left: #{commentleft}px; top: #{commenttop}px;'></input></form>")
      console.log($.ajax({
        url: "/create_annotation",
        type: "POST",
        data: { id : document_version_id, content: "RONEESH" }
      }))


  $("#image-area").on "click", ".black", (e) ->
    annotation_count -= 1
    $(e.target).remove()