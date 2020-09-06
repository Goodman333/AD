//
//  Data.swift
//  AD
//
//  Created by 佳哥无敌啦 on 2020/9/6.
//  Copyright © 2020 佳哥无敌啦. All rights reserved.
//

import Foundation

let adModel: ADModel = load("ADList.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

extension URL{
    
    static func initPercent(string: String) -> URL? {
        let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
        if let escapedString = string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) {
           print(escapedString)
            let url = URL.init(string: escapedString ?? "")
            return url
        }
        
        return nil
    }
}
