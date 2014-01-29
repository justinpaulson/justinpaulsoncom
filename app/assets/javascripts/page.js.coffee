window.setSecondaryInfo = (element) ->
  switch element
    when 'label'
      $('.secondary-info-label').text ' Enter Text for label: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when 'h1'
      $('.secondary-info-label').text ' Enter Text for Heading 1: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when "h2"
      $('.secondary-info-label').text ' Enter Text for Heading 2: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when "img"
      $('.secondary-info-label').text ' Enter URL for Image: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when "input"
      $('.secondary-info-label').text ' Enter Placeholder Text for Input: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when "button"
      $('.secondary-info-label').text ' Enter Label for Button: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    when "select"
      $('.secondary-info-label').text ' Enter Options separated by Commas: '
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()
    else
      $('.secondary-info-label').attr text:' Something went wrong!'
      $('.secondary-info-input').val ''
      $('.secondary-info-input').show()

window.makeElement = ->
  $('main-element').append $("#{$('.new-element').value}")

$ ->
  $('body').append $('<h1 />',{class:"header", text:"This entire page is coffeescript!"})
  $('body').append $('<div />',{class:"page-form", id:"page-form"})
  $theSelect = $('<select />',{class:'new-element'})
  $theSelect.append $("<option />", {value: "label", selected: "selected", text: "Label"})
  $theSelect.append $("<option />", {value: "h1", text: "Header 1"})
  $theSelect.append $("<option />", {value: "h2", text: "Header 2"})
  $theSelect.append $("<option />", {value: "img", text: "Image"})
  $theSelect.append $("<option />", {value: "input", text: "Input Field"})
  $theSelect.append $("<option />", {value: "button", text: "Button"})
  $theSelect.append $("<option />", {value: "select", text: "Select"})
  $('.page-form').append $('<label />',{class:'element-select-label',text:'Choose an element to add: '})
  $('.page-form').append $theSelect
  $('.page-form').append $('<div />',{class:'secondary-info'})
  $('.secondary-info').append $('<label />', {class:'secondary-info-label',text:' Enter Text for label: '})
  $('.secondary-info').append $('<input />', {class:'secondary-info-input',type:'text'})
  $('.page-form').append $('<button />',{class:'make-element',text:'Make Element'})
  $('.make-element').hide
  $('body').append $('<div />',{class:'main-element'})

  $('.new-element').on 'change', ->
    window.setSecondaryInfo this.value

  $('.secondary-info').on 'input', ->
    if this.val == ''
      $('.make-element').hide
    else
      $('.make-element').show

  $('.make-element').on 'click', (e) ->
    e.preventDefault()
    window.makeElement()