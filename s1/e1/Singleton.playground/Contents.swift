import UIKit

// Api Client
class ApiClient {
    static let instance = ApiClient()
    
    private init () {}
}

class MockApiClient: ApiClient {}

// Login Module
struct LoggedInUser {}

extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
}

class LoginViewController: UIViewController {
    var api = ApiClient.instance
    func didTapLoginButton() {
        api.login() { user in
            // show next screen
        }
    }
}

// Feed Module
struct FeedItem {}

class FeedViewController: UIViewController {
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    func load() {
        loadFeed? { loadedItems in
            // Update UI
        }
    }
}
