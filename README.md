# [Feedr](https://github.com/bevry/feedr) Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/docpad/docpad-plugin-feedr/master.svg)](http://travis-ci.org/docpad/docpad-plugin-feedr "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-feedr.svg)](https://npmjs.org/package/docpad-plugin-feedr "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-feedr.svg)](https://npmjs.org/package/docpad-plugin-feedr "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/docpad/docpad-plugin-feedr.svg)](https://david-dm.org/docpad/docpad-plugin-feedr)
[![Dev Dependency Status](https://img.shields.io/david/dev/docpad/docpad-plugin-feedr.svg)](https://david-dm.org/docpad/docpad-plugin-feedr#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


This plugin is able to pull in remote json and xml feeds, convert them to JSON data, and expose them to `@feedr.feeds[feedName]` for your templates, via the [Feedr](https://github.com/bevry/feedr) module.


## Install

``` bash
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

<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/docpad/docpad-plugin-feedr/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/docpad/docpad-plugin-feedr/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-feedr/commits?author=balupton)
- [Zearin](https://github.com/Zearin) — [view contributions](https://github.com/docpad/docpad-plugin-feedr/commits?author=Zearin)

[Become a contributor!](https://github.com/docpad/docpad-plugin-feedr/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

- Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

and licensed under:

- The incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://opensource.org/licenses/mit-license.php)

<!-- /LICENSE -->


