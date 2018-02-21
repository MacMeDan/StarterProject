//
//  Bundle.swift
//  starterProject
//
//  Created by Dan Leonard on 11/14/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation

extension Bundle {
    /// - Tag: Bundle
    var releaseVersionNumber: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
    
}
