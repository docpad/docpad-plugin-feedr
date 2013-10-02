# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	feedr = null

	# Define Plugin
	class FeedrPlugin extends BasePlugin
		# Plugin name
		name: 'feedr'

		# Render Before
		# Read the feeds here
		renderBefore: ({templateData}, next) ->
			# Prepare
			docpad = @docpad
			config = @getConfig()

			# Extend the template data
			templateData.feedr or= {}
			templateData.feedr.feeds or= {}

			# Load feedr
			unless feedr?
				feedrOptions = config.feedrOptions or {}
				feedrOptions.log ?= docpad.log
				feedrOptions.xml2jsOptions ?=
					explicitCharkey: false
					trim: true
					normalize: true
					normalizeTags: false
					attrkey: "@"
					charkey: "#"
					explicitArray: false
					ignoreAttrs: false
					mergeAttrs: false
					explicitRoot: false
					validator: null
					xmlns: false
					explicitChildren: false
					childkey: '@@'
					charsAsChildren: false
					async: false
					strict: true
				feedr = require('feedr').create(feedrOptions)

			# Read the feeds and add them to the templateData
			feedr.readFeeds config.feeds, (err,result) ->
				return next(err)  if err
				templateData.feedr.feeds = result
				return next()

			# Chain
			@