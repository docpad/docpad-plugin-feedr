ul ->
	for entry in @feedr.feeds.github.entry
		li datetime: entry.updated, ->
			a href: entry.link['@'].href, title: "View on Github", ->
				entry.title