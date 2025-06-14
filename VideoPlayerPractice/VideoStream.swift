//
//  VideoStream.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import Foundation

struct VideoStream: Identifiable, Equatable, Hashable {
    let id = UUID()
    let url: String
    let title: String
    let artist: String
    let artworkURL: String
}

func getStreams() -> [VideoStream] {
    let streams: [VideoStream] = [
        VideoStream(
            url: "https://static.nrk.no/dev/streamtests/shaka-hlg/nrktv9/cmaf.m3u8",
            title: "NRKTV9 HLG HDR",
            artist: "NRK",
            artworkURL: "https://static.nrk.no/dev/streamtests/shaka-hlg/nrktv9/thumbnail.jpg"
        ),
        // *** Dolby Vision-ish / Dolby Atmos HLS **
        VideoStream(
            url: "https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8",
            title: "Apple Dolby Vision + Atmos Demo  ⭐️",
            artist: "Apple",
            artworkURL: "https://images.apple.com/v/streaming/shared/dv_atmos_thumb.jpg"
        ),

        // *** Ultra‑HD H.264/H.265 VOD ***
        VideoStream(
            url: "https://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8",
            title: "Skate Phantom Flex 4K",
            artist: "Vodobox Sample",
            artworkURL: "https://sample.vodobox.net/skate_phantom_flex_4k/thumbnail.jpg"
        ),
        VideoStream(
            url: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
            title: "Sintel ⭐️",
            artist: "Bitmovin",
            artworkURL: "https://resizing.flixster.com/7htOHKjqIZIP-jHp33y2Yzsde_Q=/fit-in/352x330/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p10892939_v_h9_aa.jpg"
        ),
        VideoStream(
            url: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
            title: "Tears of Steel",
            artist: "Unified Streaming",
            artworkURL: "https://mango.blender.org/wp-content/uploads/2013/05/ToS_Poster_Vertical.jpg"
        ),
        VideoStream(
            url: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
            title: "Apple fMP4 Example",
            artist: "Apple",
            artworkURL: "https://www.imgonline.com.ua/examples/rays-of-light-in-the-sky.jpg"
        ),
        VideoStream(
            url: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8",
            title: "Tears of Steel (MP4)",
            artist: "Unified Streaming",
            artworkURL: "https://mango.blender.org/wp-content/uploads/2013/05/ToS_Poster_Vertical.jpg"
        ),
        VideoStream(
            url: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
            title: "Live Akamai #1",
            artist: "Akamai",
            artworkURL: "https://www.akamai.com/site/im-demo/media/images/logo/akamai_logo.svg"
        ),
        VideoStream(
            url: "https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8",
            title: "Live Akamai #2",
            artist: "Akamai",
            artworkURL: "https://www.akamai.com/site/im-demo/media/images/logo/akamai_logo.svg"
        ),
        VideoStream(
            url: "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8",
            title: "Dolby Stereo VOD",
            artist: "Cloudfront",
            artworkURL: "https://i.ytimg.com/vi/Fo8uhx7HIoI/maxresdefault.jpg"
        ),
        VideoStream(
            url: "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_multichannel_subs.m3u8",
            title: "Dolby Multichannel VOD",
            artist: "Cloudfront",
            artworkURL: "https://i.ytimg.com/vi/Fo8uhx7HIoI/maxresdefault.jpg"
        ),
        VideoStream(
            url: "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_multi_language_subs.m3u8",
            title: "Dolby Multilanguage VOD",
            artist: "Cloudfront",
            artworkURL: "https://i.ytimg.com/vi/Fo8uhx7HIoI/maxresdefault.jpg"
        ),
        VideoStream(
            url: "http://amssamples.streaming.mediaservices.windows.net/91492735-c523-432b-ba01-faba6c2206a2/AzureMediaServicesPromo.ism/manifest(format=m3u8-aapl)",
            title: "Azure HLSv4 Promo 1",
            artist: "Azure",
            artworkURL: "https://learn.microsoft.com/en-us/azure/media-services/latest/media-services-docs-files/media-services.png"
        ),
        VideoStream(
            url: "http://amssamples.streaming.mediaservices.windows.net/69fbaeba-8e92-4740-aedc-ce09ae945073/AzurePromo.ism/manifest(format=m3u8-aapl)",
            title: "Azure HLSv4 Promo 2",
            artist: "Azure",
            artworkURL: "https://learn.microsoft.com/en-us/azure/media-services/latest/media-services-docs-files/media-services.png"
        ),
        VideoStream(
            url: "http://amssamples.streaming.mediaservices.windows.net/634cd01c-6822-4630-8444-8dd6279f94c6/CaminandesLlamaDrama4K.ism/manifest(format=m3u8-aapl)",
            title: "Azure 4K HLSv4 (Caminandes)",
            artist: "Azure",
            artworkURL: "https://durian.blender.org/wp-content/uploads/2009/07/caminandes.jpg"
        )
    ]

    return streams
}
