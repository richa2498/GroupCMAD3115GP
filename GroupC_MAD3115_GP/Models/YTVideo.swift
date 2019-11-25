//
//  YTVideo.swift
//  GroupC_MAD3115_GP
//
//  Created by MacStudent on 2019-11-19.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import Foundation

// MARK: - YTVideo
struct YTVideo: Codable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    var items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind: ItemKind
    let etag: String
    let id: ID
    let snippet: Snippet
}

// MARK: - ID
struct ID: Codable {
    let kind: IDKind
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

enum IDKind: String, Codable {
    case youtubeVideo = "youtube#video"
}

enum ItemKind: String, Codable {
    case youtubeSearchResult = "youtube#searchResult"
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt, channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let liveBroadcastContent: LiveBroadcastContent

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, liveBroadcastContent
    }
}

enum LiveBroadcastContent: String, Codable {
    case none = "none"
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}




/*
 URL: https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=monsoon&type=video&page=1&key=AIzaSyBc1_kSg50Pq3-8v9RxQBzxc7G-izAZGRo
 
 
 RESPONSE
 
 {
  "kind": "youtube#searchListResponse",
  "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/XEErnakfD0nula9vXJKuc6yZk-g\"",
  "nextPageToken": "CDIQAA",
  "regionCode": "CA",
  "pageInfo": {
   "totalResults": 1000000,
   "resultsPerPage": 50
  },
  "items": [
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/qHI5nmOBY_s-CgSbRBhys0fPCpQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "Le_IyYLrUtQ"
    },
    "snippet": {
     "publishedAt": "2010-04-12T14:45:12.000Z",
     "channelId": "UCgMQsT3peJwmPaND9k5rAiA",
     "title": "Tokio Hotel - Monsoon",
     "description": "Music video by Tokio Hotel performing Monsoon. (C) 2007 Hoffmann, Benzner, Roth & Jost GbR under exclusive license to Universal Music Domestic Division, ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/Le_IyYLrUtQ/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/Le_IyYLrUtQ/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/Le_IyYLrUtQ/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "TokioHotelVEVO",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/nI6LKikXXsdm_YtrzxfWaruBpT4\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "IA9DbcihtUA"
    },
    "snippet": {
     "publishedAt": "2019-10-12T10:34:50.000Z",
     "channelId": "UC2o8h4Hm04reICjygK5CG2Q",
     "title": "Monsoon Full Nepali Novel Audiobook || Subin Bhattrai",
     "description": "Listen to Monsoon, one of the best selling novel of Subin Bhattrai in audio format. Don't forget to like ,comment, share and subscribe our channel to get updated ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/IA9DbcihtUA/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/IA9DbcihtUA/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/IA9DbcihtUA/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "BlackBox Media",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/SQT6SD3ZmaY0QPvugNrx0epSa9I\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "lpeVqICLTig"
    },
    "snippet": {
     "publishedAt": "2018-08-24T11:29:58.000Z",
     "channelId": "UCylCbuzRsB92Gc1l8ru6VIg",
     "title": "What is a monsoon?",
     "description": "What is a monsoon? The word monsoon comes from the Arabic word 'mausim' which translates as 'season', which is suggestive of the seasonal nature of the ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/lpeVqICLTig/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/lpeVqICLTig/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/lpeVqICLTig/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Met Office - Learn About Weather",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/krpFXtumbW1w1G6ID4bfUx_7Mj4\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "KPor7zyMWRQ"
    },
    "snippet": {
     "publishedAt": "2018-05-27T12:47:24.000Z",
     "channelId": "UCqF7iHh8peFG6ROPH9GMD2Q",
     "title": "br.eakfast - monsoon [slowed]",
     "description": "Support br.eakfast: https://m.soundcloud.com/eyes6 Picture: https://goo.gl/images/Lwr3hM.",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/KPor7zyMWRQ/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/KPor7zyMWRQ/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/KPor7zyMWRQ/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "plvtosvenvs",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/LmsUP12O3I6rSRgL9ecFmZmixgc\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "76dfOmEr4_s"
    },
    "snippet": {
     "publishedAt": "2016-05-30T21:20:58.000Z",
     "channelId": "UCVJHkl5eJm4dCNKHUh-ErKA",
     "title": "National Geographic - Monsoons",
     "description": "From a 2001 VHS program called \"World Regions,\" made by National Geographic and Glencoe McGraw-Hill. The program contained four VHS tapes and ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/76dfOmEr4_s/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/76dfOmEr4_s/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/76dfOmEr4_s/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Thrift VHS",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/gdnzE2-Zk-FnprqPvPJZAgzdUVQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "hvqUPgTP99Q"
    },
    "snippet": {
     "publishedAt": "2008-06-22T17:22:51.000Z",
     "channelId": "UCbcwGHMZsec7hS40vIb3ybQ",
     "title": "Lyrics Tokio Hotel monsoon",
     "description": "I'm staring at a broken door There's nothing left here anymore My room is cold It's making me insane I've been waiting here so long But now the moment seems ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/hvqUPgTP99Q/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/hvqUPgTP99Q/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/hvqUPgTP99Q/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Eillecestmoi",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/tDSmieBAl-j_V5fW25RVpsujPxU\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "S_Sy5-sOodA"
    },
    "snippet": {
     "publishedAt": "2009-10-08T08:27:30.000Z",
     "channelId": "UCgMQsT3peJwmPaND9k5rAiA",
     "title": "Tokio Hotel - Durch Den Monsun",
     "description": "Music video by Tokio Hotel performing Durch Den Monsun. (C) 2005 Hoffmann, Benzner, Roth & Jost GbR under exclusive license to Universal Music Domestic ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/S_Sy5-sOodA/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/S_Sy5-sOodA/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/S_Sy5-sOodA/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "TokioHotelVEVO",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/JT65ygHiWY6Tb0NMEvZkTTnp-i0\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "po2OdTtpneE"
    },
    "snippet": {
     "publishedAt": "2019-10-08T20:25:08.000Z",
     "channelId": "UCde-0Qs4x_Hg6OJR5-_edhg",
     "title": "(FREE) | &quot;Monsoon&quot; | Yxng Bane x Not3s x Jhus Type Beat | Free Beat | UK Afrobeats Instrumental 2019",
     "description": "Purchase | Download This Beat: https://www.certibeats.com/ *FREE FOR NON PROFIT USE ONLY & CREDIT ME IN THE TITLE [PROD. CERTIBEATS]* ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/po2OdTtpneE/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/po2OdTtpneE/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/po2OdTtpneE/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "CERTIBEATS",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/vFsCjhJ02xthMhjJbMJJtcaA7Yw\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "TBH_Yo5sSEI"
    },
    "snippet": {
     "publishedAt": "2013-02-21T19:34:19.000Z",
     "channelId": "UCYw0YyEE5Xv0mCEiqo64dxw",
     "title": "Metal Gear Rising: Revengeance - Monsoon Boss Battle",
     "description": "Follow me on Twitter: https://twitter.com/LegendaryPeelz Like and subscribe, folks! It really motivates me to keep making videos! Raiden succumbs to his Jack ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/TBH_Yo5sSEI/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/TBH_Yo5sSEI/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/TBH_Yo5sSEI/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "LegendaryPeelz",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/ZwB_Bn4q33p4uJgCKosWj-2KnYQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "RaPha6dKQSg"
    },
    "snippet": {
     "publishedAt": "2017-11-28T14:44:45.000Z",
     "channelId": "UCJ7czAlpYL2ePjJpNxLuwxQ",
     "title": "INDIAN MONSOON की पूरी प्रक्रिया को जानिए | Factors &amp; Theories, Advancing &amp; Retreating Monsoon",
     "description": "Full Course: http://goo.gl/Z8vNkY Follow Rohit Dagar sir on Instagram : https://www.instagram.com/rohitdagar08/ #Follow_Rohit_sir_on_Instagram_rohitdagar08 ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/RaPha6dKQSg/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/RaPha6dKQSg/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/RaPha6dKQSg/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Samajho Learning",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/Mr7CIhuR4Ds39dX4Jhcw9RpYVco\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "q4QxxcsM8e0"
    },
    "snippet": {
     "publishedAt": "2019-08-16T13:55:55.000Z",
     "channelId": "UCajyP_LyMVUfzyxp5nP0xkg",
     "title": "Monsoon Kills Shroud With Insane Flick Shot - Apex Legends Highlights",
     "description": "Monsoon Kills Shroud With Insane Flick Shot - Apex Legends Highlights Twitch Prime - https://amzn.to/2HH8WY7 ------------------------------------------------------.",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/q4QxxcsM8e0/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/q4QxxcsM8e0/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/q4QxxcsM8e0/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Zipp",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/Q_5_temcI90YlLioT-TKBA_ZCSY\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "YDgGgkn108Q"
    },
    "snippet": {
     "publishedAt": "2018-02-18T10:18:11.000Z",
     "channelId": "UCWtNrCITC4qZbTFIksbYC3Q",
     "title": "Monsoon",
     "description": "Provided to YouTube by Dig Dis Monsoon · Mark Alow Edulis ℗ Bondage Music Released on: 2018-02-19 Composer Lyricist: Mark Alow Auto-generated by ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/YDgGgkn108Q/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/YDgGgkn108Q/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/YDgGgkn108Q/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Mark Alow - Topic",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/iA1bSOThjxXwM6Ytx8tj86g9H_E\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "LbY3DdzV0rA"
    },
    "snippet": {
     "publishedAt": "2017-10-24T08:22:26.000Z",
     "channelId": "UCopMlh9gz8P27dpHg-4GXeA",
     "title": "Monsoon IV 4K // A 4K Storm Time-lapse Film",
     "description": "Become a Patron: https://www.patreon.com/mikeolbinski ----- Blu-Ray discs available here: http://www.mikeolbinski.com/shop/ Music by Peter Nanasi, find his ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/LbY3DdzV0rA/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/LbY3DdzV0rA/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/LbY3DdzV0rA/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Mike Olbinski",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/v7h3QKy-16YCAX83j_ZMeEdBDPU\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "HOFmDK_1cVg"
    },
    "snippet": {
     "publishedAt": "2009-05-13T14:07:55.000Z",
     "channelId": "UCrJWPuLXHSlE0bg2v7g6C-A",
     "title": "Monsoon - Ever so lonely 1982",
     "description": "Monsoon - Ever so lonely 1982 Ever so lonely Ever so lonely Ever so lonely without you Ever so lonely Ever so lonely without you (Instrumental) Ever so lonely ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/HOFmDK_1cVg/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/HOFmDK_1cVg/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/HOFmDK_1cVg/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "fritz51334",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/UFUV1QSxiPEJX4n8vs9_vhbIfi0\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "PxCe9pj8ZO4"
    },
    "snippet": {
     "publishedAt": "2015-06-13T02:12:44.000Z",
     "channelId": "UCIVk1L1-JmpdiGuZcVjImtA",
     "title": "ABC15 Monsoon Special Part I",
     "description": "ABC15 Monsoon Special Part I, June 12, 2015. ◂ ABC15 is your destination for Arizona breaking news, weather, traffic, streaming video and in-depth coverage ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/PxCe9pj8ZO4/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/PxCe9pj8ZO4/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/PxCe9pj8ZO4/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "ABC15 Arizona",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/8Jbkky7r-4XQrGRaym3WiS9EU2Q\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "Qkheum0eE5U"
    },
    "snippet": {
     "publishedAt": "2018-08-10T14:00:04.000Z",
     "channelId": "UC0_LJ1oJtR5keARJWupA3_g",
     "title": "Tokio Hotel - Monsoon | Julien vs. Jimmy  | The Voice of Germany 2017 | Battles",
     "description": "Jimmy und Julien verbinden Musik mit Kunst. Coach Yvonne schockt die zwei Talente mit der Songauswahl: Tokio Hotel gehört nicht zu den Lieblingsbands von ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/Qkheum0eE5U/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/Qkheum0eE5U/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/Qkheum0eE5U/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "The Voice of Germany - Offiziell",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/heLU7CIRvSwqpstbLaa7LCVKszE\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "wnKz7-yjp_w"
    },
    "snippet": {
     "publishedAt": "2017-07-16T15:19:08.000Z",
     "channelId": "UC-lz2C-3M0CmPh1Jp7VXhyA",
     "title": "Torrential Monsoon Rain in my village near Udupi (24-06-2017)",
     "description": "Enjoy the scenic views of torrential monsoon rain that lashed my village for more than an hour relentlessly in thick droplets. Fortunately the wind force was ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/wnKz7-yjp_w/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/wnKz7-yjp_w/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/wnKz7-yjp_w/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Nanda Kumar",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/ae8_YxwxAsxQaZ-4d6T29Xn2dIs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "Hj5Y_Mni-eU"
    },
    "snippet": {
     "publishedAt": "2017-05-21T23:01:00.000Z",
     "channelId": "UCMpn3xVjGSB8zztwLjENjvw",
     "title": "Amber Mark - Monsoon (Official Video) ft. Mia Mark",
     "description": "Taken from Amber Mark's EP 3:33AM Stream/Download here: https://lnk.to/AmberMarkEP https://twitter.com/amb3rmark https://www.instagram.com/instagramber ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/Hj5Y_Mni-eU/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/Hj5Y_Mni-eU/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/Hj5Y_Mni-eU/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "AmberMarkVEVO",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/yM0IrWNlrSmrtgZRnLEq2zMeFnQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "qyV5DF7Smwc"
    },
    "snippet": {
     "publishedAt": "2019-11-16T07:59:12.000Z",
     "channelId": "UCKLN9wGq6WfD2JgJk6P7ODQ",
     "title": "Helen Malayalam Movie Review by Sudhish Payyanur | Monsoon Media",
     "description": "Helen Full Movie Review: Watch the video review of Malayalam film Helen directed by Mathukutty Xavier starring Anna Ben, Lal, Noble Babu Thomas, Aju ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/qyV5DF7Smwc/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/qyV5DF7Smwc/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/qyV5DF7Smwc/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "MONSOON MEDIA",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/mjjdmWiJINNPpxFZayWK-Syx0mo\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "vwD0UpsA5kE"
    },
    "snippet": {
     "publishedAt": "2017-07-11T12:30:14.000Z",
     "channelId": "UC40Tw2tFuMzK305mi7nj8rg",
     "title": "What is a monsoon?",
     "description": "60% of the world's population live in a monsoonal climate, with well-defined dry and wet seasons. What is a monsoon and what causes such a dramatic ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/vwD0UpsA5kE/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/vwD0UpsA5kE/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/vwD0UpsA5kE/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Met Office - Weather",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/aTMortMTouT-_TeApVv_jxmmGFw\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "1nstixjMS7A"
    },
    "snippet": {
     "publishedAt": "2019-03-24T10:43:04.000Z",
     "channelId": "UC1raaXFgsFBSFR8qNgchF2g",
     "title": "The Asian Monsoon - The World&#39;s Largest Weather System",
     "description": "It's the world's largest weather system. Affecting almost half of the world's population, its seasonal changes in winds and rain determine the cycles of nature and ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/1nstixjMS7A/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/1nstixjMS7A/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/1nstixjMS7A/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "GeoDiode",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/lu4_LtkplZ7EQPfANngQMW-R-pg\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "md-lMimdUK4"
    },
    "snippet": {
     "publishedAt": "2017-05-11T23:01:00.000Z",
     "channelId": "UCMpn3xVjGSB8zztwLjENjvw",
     "title": "Amber Mark - Monsoon ft. Mia Mark",
     "description": "Taken from Amber Mark's EP 3:33AM Stream/Download here: https://lnk.to/AmberMarkEP https://twitter.com/amb3rmark https://www.instagram.com/instagramber ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/md-lMimdUK4/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/md-lMimdUK4/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/md-lMimdUK4/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "AmberMarkVEVO",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/3kEDbpkp-fg0A92yWmKAhJEl-1o\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "1LWsT7kqVoE"
    },
    "snippet": {
     "publishedAt": "2016-11-21T15:00:19.000Z",
     "channelId": "UCxuQozefIbixypusUenyoTQ",
     "title": "Hippo Campus - monsoon (Official Audio)",
     "description": "Pre-order the debut album 'landmark' here: http://www.hippocampusband.com/ to receive an instant download of 'monsoon' Stream 'monsoon' and follow Hippo ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/1LWsT7kqVoE/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/1LWsT7kqVoE/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/1LWsT7kqVoE/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "HippoCampusVEVO",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/KYZt3y8vsGXJe8QuBqWCd56b5H0\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "YyJ0x-pH7v4"
    },
    "snippet": {
     "publishedAt": "2019-11-08T15:59:11.000Z",
     "channelId": "UCKLN9wGq6WfD2JgJk6P7ODQ",
     "title": "Moothon Malayalam Movie Review by Sudhish Payyanur | Monsoon Media",
     "description": "Moothon Full Movie Review: Watch the video review of Malayalam film Moothon directed by Geetu Mohandas starring Nivin Pauly, Sobhita Dhulipala, Shashank ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/YyJ0x-pH7v4/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/YyJ0x-pH7v4/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/YyJ0x-pH7v4/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "MONSOON MEDIA",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/Hdqqpx63EF-gk1PEkBadLVr3huQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "TC75USRhdho"
    },
    "snippet": {
     "publishedAt": "2018-10-30T08:04:50.000Z",
     "channelId": "UCopMlh9gz8P27dpHg-4GXeA",
     "title": "Monsoon V (4K)",
     "description": "Become a Patron: https://www.patreon.com/mikeolbinski BluRay discs (new combo BluRay of Monsoon I-V) available here: http://mikeolbinski.com/shop/ Follow ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/TC75USRhdho/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/TC75USRhdho/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/TC75USRhdho/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Mike Olbinski",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/KiCfn629fuRQ-d5M84GlLLR43kQ\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "yluH_gFQfsg"
    },
    "snippet": {
     "publishedAt": "2013-07-21T06:06:21.000Z",
     "channelId": "UCaL5qFMgCLy4kcLyOinI4Og",
     "title": "Monsoon 2013 - July 20, Tucson Arizona",
     "description": "The monsoon had been little more than a whimper of late but did it ever wake up! The nearest precipitation gauge at Houghton and the Pantano Wash showed ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/yluH_gFQfsg/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/yluH_gFQfsg/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/yluH_gFQfsg/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "PecosVideos",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/c-w4hH5vCmubHcehK6D-m05ExBA\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "Xc7d7F5T6rI"
    },
    "snippet": {
     "publishedAt": "2015-10-05T05:38:17.000Z",
     "channelId": "UCopMlh9gz8P27dpHg-4GXeA",
     "title": "Monsoon II (4K)",
     "description": "Become a Patron: https://www.patreon.com/mikeolbinski Blu-Ray Disc available here: http://www.mikeolbinski.com/shop/ Song by Kerry Muzzy: \"Palladio ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/Xc7d7F5T6rI/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/Xc7d7F5T6rI/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/Xc7d7F5T6rI/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Mike Olbinski",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/SSI_ufHX_YjrjVlChCCTaQukfC0\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "Fo8nlearLZQ"
    },
    "snippet": {
     "publishedAt": "2018-02-21T05:45:37.000Z",
     "channelId": "UCp1IKaxGFEy-TZ0mrW-oqXA",
     "title": "Concept of Indian Monsoon | Geology Tutorials",
     "description": "In this module, you will: understand the concept of Indian Monsoon, and explain the factors that determine the typicality of Indian Monsoon, and explain the role ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/Fo8nlearLZQ/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/Fo8nlearLZQ/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/Fo8nlearLZQ/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "MBD Alchemie",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/vEO84-2FEBjcq1UaPJ-bRyfqYyY\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "J5EXnh53A1k"
    },
    "snippet": {
     "publishedAt": "2018-07-24T14:17:44.000Z",
     "channelId": "UCBzRNetz7eOSqcAdNXhPZPA",
     "title": "Monsoon Love Jukebox - Pehchan Music | Monsoon Special Songs 2018",
     "description": "Presenting in this beautiful monsoon season - A Special Jukebox - \"MONSOON LOVE\". SONGS IN THE JUKEBOX: Rim Jhim Gire Saawan - Cover by Rahul ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/J5EXnh53A1k/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/J5EXnh53A1k/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/J5EXnh53A1k/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Pehchan Music",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/_j4fCcKym81-WoiCLTtQl0feU8w\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "ElLV7yntb3w"
    },
    "snippet": {
     "publishedAt": "2019-08-22T07:00:08.000Z",
     "channelId": "UC6tKaP4AfhaX1HtVrWdl4Mg",
     "title": "Romantic Monsoon Mashup |Bollywood| Gurashish Singh | ft. Kuhu Gracia I Tanveer Singh Kohli | 90’s",
     "description": "For any Live shows /Business enquiries, contact us at: singhsunplugged@gmail.com +919137857434 For Music Production/Mixing & Mastering Services ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/ElLV7yntb3w/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/ElLV7yntb3w/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/ElLV7yntb3w/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Singh's Unplugged",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/nce7_S46V5d5qCeMplmcR68NfIs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "u8rYCNsXtdM"
    },
    "snippet": {
     "publishedAt": "2011-12-30T02:06:56.000Z",
     "channelId": "UCijkM9mxJTLDOERSrWcm6sA",
     "title": "Robbie Williams - Monsoon  - (Live at Knebworth) - HD",
     "description": "Robbie Williams - Monsoon - Live at Knebworth - HD By Miky http://youtu.be/u8rYCNsXtdM.",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/u8rYCNsXtdM/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/u8rYCNsXtdM/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/u8rYCNsXtdM/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Michele Nicola Pinna",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/EbZGs0HiVhVtyS3tZNuSz39iic4\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "zcHDHv6-JbA"
    },
    "snippet": {
     "publishedAt": "2019-07-01T13:00:12.000Z",
     "channelId": "UCuN4A3GCUq5-0wJDSiJoxRQ",
     "title": "7 LIFE Saving Monsoon Hacks You MUST Know..| #Haircare #Skincare #LifeHacks #Anaysa",
     "description": "The onset of Monsoon after hot summers is a great relief but also brings a lot of problems too. so here we are today gonna share with you some amazing ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/zcHDHv6-JbA/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/zcHDHv6-JbA/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/zcHDHv6-JbA/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Anaysa",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/Oo6iqzdxpSAKG9UINRzOH24-NBs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "R5Jrxb5209I"
    },
    "snippet": {
     "publishedAt": "2012-07-22T02:23:31.000Z",
     "channelId": "UCA3aPMKdozYIbNZtf71N7eg",
     "title": "Phoenix Dust Storm 2012 Monsoon Phoenix, Arizona July 21, 2012 Haboob Dust Sand Storm Gilbert, AZ",
     "description": "Massive dust storm hits Phoeniz, Arizona area July 21, 2012! Almost a year later after the first one hit us (a link to the first video below), I was able to scramble ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/R5Jrxb5209I/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/R5Jrxb5209I/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/R5Jrxb5209I/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Star Wars HQ",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/fJU8m3XeWus8vFBI4zaay2mP35g\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "7fkhOoD4GqI"
    },
    "snippet": {
     "publishedAt": "2019-11-18T19:11:04.000Z",
     "channelId": "UCUUUpaMp8DV6KUOfQwoIiLg",
     "title": "Cats: COOL MOM with Jinkx Monsoon S2 E20",
     "description": "Cool Mom Jinkx Monsoon and Kamikaze share their experiences owning a cat together! Come to RuPaul's DragCon UK, Jan 18 & 19! Learn more and get your ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/7fkhOoD4GqI/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/7fkhOoD4GqI/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/7fkhOoD4GqI/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "WOWPresents",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/7QhyOgchsGxF65VEa2QMrkHbbmg\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "ouIss1cBghk"
    },
    "snippet": {
     "publishedAt": "2011-11-01T13:10:02.000Z",
     "channelId": "UCf7T8pmQO1PCDN-Ryk0SqmA",
     "title": "Monsoon - Ever So Lonely HQ (Extended Video Remix By Boa)",
     "description": "Sheila Chandra & Monsoon (Bananas Show 1982) All videoclips and audio belong to rightful owners. This is a non-profit account and is for entertainment ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/ouIss1cBghk/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/ouIss1cBghk/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/ouIss1cBghk/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Boaizaton2",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/HATxsvZPFe4fTCnp7mqBRuJzcOw\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "kv8eqWGQE_8"
    },
    "snippet": {
     "publishedAt": "2015-11-16T23:59:41.000Z",
     "channelId": "UClKZ6IL7WhLm3DePEr_fHPw",
     "title": "►10 Hours of Rain in the Summer, Monsoon RAIN &amp; THUNDER ~HD VIDEO (Nature&#39;s Relaxing Sleep Music)",
     "description": "10 hours of rain in the summer monsoon rain with thunder. 1080p HD rainstorm video. Hard monsoon rainstorm video for sleep or relaxation. Summer rain and ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/kv8eqWGQE_8/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/kv8eqWGQE_8/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/kv8eqWGQE_8/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "SleepDroid Studios",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/YreODZiNSNIhdE9VEe7d3FC4sAo\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "e6n9thrQ6_I"
    },
    "snippet": {
     "publishedAt": "2019-09-11T10:09:11.000Z",
     "channelId": "UCWE0NeoDfdKwWmYUWTo21KA",
     "title": "Dixita Karki - Timi Ra Ma | Monsoon &amp; Dorje cover",
     "description": "Hello beautiful people, this is our first ever cover song in our official youtube channel \"Monsoon & Dorje\". We have done cover of \"Timi Ra Ma\" originally by ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/e6n9thrQ6_I/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/e6n9thrQ6_I/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/e6n9thrQ6_I/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Monsoon & Dorje",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/FKyk9XGdfwkAD3qKcpcj4mmrWQs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "hjcXkivEl5A"
    },
    "snippet": {
     "publishedAt": "2019-06-10T09:51:46.000Z",
     "channelId": "UC_C__SsDmqlFJg4S2W9YliQ",
     "title": "MONSOON SHOOTOUT Full Movie | Nawazuddin Siddiqui | New Bollywood Movies 2018",
     "description": "Click to Subscribe - http://bit.ly/CineBox Monsoon Shootout is a Hindi noir thriller directed by Amit Kumar and produced by Guneet Monga, Anurag Kashyap, and ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/hjcXkivEl5A/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/hjcXkivEl5A/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/hjcXkivEl5A/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "CineBox Pictures",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/jv_s0h7prmEapuws_FNlrrdV1bY\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "CDRe377CQrA"
    },
    "snippet": {
     "publishedAt": "2017-08-31T12:30:00.000Z",
     "channelId": "UCCCRRUvgvygH82HAugJjDLw",
     "title": "[Monsoon 2016] STREET SHOW (full) - AnhEmRap: DaLAB, PKL, Đen Vâu, Lynk Lee, Sói",
     "description": "Trước thềm Monsoon 2017 sắp diễn ra thì anh em có thể ngồi xem lại Streetshow của Monsoon năm ngoái để chuẩn bị sẵn tinh thần quẩy cho năm nay.",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/CDRe377CQrA/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/CDRe377CQrA/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/CDRe377CQrA/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Da LAB Official",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/W3wIyD97_MmxQ_4pB5diPq88kvs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "nMAAtTqi7sg"
    },
    "snippet": {
     "publishedAt": "2008-10-26T01:18:26.000Z",
     "channelId": "UCjOQXiYT-MvLZRFSh9t8_wA",
     "title": "Monsoon - Tokio Hotel",
     "description": "",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/nMAAtTqi7sg/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/nMAAtTqi7sg/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/nMAAtTqi7sg/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "theedgechronicles2",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/el8D2Qz26ec2zYTefTvvdjhWCwI\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "np6wPYT2kh8"
    },
    "snippet": {
     "publishedAt": "2015-07-29T08:40:48.000Z",
     "channelId": "UCaL5qFMgCLy4kcLyOinI4Og",
     "title": "Monsoon 2015 - July 28, Tucson Arizona.  The monsoon returns with heavy rain in SW Tucson.",
     "description": "Enough moisture finally made it into Tucson to spark thunderstorms and a lot of lightning. This episode of Monsoon 2015 contains time-lapse video of ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/np6wPYT2kh8/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/np6wPYT2kh8/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/np6wPYT2kh8/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "PecosVideos",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/S4Y6sabeNoPYkUvq8Zy9zCwqRZo\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "6v73ErVQ2fY"
    },
    "snippet": {
     "publishedAt": "2019-11-08T11:28:18.000Z",
     "channelId": "UCWE0NeoDfdKwWmYUWTo21KA",
     "title": "Jeremy Zucker - comethru | Monsoon &amp; Dorje cover",
     "description": "Hello beautiful people, a huge thanks to each and everyone for loving and supporting us in our previous videos. This time we've done cover of \"Jeremy Zucker ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/6v73ErVQ2fY/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/6v73ErVQ2fY/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/6v73ErVQ2fY/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Monsoon & Dorje",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/D5yRT21Wq7JN24UYT36EwNxsidg\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "lhy5OLlxBsc"
    },
    "snippet": {
     "publishedAt": "2019-07-31T16:00:07.000Z",
     "channelId": "UCTCjFFoX1un-j7ni4B6HJ3Q",
     "title": "Monsoon Wedding (2001) Trailer #1 | Movieclips Classic Trailers",
     "description": "Check out the official Monsoon Wedding (2001) Trailer starring Naseeruddin Shah! Let us know what you think in the comments below. ▻ Watch on ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/lhy5OLlxBsc/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/lhy5OLlxBsc/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/lhy5OLlxBsc/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Movieclips Classic Trailers",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/VNnZtfKQtQS2C5gVTAOIG-2DDC0\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "cl-u7PCGWck"
    },
    "snippet": {
     "publishedAt": "2018-05-22T07:06:30.000Z",
     "channelId": "UCj5LGFfFcoXdATF2scVy0RQ",
     "title": "Geography ||- Machanism Of Indian monsoon|| भारतीय मानसून की क्रियाविधि",
     "description": "machanism of south west Monsoon Manson.",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/cl-u7PCGWck/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/cl-u7PCGWck/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/cl-u7PCGWck/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "NewUTKARS IAS",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/KP6UbTQJX2yUn2qbdWhjWbFHFcE\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "G5zBatG8JsU"
    },
    "snippet": {
     "publishedAt": "2011-04-30T08:48:10.000Z",
     "channelId": "UCTZK56rfSo6pk45fFGqQJ9g",
     "title": "Tokio Hotel - Monsoon (Live In Milan)",
     "description": "Video came from The scream album Tokio Hotel - Monsoon (Live In Milan)",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/G5zBatG8JsU/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/G5zBatG8JsU/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/G5zBatG8JsU/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "xXxTokioHotelxXxBill",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/KiSxqTjvGlnUREwRooO1JvgzbA8\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "RGUTw_-oW6I"
    },
    "snippet": {
     "publishedAt": "2019-07-12T08:30:00.000Z",
     "channelId": "UCpCWa9f5_J3PqY-_Lg-_QfQ",
     "title": "KIDS In Monsoon - Types of Kids..| #Freetoy #SoulfullRagiBites #Fun #Sketch #Roleplay #MyMissAnand",
     "description": "Follow my Insta for BTS: https://tinyurl.com/MyMissAnand Happy Monsoon and I just love dancing and playing in the rainy day. Hope you also enjoy rain as ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/RGUTw_-oW6I/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/RGUTw_-oW6I/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/RGUTw_-oW6I/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "MyMissAnand",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/X1dPaRLE7dTHGGnXw2N6MkbMxoc\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "eNoCOLKmqnU"
    },
    "snippet": {
     "publishedAt": "2019-07-14T07:25:40.000Z",
     "channelId": "UC161d5peWbVcHdkhLJltscg",
     "title": "Monsoon Heartbreak Mashup 2019 | Aftermorning | Heartbreak Song",
     "description": "Click to Subscribe: http://bit.ly/aftermorningmusic For Music Production/Affiliate Markeing / Other Work Queries : +91 942020072 (WhatsApp) and ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/eNoCOLKmqnU/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/eNoCOLKmqnU/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/eNoCOLKmqnU/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Aftermorning",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/IeVTWtRn42T8E4NIGeVIIiS4JaU\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "o_mHLa5nV48"
    },
    "snippet": {
     "publishedAt": "2019-07-18T08:30:00.000Z",
     "channelId": "UCFcBAGR0drI3F15EhMFjuTg",
     "title": "RAINY SEASON - Expectation vs Reality - Monsoon Aayu and Pihu Show",
     "description": "For new episode every Thursday : SUBSCRIBE - Aayu and Pihu Show - https://goo.gl/EHTnu3 Aayu and Pihu Show New Hindi Kids show on YouTube, new ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/o_mHLa5nV48/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/o_mHLa5nV48/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/o_mHLa5nV48/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "Aayu and Pihu Show",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/16pyFW_usYU67HvYyqAzZpVgLQ4\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "d-6EmrRRYk8"
    },
    "snippet": {
     "publishedAt": "2019-10-25T11:01:34.000Z",
     "channelId": "UCKLN9wGq6WfD2JgJk6P7ODQ",
     "title": "Bigil Tamil Movie Review By Sudhish Payyanur | Monsoon Media",
     "description": "Bigil Full Movie Review: Watch the video review of Tamil film Bigil directed by Atlee starring Vijay and Nayanthara in the lead roles. Xen Cabs Online Taxi ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/d-6EmrRRYk8/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/d-6EmrRRYk8/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/d-6EmrRRYk8/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "MONSOON MEDIA",
     "liveBroadcastContent": "none"
    }
   },
   {
    "kind": "youtube#searchResult",
    "etag": "\"j6xRRd8dTPVVptg711_CSPADRfg/g4P19y_FYakxb0aMdFRGDI-zKbs\"",
    "id": {
     "kind": "youtube#video",
     "videoId": "5Ts0rLh1AX4"
    },
    "snippet": {
     "publishedAt": "2015-12-09T02:56:32.000Z",
     "channelId": "UCm2sI3Y4hu7rdh1RlIeN01w",
     "title": "Indian geography - Monsoon",
     "description": "This video or animation explains Indian monsoon. You do not have to be a geography expert to clear UPSC Civil Services Examination. What you need is an ...",
     "thumbnails": {
      "default": {
       "url": "https://i.ytimg.com/vi/5Ts0rLh1AX4/default.jpg",
       "width": 120,
       "height": 90
      },
      "medium": {
       "url": "https://i.ytimg.com/vi/5Ts0rLh1AX4/mqdefault.jpg",
       "width": 320,
       "height": 180
      },
      "high": {
       "url": "https://i.ytimg.com/vi/5Ts0rLh1AX4/hqdefault.jpg",
       "width": 480,
       "height": 360
      }
     },
     "channelTitle": "JeetoBharat",
     "liveBroadcastContent": "none"
    }
   }
  ]
 }
 
 */
