import UIKit

import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping ((([String]) -> Void)))
}

class FeedViewController: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loadFeed: FeedLoader) {
        self.init()
        self.loader = loadFeed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // update UI
        }
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ((([String]) -> Void))) {
        // Do Something
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ((([String]) -> Void))) {
        // Do Something
    }
}

struct Reachability {
    static let networkAvailable = false
}

class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ((([String]) -> Void))) {
        if Reachability.networkAvailable {
            remote.loadFeed { loadedFeedItems in
                // do something
            }
        } else {
            local.loadFeed { loadedFeedItems in
                // do something
            }
        }
    }
}


