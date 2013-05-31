class Carousel

  constructor: (@selector) ->

    @slide_count = $(@selector).length


    $('body').on 'keydown', (event) =>

      # Estimate which slide is nearest based on current window scroll position
      @slide_offset = parseInt(document.body.scrollTop/window.innerHeight)

      # Whichever slide is more than half-revealed in the window prevails
      @slide_offset++ if (document.body.scrollTop % window.innerHeight) > window.innerHeight/2

      switch event.keyCode
        when 39, 40 # right or down
          @next()
        when 37, 38 # left or up
          @prev()

  next: ->
    @slide_offset++ unless @slide_offset is (@slide_count-1)
    @animate()

  prev: ->
    @slide_offset-- unless @slide_offset is 0
    @animate()

  animate: ->
    $("html, body").animate
      scrollTop: window.innerHeight*@slide_offset

window.Carousel = Carousel

$ ->
  window.carousel = new Carousel('#slides > li')

