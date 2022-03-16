//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/16/22.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
