$ ->
  titles = gon.titles
  $('#titles').autocomplete(
    source: titles
    minLength: 2).click ->
    $(this).autocomplete 'search'
    return
  return
