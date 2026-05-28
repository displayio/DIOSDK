import Foundation
import FBAudienceNetwork

public class DIOSDKLinker {
    public static let keep: Void = {
        let fbSDK = FBAudienceNetworkAds()
        _ = FBAudienceNetworkAds.self
    }()
}
