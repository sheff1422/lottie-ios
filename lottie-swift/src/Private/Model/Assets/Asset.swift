//
//  Asset.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/9/19.
//

import Foundation

public class Asset: NSObject, Codable, NSCoding {
  
  /// The ID of the asset
  let id: String
  
  private enum CodingKeys : String, CodingKey {
    case id = "id"
  }
  
  required public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Asset.CodingKeys.self)
    if let id = try? container.decode(String.self, forKey: .id) {
      self.id = id
    } else {
      self.id = String(try container.decode(Int.self, forKey: .id))
    }
  }
    
    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        guard let id: String = aDecoder.decode(forKey: "id") else { NSException.raise(NSExceptionName.parseErrorException, format: "Key '%@' not found.", arguments: getVaList(["id"])); fatalError() }; self.id = id
    }

    /// :nodoc:
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
    }
}
