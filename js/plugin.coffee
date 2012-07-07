#
# CoffeeScript jQuery Plugin Boilerplace
# Author:   Matthieu Aussaguel, http://www.mynameismatthieu.com, @mattaussaguel
# Version:  1.3 Stable
# Website:  http://minijs.github.com/miniBoilerplate/
#

jQuery ->
  $.pluginName = ( element, options ) ->
    # default plugin settings
    @defaults = 
      message: 'hello word'  # option description
      callback: ->           # callback description

    # current state
    @state = ''

    # plugin settings
    @settings = {}

    # jQuery version of DOM element attached to the plugin
    @$element = $ element

    # set current state
    setState = ( @state ) ->

    #get current state
    @getState = -> state

    # get particular plugin setting
    @getSetting = ( settingKey ) ->
      @settings[settingKey]

    # call one of the plugin setting functions
    @callSettingFunction = ( functionName, args = [] ) ->
      @settings[functionName].apply( this, args )

    @init = =>
      @settings = $.extend( {}, @defaults, options )
      @callSettingFunction( 'callback', [ @$element, @getSetting( 'message' ) ] ) 

    # initialise the plugin
    @init()

    this

  $.fn.pluginName = ( options ) ->
    this.each ->
      if $( this ).data( 'pluginName' ) is undefined
        plugin = new $.pluginName( this, options )
        $( this).data( 'pluginName', plugin )