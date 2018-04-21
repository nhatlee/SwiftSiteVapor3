import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
//    router.get("hello") { req in
//        return "Hello, world!"
//    }
//
//    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
    //Home page: about me
    router.get("") { (req) in
        return try req.view().render("homepage.html")
    }
    
    router.get("mouse") { (req) in
        return try req.view().render("MouseMove.html")
    }
    
    router.get("resume") { (req) in
        return try req.view().render("resum.html")
    }
//
//
//    router.get("form") { (req) in
//        return try req.view().render("form.html")
//    }
    
    
    ///Home
    let blog = HomeController()
    router.get("blog", use: blog.blog)
    let aboutMe = HomeController()
    router.get("aboutMe", use: aboutMe.aboutMe)
    
    
}
