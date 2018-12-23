//
//  NSCoder.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 23/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation

extension NSCoder {

    //TODO Adapt this to iOS 12
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}
