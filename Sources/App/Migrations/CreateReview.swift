//
//	CreateReview.swift
//
//
//	Created by Pat Butler on 2023-11-07
//	Copyright © 2023 RPGVentures. All rights reserved.
//
	

import Fluent

struct CreateReview: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("reviews")
            .id()
            .field("title", .string, .required)
            .field("reviewer", .string, .required)
            .field("reviewed_product", .string, .required)
            .field("reviewed_text", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("reviews").delete()
    }
}
