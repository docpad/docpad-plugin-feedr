# [Feedr](https://github.com/bevry/feedr) Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.org/docpad/docpad-plugin-feedr" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/docpad/docpad-plugin-feedr/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/docpad-plugin-feedr" title="View this project on NPM"><img src="https://img.shields.io/npm/v/docpad-plugin-feedr.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/docpad-plugin-feedr" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/docpad-plugin-feedr.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/docpad/docpad-plugin-feedr" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/docpad/docpad-plugin-feedr.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/docpad/docpad-plugin-feedr#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/docpad/docpad-plugin-feedr.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>
<br class="badge-separator" />
<span class="badge-slackin"><a href="https://slack.bevry.me" title="Join this project's slack community"><img src="https://slack.bevry.me/badge.svg" alt="Slack community badge" /></a></span>

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

<h2>History</h2>

<a href="https://github.com/docpad/docpad-plugin-feedr/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/docpad/docpad-plugin-feedr/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-feedr/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-feedr">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-feedr/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-feedr">view contributions</a></li>
<li><a href="https://github.com/Zearin">Zearin</a> — <a href="https://github.com/docpad/docpad-plugin-feedr/commits?author=Zearin" title="View the GitHub contributions of Zearin on repository docpad/docpad-plugin-feedr">view contributions</a></li></ul>

<a href="https://github.com/docpad/docpad-plugin-feedr/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://bevry.me">Bevry Pty Ltd</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
