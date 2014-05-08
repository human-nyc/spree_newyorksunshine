class ProductImages
  constructor: (selector) ->
    @product_images = document.querySelector(selector)
    @main_image_wrapper = @product_images.querySelector('#main-image')
    @product_thumbnails = @product_images.querySelector('#product-thumbnails')
    @zoom = @main_image_wrapper.querySelector('#zoom')
    @sharer = $('#social.product')

    @slideshow_length = @main_image_wrapper.querySelectorAll('img').length

    @zoom.addEventListener 'click', (event)=>
      event.preventDefault()
      event.stopPropagation()
      @product_images.classList.toggle('zoomed')
      # @sharer.toggleClass('hidden')

    if @product_thumbnails
      @product_thumbnails.addEventListener 'click', @goToSlide

    @main_image_wrapper.addEventListener 'click', @goToNext

    # Svpply trigger for custom icon in product sharing
    $('.svpply.icon').on 'click', (e) ->
      e.preventDefault()
      $('.svpply_button').click()
      $('html, body').animate
        scrollTop: $('#main-image').offset().top - 240
      , 600


  goToSlide: (event) =>
    if matchMedia("(min-width: 768px)").matches
      event.preventDefault()

    if event.target.classList.contains('thumbnail')

      @current_slide_index = [].indexOf.call(event.target.parentNode.parentNode.children, event.target.parentNode)

      @render()


  goToNext: (event) =>
    event.preventDefault()

    @current_slide_index = if @current_slide_index < @slideshow_length - 1 then @current_slide_index + 1 else 0

    @render()


  render: () =>
    if @main_image_wrapper.querySelector('.current')
      @main_image_wrapper.querySelector('.current').classList.remove('current')

    @main_image_wrapper.children.item(@current_slide_index).classList.add('current')


document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#product-images') != null)
    product_thumbnails = new ProductImages('#product-images')
