$ ->
  $('body').append $('<h1 />',{class:"header", text:"This entire page is coffeescript!"})

  $('body').append $('<div />',{class:"page-form", id:"page-form"})
  
  buildPageForm = ->
    $('.page-form').append $('<label />',{class:"element-select-label",text:"Choose an element to add: "})
    $theSelect = $('<select />',{class:"new_element"})
    $theSelect.append $("<option />", {value: "label", selected: "selected", text: "Label"})
    $theSelect.append $("<option />", {value: "h1", text: "Header 1"})
    $theSelect.append $("<option />", {value: "h2", text: "Header 2"})
    $theSelect.append $("<option />", {value: "img", text: "Image"})
    $theSelect.append $("<option />", {value: "input", text: "Input Field"})
    $theSelect.append $("<option />", {value: "button", text: "Button"})
    $theSelect.append $("<option />", {value: "select", text: "Select"})
    $('.page-form').append $theSelect
    $theSelect.on "change", ->
    	setSecondaryInfo this.value

  setSecondaryInfo = (element) ->
  	$('.secondary-info').remove()
  	$('.page-form').append $('<div />',{class:'secondary-info'})
  	switch element
    	when "label"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-label',text:' Enter Text for label: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "h1"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-h1',text:' Enter Text for Heading 1: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "h2"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-h2',text:' Enter Text for Heading 2: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "img"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-img',text:' Enter URL for Image: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "input"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-input',text:' Enter Placeholder Text for Input: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "button"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-button',text:' Enter Label for Button: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
    	when "select"
    		$('.secondary-info').append $('<label />', {class:'secondary-info-select',text:' Enter Options separated by Commas: '})
    		$('.secondary-info').append $('<input />', {class:'secondary-info',type:'text'})
   		else
   			$('.secondary-info').append 'Something Went Wrong!'

	  $('input.secondary-info').on 'input', ->
	   	if this.value == ""
	   		$('button.make-element').off()
	   		$('button.make-element').remove()
	   	else if !$('button.make-element').length
	   		console.log "Here We Are"
	   		$('.page-form').append $('<button />',{class:'make-element',text:'Make Element'})
				$('button.make-element').on "click", ->
					makeElement()
  
  makeElement = ->
  	$('body').append 'Now We making ELEMENTS!'

  buildPageForm()
