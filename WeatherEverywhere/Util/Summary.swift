//
//  Summary.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Summary: Textable {
    // MARK: - Properties
    private let content: String
    
    var description: String {
        return content
    }
    // MARK: - Methods
    init(_ content: String) {
        self.content = content
    }
}
