//
//  NSURLConnection+RACSignal.swift
//  ystrdy
//
//  Created by Jabari on 9/1/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

//would rather use a struct, but can't pass it around as anyobject... just going to leave this for now
class ystrdy_RACTuple {
    let response: NSURLResponse
    let data: NSData
    
    init(response: NSURLResponse, data: NSData) {
        self.response = response
        self.data = data
    }
}

extension NSURLConnection {

    //write the send asynchronous extension in swift here
    class func ystrdy_sendAsynchronously(request: NSURLRequest) -> RACSignal {
        return RACSignal.createSignal {
            (subscriber: RACSubscriber!) -> RACDisposable! in
            var queue = NSOperationQueue()
            queue.name = "alonecuzzo.com.github.ReactiveCocoa.NSURLConnectionRACSupport"
            
            NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: {
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if response == nil && data == nil {
                    subscriber.sendError(error)
                } else {
                    subscriber.sendNext(ystrdy_RACTuple(response: response, data: data))
                    subscriber.sendCompleted()
                }
            })
            
            return RACDisposable.disposableWithBlock({
                () -> Void in
                queue.suspended = true
                queue.cancelAllOperations()
            }) as RACDisposable
        }
    }
}

