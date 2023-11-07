//
//	Review.swift
//
//
//	Created by Pat Butler on 2023-11-07
//	Copyright © 2023 RPGVentures. All rights reserved.
//
	

import Fluent
import Vapor

final class Review: Model, Content {
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "reviewer")
    var reviewer: String
    
    @Field(key: "reviewed_product")
    var reviewedProduct: String  // perhaps make this a Product model?
    
    @Field(key: "review_text")
           var reviewText: String
    
    @OptionalField(key: "rating")
    var rating: Int?
    
    @OptionalField(key: "likes")
    var likes: Int?
    
    init() { }
    
    init(title: String, reviewer: String, reviewedProduct: String) {
        self.title = title
        self.reviewer = reviewer
        self.reviewedProduct = reviewedProduct
        
    }
    
    init(rating: Int?) {
        self.rating = rating
    }
    
    init(likes: Int?) {
        self.likes = likes
    }
}
