import UIKit

var str = "https://www.swiftbysundell.com/posts/observers-in-swift-part-1"

class AudioPlayer {
    private var state = State.idle {
        // We add a property observer on 'state', which lets us
        // run a function on each value change.
        didSet { stateDidChange() }
    }
    
    private var observations = [ObjectIdentifier: Observation]
    private let notificationCenter: NotificationCenter
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }
    
    func play(_ item: Item) {
        state = .playing(item)
        startPlayback(with: item)
    }
    
    func pause() {
        switch state {
        case .idle, .paused:
            // Calling pause when we're not in a playing state
            // could be considered a programming error, but since
            // it doesn't do any harm, we simply break here.
            break
        case .playing(let item):
            state = .paused(item)
            pausePlayback()
        }
    }
    
    func stop() {
        state = .idle
        stopPlayback()
    }
}

private extension AudioPlayer {
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
}

extension Notification.Name {
    static var playbackStarted: Notification.Name {
        return .init("AudioPlayer.playbackStarted")
    }
    
    static var playbackPaused: Notification.Name {
        return .init("AudioPlayer.playbackPaused")
    }
    
    static var playbackStopped: Notification.Name {
        return .init("AudioPlayer.playbackStopped")
    }
}

private extension AudioPlayer {
    func stateDidChange() {
        for (id, observation) in observations {
            // If the observer is no longer in memory, we
            // can clean up the observation for its ID
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            
            switch state {
            case .idle:
                observer.audioPlayerDidStop(self)
            case .playing(let item):
                observer.audioPlayer(self, didStartPlaying: item)
            case .paused(let item):
                observer.audioPlayer(self, didPausePlaybackOf: item)
            }
        }
    }
}
    
    protocol AudioPlayerObserver: class {
        func audioPlayer(_ player: AudioPlayer, didStartPlaying item: AudioPlayer.Item)
        func audioPlayer(_ player: AudioPlayer, didPausePlaybackOf item: AudioPlayer.Item)
        func audioPlayer(_ player: AudioPlayer)
    }
    
    extension AudioPlayerObserver {
        func audioPlayer(_ player: AudioPlayer, didStartPlaying item: AudioPlayer.Item) {}
        func audioPlayer(_ player: AudioPlayer, didPausePlaybackOf item: AudioPlayer.Item) {}
        func audioPlayer(_ player: AudioPlayer) {}
    }
    private extension AudioPlayer {
        struct Observation {
            weak var observer: AudioPlayerObserver?
        }
}

extension AudioPlayer {
    func addObserver(_ observer: AudioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }
    
    func removeObserver(_ observer: AudioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }
}

class NowPlayingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        player.addObserver(self)
    }
}

extension NowPlayingViewController: AudioPlayerObserver {
    func audioPlayer(_ player: AudioPlayer,
                     didStartPlaying item: AudioPlayer.Item) {
        titleLabel.text = item.title
        durationLabel.text = "\(item.duration)"
    }
}
