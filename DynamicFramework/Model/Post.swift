//
//  Post.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 04/02/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit


struct Comment : Codable{
    var title  : String
}

struct Post : Codable{
    var id: Int
    var body: String?
    var userId : Int
    var title  : String
    var comments: [Comment]?
}
