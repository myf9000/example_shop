doSearch = (term, location) ->
  window.location.href = 'products?utf8=✓&search=' + term + '&commit=Search'
  return

$(document).ready ->
  $('#titles').autocomplete
    minLength: 1
    source: gon.titles
    select: (event, ui) ->
      doSearch ui.item.label, ui.item.city
      return
  return
