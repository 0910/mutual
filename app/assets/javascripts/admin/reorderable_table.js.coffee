class Admin.ReorderableTable
  constructor: (selector) ->
    $(selector).find("tbody").sortable
      items:  "tr"
      handle: ".js-reorder-handle"
      update: @_sendPositions

  _calculatePositions: (sortable) ->
    # Sortable uses ids by default for serialisation
    for itemId, index in $(sortable).sortable("toArray")
      # ActiveAdmin sets the id to the form "underscored_classname_id"
      id:    itemId.split("_").pop()
      order: index + 1

  _sendPositions: (event) =>
    positions = items: @_calculatePositions(event.target)

    $.ajax
      url:         "#{window.location.pathname}/reorder"
      method:      "PATCH"
      dataType:    "json"
      contentType: "application/json"
      data:        JSON.stringify(positions)

$ ->
  new Admin.ReorderableTable(".index_table")