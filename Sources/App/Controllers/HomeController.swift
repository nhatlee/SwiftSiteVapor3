//
//  HomeController.swift
//  App
//
//  Created by nhatlee on 4/21/18.
//

import Vapor

final class HomeController {
    func aboutMe (_ req: Request) throws -> Future<View>{
        return try req.view().render("aboutme.leaf")
    }
    
    func blog(_ req: Request) throws -> Future<View>{
        return try req.view().render("form.html")
    }
}
