//
//  ADModel.swift
//  AD
//
//  Created by 佳哥无敌啦 on 2020/9/6.
//  Copyright © 2020 佳哥无敌啦. All rights reserved.
//

import Foundation

struct ADModel: Decodable {
    var total: Int?
    var rows: [ADDetailModel]?
    
}

struct ADDetailModel: Decodable {
    var id: Int?
    var source: String?
    var cate: Int?
    var vedioType: String?
    var title: String?
    var url: String?
    var image: String?
    var status: Int?
    var createTime: String?
}
