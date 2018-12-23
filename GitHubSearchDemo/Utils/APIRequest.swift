//
//  APIRequest.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 20/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

protocol APIRequest {
    var method: RequestType { get }
    var name: String { get }
}

public enum RequestType: String {
    case GET, POST
}
