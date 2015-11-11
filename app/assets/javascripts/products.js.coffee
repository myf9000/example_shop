doSearch = (term, location) ->
  if term.length > 0
  	window.location.href = 'products?utf8=✓&search=' + term + '&commit=Search'
  else
  	window.location.href = 'products?utf8=✓&search&commit=Search'
  return

$ ->
  didSelect = false
  $('#titles').autocomplete(
    source: gon.titles
    minLength: 1
    search: (event, ui) ->
      didSelect = false
      true
    select: (event, ui) ->
      if ui.item
        didSelect = true
        doSearch ui.item.label, ui.item.city
      return
  ).keypress (e) ->
    if e.keyCode == 13
      if !didSelect
        doSearch $('#titles').val()
    return
  return