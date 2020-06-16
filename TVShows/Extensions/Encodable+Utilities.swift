//
//  Encodable+Utilities.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-12.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

extension Encodable {
  var asQueryItems: [URLQueryItem]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    return dict?.map { URLQueryItem(name: $0.key, value: $0.value as? String)}
  }
}
