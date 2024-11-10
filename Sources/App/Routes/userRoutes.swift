//
//  File.swift
//  BackendSwiftVapor
//
//  Created by Jaime Serrano on 10/11/24.
//

import Foundation
import Vapor

private var users = [User(id: 1, name: "Jaime", age: 23, email: "jaime.serrano2001@gmail.com"),
                     User(id: 2, name: "Jose", age: 25, email: "josedserranoœgmail.com")]

func userroutes(_ app: Application)  throws{
    
    app.group("user") { user in
        user.get { request -> [User] in
            return users
        }
        user.get(":id"){ req -> User in
            guard let id = req.parameters.get("id", as: Int.self) else {
                throw Abort(.badRequest)
            }
            guard let user = users.first(where: { user in
                user.id == id
            })else {
                throw Abort(.notFound)
            }
            return user
        }
        user.post { req in
            let user = try req.content.decode(User.self)
            users.append(user)
            return HTTPStatus.ok}
    }
}
