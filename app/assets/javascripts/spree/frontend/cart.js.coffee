justDoIt = ->

  link_to_cart = document.querySelector('#link-to-cart')

  # window.responseXML = this.responseXML


  fragment = this.responseXML.body.innerHTML

  console.log fragment


  document.querySelector('#link-to-cart').innerHTML = fragment

  # document.querySelector('#feed').insertBefore(this.responseXML.querySelector('.feed-group'), document.querySelector('.pagination'))




Spree.fetch_cart = ->
  true

  url = Spree.routes.cart_link

  xhr = new XMLHttpRequest()

  xhr.onload = justDoIt

  xhr.open "GET", url
  xhr.responseType = "document"
  xhr.send()


  # Report errors if they happen
  xhr.addEventListener "error", (e) ->
    console "Error: " + e + " Could not load url."



  # $.ajax
  #   url: Spree.routes.cart_link,
  #   success: (data) ->
  #     $('#link-to-cart').html data





document.addEventListener "DOMContentLoaded", ->

  line_items = document.querySelector('#line_items')

  if line_items
    document.querySelector('#line_items').addEventListener 'click', (event)->
      # event.preventDefault()
      # event.stopPropagation()

      if event.target.nodeName.toLowerCase() == 'img'
        event.target.parentNode.parentNode.parentNode.querySelector('input.line_item_quantity').value = 0

        document.forms['update-cart'].submit()


        console.log event.target.nodeName

      else
        console.log event.target.nodeName.toLowerCase()
      # console.log this

      # ($ 'form#update-cart a.delete').show().one 'click', ->
    , false

    document.forms['update-cart'].addEventListener 'submit', (event)->
      document.querySelector('#update-button').disabled = true



  Spree.fetch_cart()