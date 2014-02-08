//
//  CXCKeyValueObserver.h
//  CXCKeyValueObserver
//
//  Created by Hiroki Kato on 2014/02/08.
//
//

#import <Foundation/Foundation.h>

typedef void (^CXCKeyValueObservingBlock) (id observee, NSString *keyPath, NSDictionary *change);

@interface CXCKeyValueObserver : NSObject

- (instancetype)initWithObservee:(id)observee forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(CXCKeyValueObservingBlock)block;

@end
