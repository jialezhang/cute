window. App =
  alert : (msg,to) ->
    $(".alert").remove()
    $(to).before("<div class='alert'><a class='close' href='#' data-dismiss='alert'>X</a>#{msg}</div>")
    
  like: (el) ->
    El = $(el)
    photol_id = El.attr("data-id");
    console.log(photol_id)
    if  El.attr("data-status") != "liked"
      $.ajax 
        url: "/likes",
        type: "POST",
        data:
          id: photol_id
        success : console.log("success")
        error : console.log("error")
        statusCode:
          500: ->
            console.log('500')
          404: ->
            console.log("404")

      $("div",el).attr("class","liked")
      $(el).attr("data-status", "liked")

    else
      Urll = "/likes/"+photol_id
      # console.log(photol_id)
      $.ajax
        url: Urll,
        type: "DELETE",
        data:
          id: photol_id
        statusCode:
          500: ->
            console.log('500')
          404: ->
            console.log("404")

      $.success = console.log("delete success")
      $("div",el).attr("class","like")
      El.attr("data-status","like")



