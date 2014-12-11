ready = undefined
ready = ->
  $(".answer-hidden-field").each (index) ->
    $(this).parent(".question").find("[data-answer-id='" + $(this).val() + "']").addClass "selected"  if $(this).val() isnt ""
    return

  $(".answer").on "click", ->
    $(this).siblings().removeClass "selected"
    $(this).addClass "selected"
    $("#answer_" + $(this).parents(".question").data("question-id")).val $(this).data("answer-id")
    return

  $("#new_response_set, #edit_response_set_17").submit ->
    errors = false
    $(".answer-hidden-field").each (index) ->
      if $(this).val() is ""
        errors = true
        false

    unless errors
      true
    else
      html_msg = "<div class=\"bs-callout bs-callout-danger alert alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h5>Please respond all the questions</h5></div>"
      $("#survey_container").prepend html_msg
      event.preventDefault()
    return

  return

$(document).ready ready
$(document).on "page:load", ready