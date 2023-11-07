//
//	User.swift
//
//
//	Created by Pat Butler on 2023-11-03
//	Copyright © 2023 RPGVentures. All rights reserved.
//
	

import Fluent
import Foundation
import Vapor

final class User: Model, Content {
    
    /*
     It is convention that the get-only schema property here is a pluralized version of the class name. 
     The actual database schema is defined by the migrations in Vapor.
     */
    static let schema = "users"
 
    /*
     All models must have an 'id' property using the @ID property wrapper
     This filed uniquely identifies instances of your model. My current understanding is that it is important
     to put ID's as far up the call stack as possible so that you app remains performant and flexible.
     Depending on the database chosen, it may also be generating an ID on their instances of models automatically.
     */
    
    @ID(key: .id)
    var id: UUID?
    
    /*
     The @Field propert wrapper is a requirement to explicitly define the database key.
     It is not required that the properties of the database be explicitly defined. Fluent reccomends that
     you use snake_case for the database keys and camelCase for the property names.
     Fileds will be used to perform filtered queries or update specific individual fields in a database model.
     */
    
    @Field(key: "first_name")
    var firstName: String
    
    @Field(key: "last_name")
    var lastName: String
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "password")
    var password: String
    
    /*
     You can use the @OptionalField property wrapper to mark generic columns of a database model.
     These will be used to perform filtered queries as well, but obviously can be empty.
     */
    
    @OptionalField(key: "has_role")
    var hasRole: Bool?
    
    /*
     @Timestamp is a special type of Field that stores a <code>Foundation.Date<code>.
     */
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "last_online", on: .update)
    var lastOnline: Date?
    
    @Timestamp(key: "on_delete", on: .delete)
    var softDelete: Date?
    
    /*
     Required by Fluent - its just an empty initializer
     */
    
    init() { }
    
    /*
     Any convenience initializers can be put here
     */
    
    init(firstName: String, lastName: String, username: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
    }
    
    init(hasRole: Bool?) {
        self.hasRole = hasRole
    }
}
