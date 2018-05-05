//
//  BlogpostController.swift
//  App
//
//  Created by nhatlee on 4/25/18.
//

import Vapor
import Foundation

//struct ExampleData: Codable {
//    var array : [Int]
//    var dict : [String : String]
//}


//final class BlogpostController {
////    func loadUploadForm(_ req: Request) throws -> Future<View> {
////        return try req.view().render("uploadPost.leaf")
////    }
////
////
////    func newpost(_ request: Request) -> Future<View> {
////        return getContent(req: request).flatMap(to: View.self) { content in
////            try request.view().render("newpost.leaf", ["post": content])
////        }
////    }
//    
////    func getContent(req: Request) -> Future<String> {
////        return BlogModel.query(on: req)
////            .first()
////            .map(to: String.self) { $0!.title }
////    }
////
////
////    /// Saves a decoded `BlogModel` to the database.
////    func create(_ req: Request) throws -> Future<BlogModel> {
////        return try req.content.decode(BlogModel.self).flatMap(to: BlogModel.self) { blogpost in
////            return blogpost.save(on: req)
////        }
////    }
////
////    /// Deletes a parameterized `BlogModel`.
////    func delete(_ req: Request) throws -> Future<HTTPStatus> {
////        return try req.parameters.next(BlogModel.self).flatMap(to: Void.self) { blogpost in
////            return blogpost.delete(on: req)
////            }.transform(to: .ok)
////    }
//    
//}
