//
//  User.swift
//
//  Created by odc on 10/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class User: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let email = "email"
        static let id = "id"
        static let website = "website"
        static let address = "address"
        static let phone = "phone"
        static let company = "company"
        static let username = "username"
    }
    
    // MARK: Properties
    public var name: String?
    public var email: String?
    public var id: Int?
    public var website: String?
    public var address: Address?
    public var phone: String?
    public var company: Company?
    public var username: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    public class func modelsFromJSONArray(array:NSArray) -> [User]
    {
        var models:[User] = []
        for item in array {
            models.append(User(json: item as! JSON))
        }
        return models
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        name = json[SerializationKeys.name].string
        email = json[SerializationKeys.email].string
        id = json[SerializationKeys.id].int
        website = json[SerializationKeys.website].string
        address = Address(json: json[SerializationKeys.address])
        phone = json[SerializationKeys.phone].string
        company = Company(json: json[SerializationKeys.company])
        username = json[SerializationKeys.username].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = website { dictionary[SerializationKeys.website] = value }
        if let value = address { dictionary[SerializationKeys.address] = value.dictionaryRepresentation() }
        if let value = phone { dictionary[SerializationKeys.phone] = value }
        if let value = company { dictionary[SerializationKeys.company] = value.dictionaryRepresentation() }
        if let value = username { dictionary[SerializationKeys.username] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.website = aDecoder.decodeObject(forKey: SerializationKeys.website) as? String
        self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? Address
        self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? String
        self.company = aDecoder.decodeObject(forKey: SerializationKeys.company) as? Company
        self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(email, forKey: SerializationKeys.email)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(website, forKey: SerializationKeys.website)
        aCoder.encode(address, forKey: SerializationKeys.address)
        aCoder.encode(phone, forKey: SerializationKeys.phone)
        aCoder.encode(company, forKey: SerializationKeys.company)
        aCoder.encode(username, forKey: SerializationKeys.username)
    }
    
}
