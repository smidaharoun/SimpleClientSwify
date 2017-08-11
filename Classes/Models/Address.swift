//
//  Address.swift
//
//  Created by odc on 10/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Address: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let street = "street"
    static let city = "city"
    static let geo = "geo"
    static let suite = "suite"
    static let zipcode = "zipcode"
  }

  // MARK: Properties
  public var street: String?
  public var city: String?
  public var geo: Geo?
  public var suite: String?
  public var zipcode: String?

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
    street = json[SerializationKeys.street].string
    city = json[SerializationKeys.city].string
    geo = Geo(json: json[SerializationKeys.geo])
    suite = json[SerializationKeys.suite].string
    zipcode = json[SerializationKeys.zipcode].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = street { dictionary[SerializationKeys.street] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = geo { dictionary[SerializationKeys.geo] = value.dictionaryRepresentation() }
    if let value = suite { dictionary[SerializationKeys.suite] = value }
    if let value = zipcode { dictionary[SerializationKeys.zipcode] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.street = aDecoder.decodeObject(forKey: SerializationKeys.street) as? String
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.geo = aDecoder.decodeObject(forKey: SerializationKeys.geo) as? Geo
    self.suite = aDecoder.decodeObject(forKey: SerializationKeys.suite) as? String
    self.zipcode = aDecoder.decodeObject(forKey: SerializationKeys.zipcode) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(street, forKey: SerializationKeys.street)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(geo, forKey: SerializationKeys.geo)
    aCoder.encode(suite, forKey: SerializationKeys.suite)
    aCoder.encode(zipcode, forKey: SerializationKeys.zipcode)
  }

}
