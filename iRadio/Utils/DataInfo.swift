//
//  Constants.swift
//  iRadio
//
//  Created by DavidTran on 4/15/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import Foundation
import UIKit





// Data Radio
let ChannelKinds = ["Viet Nam Channels","VOA Channels","BBC Channels","FOX News Talk","Classic FM"]

let ChannelURLs = [VOVChannelURArray, VOAChannelURLArray, BBCChannelURLArray,FoxChannelURLArray,ClassicFMChannelURLArray]
let ChannelNames = [VOVChannelNames,VOAChannelNames,BBCChannelNames,FoxChannelNames,ClassicFMChannelNames]
let ChannelLogos = [VOVLogos,VOALogos,BBCLogos,FoxLogos,ClassicFMLogos]

let VOVLogos: [UIImage] = [
    #imageLiteral(resourceName: "logo_vov_giao_thong"),#imageLiteral(resourceName: "logo_vov_giao_thong"),#imageLiteral(resourceName: "logo_vov"),#imageLiteral(resourceName: "logo_vov"),#imageLiteral(resourceName: "logo_vov"),#imageLiteral(resourceName: "logo_vov"),#imageLiteral(resourceName: "logo_vov"),#imageLiteral(resourceName: "logo_vov")
]
let VOVChannelNames = ["VOV Giao Thong HCM","VOV Giao Thong HN", "English 24h", "VOV1","VOV2",
                        "VOV3","VOV4","VOV5"]
let VOVChannelURArray = [
"https://5a6872aace0ce.streamlock.net/vovgt+hcm/vovgt+hcm.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vovgt+hn/vovgt+hn.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vov247/vov247.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vov1/vov1.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vov2/vov2.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vov3/vov3.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vovdbscl/vovdbscl.stream_aac/playlist.m3u8",
"https://5a6872aace0ce.streamlock.net/vov5/vov5.stream_aac/playlist.m3u8"
]
//enum VOVChannelURLs:String{
//    case VOV_GT_HCM = "https://5a6872aace0ce.streamlock.net/vovgt+hcm/vovgt+hcm.stream_aac/playlist.m3u8"
//    case VOV_GT_HN = "https://5a6872aace0ce.streamlock.net/vovgt+hn/vovgt+hn.stream_aac/playlist.m3u8"
//    case ENGLISH_24H = "https://5a6872aace0ce.streamlock.net/vov247/vov247.stream_aac/playlist.m3u8"
//    case VOV1 = "https://5a6872aace0ce.streamlock.net/vov1/vov1.stream_aac/playlist.m3u8"
//    case VOV2 = "https://5a6872aace0ce.streamlock.net/vov2/vov2.stream_aac/playlist.m3u8"
//    case VOV3 = "https://5a6872aace0ce.streamlock.net/vov3/vov2.stream_aac/playlist.m3u8"
//    case VOV4 = "https://5a6872aace0ce.streamlock.net/vov4/vov2.stream_aac/playlist.m3u8"
//    case VOV5 = "https://5a6872aace0ce.streamlock.net/vov5/vov2.stream_aac/playlist.m3u8"
//    static let allUrls = [VOV_GT_HCM,VOV_GT_HN,ENGLISH_24H,VOV1,VOV2,VOV3,VOV4,VOV5]
//}

let VOALogos:[UIImage] = [#imageLiteral(resourceName: "voa-logo"),#imageLiteral(resourceName: "voa-logo")]
let VOAChannelNames = ["VOA Learning English", "Vietnamese(at 10:00PM VN Time)"]
let VOAChannelURLArray = ["http://voa-91.ng.akacast.akamaistream.net/7/913/314276/v1/ibb.akacast.akamaistream.net/voa-91",
"http://voa-56.ng.akacast.akamaistream.net/7/670/322068/v1/ibb.akacast.akamaistream.net/voa-56"]
enum VOAChannelURLs:String{
    case Learning_English = "http://voa-91.ng.akacast.akamaistream.net/7/913/314276/v1/ibb.akacast.akamaistream.net/voa-91"
    case Vietnamese = "http://voa-56.ng.akacast.akamaistream.net/7/670/322068/v1/ibb.akacast.akamaistream.net/voa-56"
    static let allURLs = [Learning_English,Vietnamese]
}

let BBCLogos:[UIImage] = [#imageLiteral(resourceName: "bbc-logo"), #imageLiteral(resourceName: "bbc-logo"),#imageLiteral(resourceName: "bbc-logo"),#imageLiteral(resourceName: "bbc-logo"),#imageLiteral(resourceName: "bbc-logo")]
let BBCChannelNames = ["BBC English","BBC Asian","BBC Radio 1","BBC Radio 4"]
let BBCChannelURLArray = ["http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws", "http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_asian_network.m3u8","http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_one.m3u8","http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_q"]
enum BBCChannelURLs:String{
    case World_Service = "http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws"
    static let allURLs = [World_Service]
}

let FoxLogos:[UIImage] = [#imageLiteral(resourceName: "fox-news-talk-logo")]
let FoxChannelNames = ["Fox News Talk"]
let FoxChannelURLArray = ["http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws"]
enum FoxChannelURLs:String{
    case News_Talk = "http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws"
    static let allURLs = [News_Talk]
}

let ClassicFMLogos:[UIImage] = [#imageLiteral(resourceName: "classicfm-logo")]
let ClassicFMChannelNames = ["Classic FM"]
let ClassicFMChannelURLArray = ["http://media-ice.musicradio.com/ClassicFMMP3"]

//enum ClassicFMChannelURLs:String{
//    case News_Talk = ""
//    static let allURLs = [News_Talk]
//}




