import Foundation

/*


 Question
 ----------

 Design a sdk for video player

 ex: <VideoPlayer url={video_url} />

 --------------------------------------------------------------------------
 Video URL: https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8
 --------------------------------------------------------------------------
 #EXTM3U

 #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="stereo",LANGUAGE="en",NAME="English",DEFAULT=YES,AUTOSELECT=YES,URI="audio/stereo/en/128kbit.m3u8"
 #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="stereo",LANGUAGE="dubbing",NAME="Dubbing",DEFAULT=NO,AUTOSELECT=YES,URI="audio/stereo/none/128kbit.m3u8"

 #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="surround",LANGUAGE="en",NAME="English",DEFAULT=YES,AUTOSELECT=YES,URI="audio/surround/en/320kbit.m3u8"
 #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="surround",LANGUAGE="dubbing",NAME="Dubbing",DEFAULT=NO,AUTOSELECT=YES,URI="audio/stereo/none/128kbit.m3u8"

 #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Deutsch",DEFAULT=NO,AUTOSELECT=YES,FORCED=NO,LANGUAGE="de",URI="subtitles_de.m3u8"
 #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="English",DEFAULT=YES,AUTOSELECT=YES,FORCED=NO,LANGUAGE="en",URI="subtitles_en.m3u8"
 #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Espanol",DEFAULT=NO,AUTOSELECT=YES,FORCED=NO,LANGUAGE="es",URI="subtitles_es.m3u8"
 #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Français",DEFAULT=NO,AUTOSELECT=YES,FORCED=NO,LANGUAGE="fr",URI="subtitles_fr.m3u8"

 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=258157,CODECS="avc1.4d400d,mp4a.40.2",AUDIO="stereo",RESOLUTION=422x180,SUBTITLES="subs"
 video/250kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=520929,CODECS="avc1.4d4015,mp4a.40.2",AUDIO="stereo",RESOLUTION=638x272,SUBTITLES="subs"
 video/500kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=831270,CODECS="avc1.4d4015,mp4a.40.2",AUDIO="stereo",RESOLUTION=638x272,SUBTITLES="subs"
 video/800kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1144430,CODECS="avc1.4d401f,mp4a.40.2",AUDIO="surround",RESOLUTION=958x408,SUBTITLES="subs"
 video/1100kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1558322,CODECS="avc1.4d401f,mp4a.40.2",AUDIO="surround",RESOLUTION=1277x554,SUBTITLES="subs"
 video/1500kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4149264,CODECS="avc1.4d4028,mp4a.40.2",AUDIO="surround",RESOLUTION=1921x818,SUBTITLES="subs"
 video/4000kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6214307,CODECS="avc1.4d4028,mp4a.40.2",AUDIO="surround",RESOLUTION=1921x818,SUBTITLES="subs"
 video/6000kbit.m3u8
 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=10285391,CODECS="avc1.4d4033,mp4a.40.2",AUDIO="surround",RESOLUTION=4096x1744,SUBTITLES="subs"
 video/10000kbit.m3u8
 --------------------------------------------------------------------------

 https://bitdash-a.akamaihd.net/content/sintel/hls/video/250kbit.m3u8
 --------------------------------------------------------------------------
 #EXTM3U
 #EXT-X-MEDIA-SEQUENCE:0
 #EXT-X-TARGETDURATION:2

 #EXTINF:2,
 250kbit/seq-0.ts
 #EXTINF:2,
 250kbit/seq-1.ts
 #EXTINF:2,
 250kbit/seq-2.ts
 #EXTINF:2,
 250kbit/seq-3.ts
 .............
 #EXTINF:2,
 250kbit/seq-441.ts
 #EXTINF:1,
 250kbit/seq-442.ts
 #EXTINF:2,
 250kbit/seq-443.ts

 #EXT-X-ENDLIST
 --------------------------------------------------------------------------

 */

/// AuthenticationService

struct MediaProperties {

}

struct AVItem {

}

class MetaDataResolverService {
    init(url: URL) {

    }

    func fetchMediaProperties() -> [MediaProperties] {
        return []
    }
}

class AVAssetDownloader {
    func download(url: URL) -> AVItem
}

/// when to download data
struct AVDownloadPolicy {

}


class CacheService {

    struct CacheItem {
        let id: String
        let url: String
    }

    func storeAsset() -> CacheItem? {
        return nil
    }

}


class VideoPlayService {

    let allClips: [MediaProperties]

    let downloadPolicy = AVDownloadPolicy()

    let assetDownloader: AVAssetDownloader
    let cacheService: CacheService

    var currentTime: Int

    var playbackSpeed: Float = 1.0

    init(url: URL) {
        <#statements#>
    }
}

class VideoPlayer {

    class VideoPlayerUI {
        func appendAsset()
    }

    struct VideoConfiguration {
        let defaultResolution: String
        let muteOnStart: Bool

        /*
         Other properties
         */

    }

    var configuration: VideoConfiguration

    let videoPlayerUI = VideoPlayerUI()

    let videoPlayService = VideoPlayService()

    var currentTime:  Int

    // Number of Seconds
    var timeLine: Int

    var videoAssetMap: [String: MediaProperties]

    init(url: URL, configuration: VideoConfiguration) {
        <#statements#>
    }

    func updateResolution() {}
    func jumpToTime(_ time: Int) {}

    func updatePlaybackSpeed() {}

    func changeVolume(_ index: Int) {}
}



