//
//  json.swift
//  ystrdy
//
//  Created by Jabari on 9/28/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

// taken from: http://www.nsscreencast.com/episodes/130-swift-json-redux-part-1

import Foundation

enum JSValue {
    
    case JSArray([JSValue])
    case JSObject([String : JSValue])
    case JSNumber(Double)
    case JSString(String)
    case JSBool(Bool)// nothing for this as of yet, he was saying that there was a complication
    case JSNull()
    
    static func decode(data: NSData) -> JSValue? {
        var error: NSError?
        var options: NSJSONReadingOptions = .AllowFragments
        let object: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: options, error: &error)
        
//        println("json \(object)")
        
        if let json: AnyObject = object {
            return make(json as NSObject)
        } else{
            println("Couldn't parse JSON")
            return nil
        }
    }
    
    static func make(obj: NSObject) -> JSValue {
        switch obj {
            case let s as NSString: return .JSString(s)
            case let n as NSNumber: return .JSNumber(n)
            case let null as NSNull: return .JSNull()
            case let a as NSArray: return makeArray(a)
            case let d as NSDictionary: return makeObject(d)
            default:
                println("Unhandled type <\(obj)>")
                abort()
        }
    }
    
    static func makeArray(array: NSArray) -> JSValue {
        var items = Array<JSValue>()
        for obj in array {
            let jsValue = make(obj as NSObject)
            items.append(jsValue)
        }
        return .JSArray(items)
    }
    
    static func makeObject(dict: NSDictionary) ->JSValue {
        var object = Dictionary<String, JSValue>()
        for (key, value) in dict {
            object[key as String] = make(value as NSObject)
        }
        return .JSObject(object)
    }
}

protocol JSONDecode {
    typealias J
    class func fromJSON(j: JSValue) -> J?
}

class JSInt: JSONDecode {
    typealias J = Int
    class func fromJSON(j: JSValue) -> J? {
        switch j {
            case let .JSNumber(n): return Int(n)
            default: return nil
        }
    }
}

class JSDouble: JSONDecode {
    typealias J = Double
    class func fromJSON(j: JSValue) -> J? {
        switch j {
            case let .JSNumber(n): return Double(n)
            default: return nil
        }
    }
}

class JSString: JSONDecode {
    typealias J = String
    class func fromJSON(j: JSValue) -> J? {
        switch j {
            case let .JSString(s): return s
            default: return nil
        }
    }
}