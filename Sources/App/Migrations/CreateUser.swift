//
//	CreateUser.swift
//
//
//	Created by Pat Butler on 2023-11-03
//	Copyright © 2023 RPGVentures. All rights reserved.
//
	

import Fluent

struct CreateUser: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string, .required)
            .field("password", .string, .required)
            .field("first_name", .string)
            .field("last_name", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}
