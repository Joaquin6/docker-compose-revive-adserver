/*
This example shows how to include videojs-contrib-ads as a module import
in an ad plugin. It uses webpack to achieve this.
To build this example:
* follow instructions in the documentation to build videojs-contrib-ads
  * http://videojs.github.io/videojs-contrib-ads/developer/getting-started.html
* cd to this directory
* npm install webpack -g
* npm install webpack-command -g
* webpack ./entry.js --output=./public/bundle.js
*/

import videojs from 'video.js';
import 'videojs-contrib-ads';

videojs.registerPlugin('reviveAdsPlugin', function() {
  this.ads(); // initialize videojs-contrib-ads

  // Ad plugin logic goes here
  this.debug(true);
});

const player = videojs('#player');

player.reviveAdsPlugin();

console.log('player.debug', player.debug);
console.log('player.ads', player.ads);

// request ads whenever there's new video content
player.on('contentchanged', function() {
  // in a real plugin, you might fetch new ad inventory here
  player.trigger('adsready');
});

player.on('readyforpreroll', function() {
  player.ads.startLinearAdMode();
  // play your linear ad content
  // in this example, we use a static mp4
  player.src('kitteh.mp4');

  // send event when ad is playing to remove loading spinner
  player.one('adplaying', function() {
    player.trigger('ads-ad-started');
  });

  // resume content when all your linear ads have finished
  player.one('adended', function() {
    player.ads.endLinearAdMode();
  });
});

// in a real plugin, you might fetch ad inventory here
player.trigger('adsready');
