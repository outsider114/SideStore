import Foundation

@main
struct TUFLabUpdateHandoffCheck {
    static func main() {
        let token = String(repeating: "a", count: 43)
        let valid = "https://tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)"
        precondition(URL(string: valid)!.isTUFLabUpdateHandoff)

        [
            "http://tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)",
            "https://example.com:8443/api/update/ios/handoff/\(token)",
            "https://tuflab.horimiya.top/api/update/ios/handoff/\(token)",
            "https://tuflab.horimiya.top:8443/api/update/ios/latest/\(token)",
            "https://tuflab.horimiya.top:8443/api//update/ios/handoff/\(token)",
            "https://tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)/",
            "https://tuflab.horimiya.top:8443/api/update/ios/handoff/short",
            "https://tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)?auto=true",
            "https://user@tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)",
            "https://tuflab.horimiya.top:8443/api/update/ios/handoff/\(token)#install",
        ].forEach { precondition(!URL(string: $0)!.isTUFLabUpdateHandoff, $0) }
    }
}
