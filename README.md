# Feedr Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/docpad/docpad-plugin-feedr.png?branch=master)](http://travis-ci.org/docpad/docpad-plugin-feedr "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-feedr.png)](https://npmjs.org/package/docpad-plugin-feedr "View this project on NPM")
[![Gittip donate button](http://badgr.co/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](https://raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

This plugin is able to pull in remote json and xml feeds, convert them to JSON data, and expose them to `@feedr.feeds[feednName]` for your templates.


## Install

```
docpad install feedr
```


## Usage

### Setup

First we have to tell Feedr which feeds it should retrieve, you can do this by adding the following to your website's docpad configuration file:

``` coffeescript
plugins:
	feedr:
		feeds:
			twitter:
				url: "https://api.twitter.com/1/statuses/user_timeline.json?screen_name=balupton&count=20&include_entities=true&include_rts=true"

			someOtherFeedName:
				url: "someOtherFeedUrl"
```

Feedr can also clean up responses like `"key": {"_content": "the actual value"}` (as used on Flickr) to the cleaner `"key": 'the actual value"`. To enable this set `clean` to `true` inside your feed configuration like so:

``` coffeescript
flickrUser:
	url: "http://api.flickr.com/services/rest/?method=flickr.people.getInfo&api_key=#{FLICKR_API_KEY}&user_id=#{FLICKR_USER_ID}&format=json&nojsoncallback=1"
	clean: true
```

### Rendering

Then inside your templates, we would do something like the following to render the items:

- Using [Eco](https://github.com/sstephenson/eco)

	``` coffeescript
	<ul>
		<% for tweet in @feedr.feeds.twitter: %>
			<% continue  if tweet.in_reply_to_user_id %>
			<li datetime="<%=tweet.created_at%>">
				<a href="https://twitter.com/#!/<%=tweet.user.screen_name%>/status/<%=tweet.id_str%>" title="View on Twitter">
					<%=tweet.text%>
				</a>
			</li>
		<% end %>
	</ul>
	```

- Using [CoffeeKup](http://coffeekup.org/)

	``` coffeescript
	ul ->
		for tweet in @feedr.feeds.twitter
			continue  if tweet.in_reply_to_user_id
			li datetime: tweet.created_at, ->
				a href: "https://twitter.com/#!/#{tweet.user.screen_name}/status/#{tweet.id_str}", title: "View on Twitter", ->
					tweet.text
	```


## History

You can discover the history inside the `History.md` file


## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012+ [Bevry Pty Ltd](http://bevry.me)