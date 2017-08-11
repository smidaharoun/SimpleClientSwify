//
//  Company.swift
//
//  Created by odc on 10/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Company: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let catchPhrase = "catchPhrase"
    static let name = "name"
    static let bs = "bs"
  }

  // MARK: Properties
  public var catchPhrase: String?
  public var name: String?
  public var bs: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    catchPhrase = json[SerializationKeys.catchPhrase].string
    name = json[SerializationKeys.name].string
    bs = json[SerializationKeys.bs].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = catchPhrase { dictionary[SerializationKeys.catchPhrase] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = bs { dictionary[SerializationKeys.bs] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.catchPhrase = aDecoder.decodeObject(forKey: SerializationKeys.catchPhrase) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.bs = aDecoder.decodeObject(forKey: SerializationKeys.bs) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(catchPhrase, forKey: SerializationKeys.catchPhrase)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(bs, forKey: SerializationKeys.bs)
  }

}
