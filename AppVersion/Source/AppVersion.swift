//
//  AppVersion.swift
//  AppVersion
//

import UIKit

/// Provides a set of available version formats
public enum VersionFormat: String {
    /// Short format `<Version>`: **1.1**
    case short

    /// Short format name `<Name> <Version>`: **App Name 1.1**
    case shortWithName

    /// Long format `<Version> <(Build)>`: **1.1 (42)**
    case long

    /// Short format name `<Name> <Version> <(Build)>`: **App Name 1.1 (42)**
    case longWithName
}

public struct AppVersion {
    // swiftlint:disable line_length
    private static let name = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String ?? "AppVersion"
    private static let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.1"
    private static let build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "42"
    public static let identifier = Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String ?? "co.ameba.AppVersion"

    /// Short version format `<Version>`: **1.1**
    public static var shortVersion: String {
        return version
    }

    /// Short version format with name `<Name> <Version>`: **App Name 1.1**
    public static var shortVersionWithName: String {
        return "\(name) \(shortVersion)"
    }

    /// Long version format with name `<Version> (<Build>)`: **1.1 (42)**
    public static var longVersion: String {
        return "\(version) (\(build))"
    }

    /// Long version format with name `<Name> <Version> (<Build>)`: **App Name 1.1 (42)**
    public static var longVersionWithName: String {
        return "\(name) \(longVersion)"
    }

    /**
     Creates a version string, based on provided format

     - Parameters:
        - format: Version format

     - Returns: Formatted version string
     */
    public static func version(with format: VersionFormat) -> String {
        switch format {
        case .short:
            return shortVersion
        case .shortWithName:
            return shortVersionWithName
        case .long:
            return longVersion
        case .longWithName:
            return longVersionWithName
        }
    }

    ///Checks if current version of the App is the latest one
    public static func isUpdateAvailable(completion: @escaping (Bool?, Error?) -> Void) throws -> URLSessionDataTask {
        // swiftlint:disable nesting
        enum AppVersionError: Error {
            case invalidResponse, invalidBundleInfo
        }

        guard let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
            throw AppVersionError.invalidBundleInfo
        }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
                if let error = error {
                    throw error
                }
                guard let data = data else {
                    throw AppVersionError.invalidResponse
                }

                let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any]

                guard let result = (json?["results"] as? [Any])?.first as? [String: Any],
                      let appStoreVersion = result["version"] as? String else {
                    throw AppVersionError.invalidResponse
                }
                completion(appStoreVersion != version, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
        return task
    }
}
