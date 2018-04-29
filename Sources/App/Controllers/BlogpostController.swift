//
//  BlogpostController.swift
//  App
//
//  Created by nhatlee on 4/25/18.
//

import Vapor
import Foundation

struct ExampleData: Codable {
    var array : [Int]
    var dict : [String : String]
}

var content = ""

final class BlogpostController {
    func loadUploadForm(_ req: Request) throws -> Future<View> {
        return try req.view().render("uploadPost.leaf")
    }
    
//    func index(_ req: Request) throws -> Future<[BlogModel]> {
//        return BlogModel.query(on: req).all()
//    }
    
//    func newpost(_ reqest: Request) throws -> Future<View> {
//        if(content.count == 0){
//        self.getContent(req: reqest) { (_content) in
//
//             content = _content
//
//        }
//        }
//       return try reqest.view().render("newpost.leaf", ["post":"<h1>The template Tag</h1>"])
//    }
//

    
//    func getContent(req:Request, callback: @escaping (String) -> ()) {
//       let _ = BlogModel.query(on: req).first().map(to: BlogModel.self) { (blog) -> (BlogModel) in
//            callback((blog?.content)!)
//            return blog!
//        }
//    }
    func newpost(_ request: Request) -> Future<View> {
        return getContent(req: request).flatMap(to: View.self) { content in
            try request.view().render("newpost.leaf", ["post": content])
        }
    }
    
    func getContent(req: Request) -> Future<String> {
        return BlogModel.query(on: req)
            .first()
            .map(to: String.self) { $0!.title }
    }
    
    
    /// Saves a decoded `BlogModel` to the database.
    func create(_ req: Request) throws -> Future<BlogModel> {
        return try req.content.decode(BlogModel.self).flatMap(to: BlogModel.self) { blogpost in
            return blogpost.save(on: req)
        }
    }
    
    /// Deletes a parameterized `BlogModel`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(BlogModel.self).flatMap(to: Void.self) { blogpost in
            return blogpost.delete(on: req)
            }.transform(to: .ok)
    }
    
}
