# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	Feedr = null
	feedr = null

	# Define Plugin
	class FeedrPlugin extends BasePlugin
		# Name
		name: 'feedr'

		# Configuration
		config:
			xml2jsOptions: '0.1'

		# Render Before
		# Read the feeds here
		renderBefore: ({templateData}, next) ->
			# Prepare
			docpad = @docpad
			config = @config
			config.feeds or= {}
			templateData.feedr or= {}
			templateData.feedr.feeds or= {}

			# Prepare feedr
			unless Feedr?
				{Feedr} = require('feedr')
			unless feedr?
				config.log = docpad.log
				config.logError = docpad.error
				feedr = new Feedr(config)

			# Read the feeds and add them to the templateData
			feedr.readFeeds config.feeds, (err,result) ->
				return next(err)  if err
				templateData.feedr.feeds = result
				return next()

			# Chain
			@
