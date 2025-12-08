import Foundation
import DIOFacebookAdapter

public class DIOSDKCoreLinker {
    public static let keep: Void = {
        let provider = DIOFacebookAdProvider()
        _ = DIOFacebookAdProvider.self
    }()
}
