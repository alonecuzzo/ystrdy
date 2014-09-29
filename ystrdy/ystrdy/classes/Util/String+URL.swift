//
//  String+URL.swift
//  ystrdy
//
//  Created by Jabari on 9/28/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

extension String {
    var escapeStr:String {
        get{
            var raw: NSString = self
            var str = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, raw, "[].",":/?&=;+!@#$()',*", CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding))
            return str as NSString
        }
    }
}