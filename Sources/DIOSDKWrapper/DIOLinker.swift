import Foundation
import FBAudienceNetwork
import DIOFacebookAdapter

public enum DIOSDKLinker {
    static let fb = FBAudienceNetworkAds.self
    static let adapter = DIOFacebookAdProvider.self
}
