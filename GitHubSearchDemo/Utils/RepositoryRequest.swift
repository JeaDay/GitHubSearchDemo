//
//  RepositoryRequest.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 20/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation

class RepositoryRequest: APIRequest {
    var name: String
    var method = RequestType.GET

    init(named: String) {
        name = named
    }
}
