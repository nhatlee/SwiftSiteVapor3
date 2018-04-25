//
//  BlogpostController.swift
//  App
//
//  Created by nhatlee on 4/25/18.
//

import Vapor

final class BlogpostController {
    func index(_ req: Request) throws -> Future<[BlogModel]> {
        return BlogModel.query(on: req).all()
    }
    
    /// Saves a decoded `BlogModel` to the database.
    func create(_ req: Request) throws -> Future<BlogModel> {
        return try req.content.decode(BlogModel.self).flatMap(to: BlogModel.self) { blogpost in
            return blogpost.save(on: req)
        }
    }
    
    /// Deletes a parameterized `BlogModel`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameter(BlogModel.self).flatMap(to: Void.self) { blogpost in
            return blogpost.delete(on: req)
            }.transform(to: .ok)
    }
}
