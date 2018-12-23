//
//  JSONLoader.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation
@testable import GitHubSearchDemo

final class JSONLoader {

    private func loadString(fileName: String, type: String) -> String {
        let bundle = Bundle.main
        let path = bundle.path(forResource: fileName, ofType: type)
        return try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
    }

    private func loadData(fileName: String, type: String) -> Data {
        return Data(loadString(fileName: fileName,
                               type: type).utf8)
    }

    func loadRepositories(fileName: String, type: String) -> Repositories? {
        let data = loadData(fileName: fileName,
                            type: type)
        do {
            let model: Repositories = try JSONDecoder().decode(Repositories.self, from: data)
            return model
        } catch _ {
            return nil
        }
    }
}
