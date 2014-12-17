$ ->
  $('#locale-select .locale-switch').click ->
    $.ajax(
      type: 'POST'
      url: $('#locale-select').attr('href')
      data:
        locale: $(this).attr('locale')
        authenticity_token: $('#locale-select input[name="authenticity_token"]').val()
    ).done ->
      window.location.reload()