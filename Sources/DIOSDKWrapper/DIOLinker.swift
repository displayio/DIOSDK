import Foundation
import FBAudienceNetwork
import DIOFacebookAdapter

public class DIOSDKLinker {
    public static let keep: Void = {
        let provider = DIOFacebookAdProvider()
        let fbSDK = FBAudienceNetworkAds()
        _ = DIOFacebookAdProvider.self
        _ = FBAudienceNetworkAds.self
    }()
}
