import Foundation

extension URL {
    var isTUFLabUpdateHandoff: Bool {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              components.scheme?.lowercased() == "https",
              components.host?.lowercased() == "tuflab.horimiya.top",
              components.port == 8443,
              components.user == nil,
              components.password == nil,
              components.query == nil,
              components.fragment == nil
        else { return false }

        return components.percentEncodedPath.range(
            of: #"^/api/update/ios/handoff/[A-Za-z0-9_-]{43}$"#,
            options: .regularExpression
        ) != nil
    }
}
