# History

## v2.14.0 2018 June 25
- Updated dependencies
- Minimum supported node version is now v4 due to [nested dependency requirements](https://github.com/bevry/feedr/blob/master/HISTORY.md#v300-2018-january-25)

## v2.13.0 2018 June 25
- Now compiled with CoffeeScript v2
- Updated base files

## v2.12.0 2017 March 31
- Update base files

## v2.11.0 2015 March 5
- Updated dependencies

## v2.10.0 2014 August 8
- Updated dependencies

## v2.9.0 2014 August 8
- Updated dependencies

## v2.8.0 2014 June 1
- Updated dependencies

## v2.7.0 2013 January 10
- Updated dependencies

## v2.6.0 2013 October 2
- Updated dependencies

## v2.5.0 2013 May 27
- Updated dependencies

## v2.4.2 2013 March 7
- Repackaged

## v2.4.1 2013 February 1
- Updated dependencies

## v2.4.0 2012 December 2
- Updated dependencies

## v2.3.0 2012 December 2
- Updated dependencies

## v2.2.0 2012 October 22
- Abstracted out non docpad specific functionality into new [feedr](https://github.com/bevry/feedr) project
	- See the new configuration options [here](https://github.com/bevry/feedr#configuration)

## v2.1.0 2012 August 19
- Better handling of jsonp responses
- Better handling of bad json responses
- `"key": {"_content": "the actual value"}` inside responses will be converted to `"key": 'the actual value"` if `clean` is set to `true` inside the feed configuration

## v2.0.2 2012 August 10
- Re-added markdown files to npm distribution as they are required for the npm website
- Fixed a caching conflict issue when two feeds have the same name across different projects
- Added the configuration options `refreshCache` and `cacheTime`

## v2.0.1 2012 July 8
- Removed underscore dependency
- Fixed path exists warning
- Will now store cached files inside the operating systems actual tmp path, instead of always assuming it is `/tmp`
	- Customisable by the `tmpPath` configuration option

## v1.0.0 2012 April 14
- Updated for DocPad v5.0

## v0.2.0 2012 April 6
- Now exposes `@feedr.feeds` to the `templateData` instead of `@feeds`

## v0.1.0 2012 March 23
- Initial working version for [Benjamin Lupton's Website](https://github.com/balupton/balupton.docpad)
