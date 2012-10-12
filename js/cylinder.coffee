#
# Name    : Cylinder
# Author  : Thomas Stachl, http://stachl.me/, @thomasstachl
# Version : 1.0
# Repo    : git@github.com:tstachl/cylinder.git
# Website : https://github.com/tstachl/cylinder
#

jQuery ->
  $.cylinder = (element, options) ->
    # current state
    state = ''

    # plugin settings
    @settings = {}

    # jQuery version of DOM element attached to the plugin
    @$element = $ element

    # set current state
    @setState = (_state) -> state = _state

    #get current state
    @getState = -> state

    # get particular plugin setting
    @getSetting = (key) ->
      @settings[key]

    # call one of the plugin setting functions
    @callSettingFunction = (name, args = []) ->
      @settings[name].apply this, args

    @init = ->
      @settings = $.extend yes, {}, @defaults, options
      
      @paper = Raphael element, @settings.width, @settings.height
      @paper.setViewBox 0, 0, 110, 235, yes
      @paper.rect(0, 21, 110, 193).attr @settings.colors.container
      @paper.ellipse(55, 213, 55, 21).attr @settings.colors.container
      @paper.ellipse(55, 23, 55, 21).attr @settings.colors.container
      
      @fluid = @paper.rect(0, 193, 110, 0).attr @settings.colors.fluid
      @paper.ellipse(55, 213, 55, 21).attr @settings.colors.fluid
      @fluidTop = @paper.ellipse(55, 213, 55, 21).attr @settings.colors.accent
      @glow = @paper.path('M 12 35.665 L 12 211 C 12 211.5 17.125 214.375 23.125 216.25 C 28.294 217.8653 36.875 219.25 37 219 L 37 42.75 C 28.4056 41.56 19.8109 39.536 12 35.665 L 12 35.665 Z')
      @glow.attr @settings.colors.glow
      
      @paper.ellipse(55, 23, 55, 21).attr $.extend { 'fill-opacity': .4 }, @settings.colors.container
      
      @_value @settings.value
      
      @setState 'ready'
    
    @_value = (value) ->
        height = 190 * parseFloat(value)
        y = 210 - height

        @fluid.attr
          height: height
          y: y
        @fluidTop.attr 'cy', y
    
    @value = (newValue) ->
      unless @settings.value == newValue
        @_value @settings.value = newValue

    # initialise the plugin
    @init()

    # make the plugin chainable
    @

  # default plugin settings
  $.cylinder::defaults =
    colors:
      container:
        fill: '#e5e5e5'
        stroke: '#dcdada'
        'stroke-width': 1
      fluid:
        fill: '#0051A6'
        stroke: '#003974'
        'stroke-width': 1
      accent:
        fill: '#5d98d7'
        stroke: '#4483c4'
        'stroke-width': 1
      glow:
        fill: '#ffffff'
        stroke: '#e9e9e9'
        'stroke-width': 1
        opacity: .4
    height: 235
    width: 110
    value: .3

  $.fn.cylinder = (options) ->
    args = Array.prototype.slice.call(arguments, 1)
    @each ->
      if $(@).data('cylinder') is undefined
        plugin = new $.cylinder(@, options)
        $(@).data('cylinder', plugin)
      else
        if $(@).data('cylinder')[options]
          $(@).data('cylinder')[options].apply($(@).data('cylinder'), args)