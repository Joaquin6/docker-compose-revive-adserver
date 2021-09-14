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

function getCurrentTimeSring() {
  const timestamp = new Date();
  let h = timestamp.getHours() + '';
  while(h.length < 2) {
    h = '0' + h;
  }

  let m = timestamp.getMinutes() + '';
  while(m.length < 2) {
    m = '0' + m;
  }

  let s = timestamp.getSeconds() + '';
  while(s.length < 2) {
    s = '0' + s;
  }

  let mm = timestamp.getMilliseconds() + '';
  while(mm.length < 3) {
    mm = '0' + mm;
  }

  return `${h}:${m}:${s}.${mm}`;
}

// PLAYER STUFF

// Default videojs initialization options
const DEFAULT_VIDEOJS = {
  controls: true,
  muted: true,
  debug: true,
  sources: [{
    // src: 'https://content.demo1.nomad-cms.com/content/public/acera-one-direction-tea-travel-mug.mp4',
    src: '/videos/bbb_trailer.mp4',
    type: 'video/mp4'
  }],
  responsive: true,
  aspectRatio: '16:9',
  verbosity: 4
};

function onPlayerReady() {
  // TODO: Again because initialization options don't seem to work..
  this.ads({ debug: true, prerollTimeout: 60000, postrollTimeout: 10000 });

  // Add VAST plugin to videojs
  // http://blog.denivip.ru/demos/html5videovastplugin/response.xml?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&zones=pre-roll-0%3D11%7Cmid-roll-0%3D11%7Cmid-roll-1%3D11%7Cpost-roll-0%3D11&nz=1&format=vast&charset=UTF-8
  // http://adserver.revive.io:8000/www/delivery/fc.php?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&zones=pre-roll-0%3D2%7Cmid-roll-0%3D2%7Cmid-roll-1%3D2%7Cpost-roll-0%3D2&nz=1&format=vast&charset=UTF-8
  // const url = "http://adserver.revive.io:8000/www/delivery/fc.php?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&format=vast&nz=1&zones=post-roll%3D2"
  const url = "http://adserver.revive.io:8000/www/delivery/fc.php?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&zones=pre-roll-0%3D2%7Cmid-roll-0%3D2%7Cmid-roll-1%3D2%7Cpost-roll-0%3D2&nz=1&format=vast&charset=UTF-8"
  this.vast({
    url,
    // VAST url, use default if not set
    adTagUrl: url,
    // Always play the AD
    playAdAlways: true,
    // Wait 10 seconds before timing out
    adCancelTimeout: 60000
  });

  // Setup all event logs -> app.utils.js
  setupEventLogs(this);
}

function setupEventLogs(player) {
  // FIRST FRAME (KORMO)
  player.on('firstplay', () => {
    videojs.log('\'first-play\'');
    player.quartile = 0;
  });
  // player.on('vast.firstPlay', () => console.log('VAST', '\'first-play\''));

  player.on('vast.adStart', () => {
    player.ad = true;
    console.log('VAST', '\'ad-start\'')
  });

  // PLAY (KORMO) AD PLAY (KORMO)
  player.on('play', () => {
    if (player.ad) {
      console.log('VAST', '\'ad-play\'');
    } else videojs.log('\'play\'');
  });
  // PAUSE (KORMO) AD PAUSE (KORMO)
  player.on('pause', () => {
    if (player.ad) {
      console.log('VAST', '\'ad-pause\'');
    } else videojs.log('\'pause\'');
  });

  // CLICK (KORMO)
  // IMPRESSION (KORMO)
  // AD CLICK (KORMO)
  // AD IMPRESSION (KORMO)
  // DISPLAY CLICK (KORMO)

  // TIME (KORMO) QUARTILE (KORMO) ADTIME(KORMO) ADQUARTILE(KORMO)
  player.on('timeupdate', () => {
    const length = player.duration();
    const remaining = player.remainingTime();
    const current = length - remaining;
    const quartile = length / 4;

    if (current > (quartile * player.quartile)) {
      if (player.ad) {
        console.log('VAST', '\'ad-quartile ' + (++player.quartile) + '\'');
      } else videojs.log('\'quartile ' + (++player.quartile) + '\'');
    }
  });

  // FULLSCREEN
  player.on('fullscreenchange', () => {
    if (player.ad) {
      console.log('VAST', '\'ad-fullscreen-change\'');
    } else videojs.log('\'fullscreen-change\'')
  });

  // ERROR (KORMO)
  player.on('vast.adError', () => console.log('VAST', '\'ad-error\''));

  // AD COMPLETE (KORMO)
  player.on('vast.contentStart', () => {
    player.ad = false;
    console.log('VAST', '\'ad-complete\'');
  });

  // COMPLETE (KORMO)
  // player.on('vast.contentEnd', () => console.log('VAST', '\'content-end\''));
  // player.on('ended', () => videojs.log('\'ended\''));

  // READY (KORMO)
  videojs.log('\'ready\'');

  // OPTIONAL
  // player.on('vast.adsCancel', () => console.log('VAST', '\'ad-cancel\''));
  // player.on('vast.reset', () => console.log('VAST', '\'vast-reset\''));
  // player.on('vast.adSkip', () => console.log('VAST', '\'ad-skip\''));
}

// Hijack the console to mirror its logs
if (window.console && console) {
  for (let prop in console) {
    if (typeof console[prop] === 'function') {
      const original = console[prop];
        console[prop] = function () {
          logger(arguments);
          original.apply(this, arguments)
        }
    }
  }
}

// Log only player and plugin events
function logger(args) {
  if (args [0] === 'VIDEOJS:') {
    let message = '<span class="time">' +
      getCurrentTimeSring() +
      ' - </span><span class="player-log">' +
      args[1] + '</span>';
      $('#player-log').append('<li>' + message + '</li>');
  } else if (args[0] === 'VAST'){
    message = '<span class="time">' +
      getCurrentTimeSring() +
      '</span> - <span class="plugin-log">' +
      args[1] + '</span>';
      $('#plugin-log').append('<li>' + message + '</li>');
  }
}

// UI / UX STUFF

function params() {
  const url = new URL(document.URL);
  VAST_URL = url.searchParams.get('vast');
}

function setup() {
  $('#title').append(' - ' + (window.VM_MOBILE_FLAG ? 'Mobile' : 'Desktop'));
  $('#nvast').val(window.VAST_URL ? window.VAST_URL : '');
  listeners();
}

function listeners() {
  $($('input')[0]).on('keyup', event => {
    const { target, keyCode } = event;
    const { value } = target;
    if (keyCode === 13) {
      history.pushState(null, null, (value.length ? '/?vast=' + encodeURIComponent(value) : '/'));
      window.location = (value.length ? '/?vast=' + encodeURIComponent(value): '/');
    }
    event.preventDefault();
  });
}

// videojs.registerPlugin('reviveAdsPlugin', function() {
//   const player = this;

//   player.ads({ debug: true });

//   // player.src('http://localhost:4040/videos/rog-zephyrus-duo-15.mp4');
//   console.log('\n\nplayer.ads', player.ads);
//   // // asynchronous method for requesting ad inventory

//   // function requestAds() {
//   //   videojs.log('example', 'Requesting an ad');

//   //   // reset plugin state
//   //   state = {};

//   //   // fetch ad inventory
//   //   // the 'src' parameter is ignored by the example inventory.json flat file,
//   //   // but this shows how you might send player information along to the ad server.
//   //   let adServerFullUrl = adServerUrl + "?script=" + adReqScript + "&format=" + adReqFormat
//   //   adServerFullUrl += "&nz=1&zones=" + adReqZone + "%3D" + adReqZoneId

//   //   const xhr = new XMLHttpRequest();

//   //   xhr.open("GET", adServerFullUrl);

//   //   xhr.onreadystatechange = function() {
//   //     if (xhr.readyState !== 4) return;

//   //     state.inventory = [];

//   //     try {
//   //       const $xmlNodes = $(xhr.responseXML);
//   //       const mediaFileNodes = $xmlNodes.find('Ad#' + adReqZone)
//   //         .find('InLine').find('Video').find('MediaFile');

//   //       if (mediaFileNodes.length > 0) {
//   //         for (let i = 0; i < mediaFileNodes.length; i++) {
//   //           const mediaFileNode = mediaFileNodes[i];
//   //           const type = $(mediaFileNode).attr('type');

//   //           if (typeof type !== 'undefined' && type !== false) {
//   //             const src = $(mediaFileNode).find('URL').textContent;

//   //             if (src && src.length > 0) {
//   //               state.inventory.push({ src, type })
//   //             }
//   //           }
//   //         }
//   //       }

//   //       player.trigger('adsready');
//   //     } catch (err) {
//   //       throw new Error('Couldn\'t parse inventory response as JSON');
//   //     }
//   //   };

//   //   xhr.send(null);
//   // }

//   // // play an ad, given an opportunity
//   // function playAd() {
//   //   // short-circuit if we don't have any ad inventory to play
//   //   if (!state.inventory || state.inventory.length === 0) {
//   //     videojs.log('No inventory to play.');
//   //     return;
//   //   }

//   //   // tell ads plugin we're ready to play our ad
//   //   player.ads.startLinearAdMode();
//   //   state.adPlaying = true;

//   //   // tell videojs to load the ad
//   //   const media = state.inventory[Math.floor(Math.random() * state.inventory.length)];
//   //   player.src(media);
//   //   player.trigger('ads-ad-started');

//   //   // when it's finished
//   //   player.one('adended', function() {
//   //     player.trigger('ads-ad-ended');
//   //     // play your linear ad content, then when it's finished ...
//   //     player.ads.endLinearAdMode();
//   //     state.adPlaying = false;
//   //   });
//   // }

//   // initialize the ads plugin, passing in any relevant options
//   // player.ads(options);

//   // // request ads right away
//   // requestAds();

//   // player.on('adsready', function() {
//   //   if (!playPreroll) {
//   //     player.trigger('nopreroll');
//   //   }
//   // });

//   // // request ad inventory whenever the player gets content to play
//   // player.on('contentchanged', requestAds);

//   // player.on('readyforpostroll', function () {
//   //   if (!state.postrollPlayed && playPostroll) {
//   //     state.postrollPlayed = true;
//   //     playAd();
//   //   } else {
//   //     player.trigger('nopostroll');
//   //   }
//   // });

//   // // play an ad the first time there's a preroll opportunity
//   // player.on('readyforpreroll', function () {
//   //   if (!state.prerollPlayed && playPreroll) {
//   //     state.prerollPlayed = true;
//   //     playAd();
//   //   }
//   // });

//   // // watch for time to pass 15 seconds, then play an ad
//   // // if we haven't played a midroll already
//   // player.on('timeupdate', function(event) {
//   //   if (state.midrollPlayed) {
//   //     return;
//   //   }

//   //   let opportunity;
//   //   const currentTime = player.currentTime();

//   //   if ('lastTime' in state) {
//   //     opportunity = currentTime > midrollPoint && state.lastTime < midrollPoint;
//   //   }

//   //   state.lastTime = currentTime;

//   //   if (opportunity && playMidroll) {
//   //     state.midrollPlayed = true;
//   //     playAd();
//   //   }
//   // });
// });

// videojs.registerPlugin('reviveVastPlugin', function(options) {
//   const player = this;

//   // just like any other video.js plugin, ad plugins can
//   // accept initialization options
//   let adReqZoneId = (options && options.adReqZoneId) || 1;
//   let midrollPoint = (options && options.midrollPoint) || 15;
//   let adReqZone = options && options.adReqZone !== undefined ? options.adReqZone : 'pre-roll';
//   let adReqFormat = options && options.adReqFormat !== undefined ? options.adReqFormat : 'vast';
//   let adServerUrl = options && options.adServerUrl !== undefined
//     ? options.adServerUrl : 'http://adserver.revive.io:8000/www/delivery/fc.php';
//   let adReqScript = options && options.adReqScript !== undefined
//     ? options.adReqScript : 'bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml';
//   let playPreroll = options && options.playPreroll !== undefined ? options.playPreroll : true;
//   let playMidroll = options && options.playMidroll !== undefined ? options.playMidroll : false;
//   let playPostroll = options && options.playPostroll !== undefined ? options.playPostroll : false;

//   if (playPreroll) {
//     adReqZone = 'pre-roll';
//   } else if(playMidroll) {
//     adReqZone = 'mid-roll';
//   } else if(playPostroll) {
//     adReqZone = 'post-roll';
//   }

//   let adServerFullUrl = adServerUrl + "?script=" + adReqScript + "&format=" + adReqFormat
//   adServerFullUrl += "&nz=1&zones=" + adReqZone + "%3D" + adReqZoneId
//   // let adServerFullUrl = `http://127.0.0.1:4040/vasts/${adReqZone}.xml`

//   player.vast({ url: adServerFullUrl });

//   console.log('\n\nplayer.vast', player.vast);
// });

params();
setup();

const vid0 = videojs('vid0', DEFAULT_VIDEOJS, onPlayerReady);
// vid0.vast({ url: 'http://theonion.github.io/videojs-vast-plugin/onion_sample.xml' });
// vid0.vast({ url: 'http://127.0.0.1:4040/vasts/onion_sample.xml' });

// const vid1 = videojs('vid1');
// vid1.muted(true);
// vid1.ads({ debug: true });
// vid1.vast({ url: 'http://127.0.0.1:4040/vasts/mid-roll.xml' });
// // vid1.reviveAdsPlugin();
// // vid1.reviveVastPlugin({ adReqZoneId: 1, playMidroll: true, midrollPoint: 15, adReqZone: 'mid-roll' })

// const vid2 = videojs('vid2');
// vid2.muted(true);
// vid2.ads({ debug: true });
// vid2.vast({ url: 'http://127.0.0.1:4040/vasts/pre-roll.xml' });
// // vid2.reviveAdsPlugin();
// // vid2.reviveVastPlugin({ adReqZoneId: 1, playPreroll: true, adReqZone: 'pre-roll' })

// const vid3 = videojs('vid3');
// vid3.muted(true);
// vid3.ads({ debug: true });
// vid3.vast({ url: 'http://127.0.0.1:4040/vasts/post-roll.xml' });
// vid3.reviveAdsPlugin();
// vid3.reviveVastPlugin({ adReqZoneId: 1, playPostroll: true, adReqZone: 'post-roll' })

// player.src('http://localhost:4040/rog-zephyrus-duo-15.mp4');
// console.log('player', player);
// console.log('\n\nplayer.ads', player.ads);

// request ads whenever there's new video content
// player.on('contentchanged', function() {
//   // in a real plugin, you might fetch new ad inventory here
//   player.trigger('adsready');
// });

// player.on('readyforpreroll', function() {
//   player.ads.startLinearAdMode();
//   // play your linear ad content
//   // in this example, we use a static mp4
//   // player.src('http://localhost:4040/rog-zephyrus-duo-15.mp4');
//   // [YOUR-ADSERVER-DOMAIN-HERE]/www/delivery/fc.php?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&format=vast&nz=1&zones=pre-roll%3D[YOUR-ZONE-ID-HERE]
//   player.src('http://adserver.revive.io:8000/www/delivery/fc.php?script=bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml&format=vast&nz=1&zones=pre-roll%3D1');

//   // send event when ad is playing to remove loading spinner
//   player.one('adplaying', function() {
//     player.trigger('ads-ad-started');
//   });

//   // resume content when all your linear ads have finished
//   player.one('adended', function() {
//     player.ads.endLinearAdMode();
//   });
// });

// // in a real plugin, you might fetch ad inventory here
// player.trigger('adsready');
