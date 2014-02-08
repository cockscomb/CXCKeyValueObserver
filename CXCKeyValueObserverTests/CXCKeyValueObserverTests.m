//
//  CXCKeyValueObserverTests.m
//  CXCKeyValueObserverTests
//
//  Created by Hiroki Kato on 2014/02/08.
//
//

#define EXP_SHORTHAND

#import "Specta.h"
#import "Expecta.h"

#import "CXCKeyValueObserver.h"

@interface CXCKeyValueObserverTestsObject : NSObject
@property (nonatomic, strong) id exampleProperty;
@end
@implementation CXCKeyValueObserverTestsObject
@end

SpecBegin(CXCKeyValueObserver)

describe(@"KeyValueObserver", ^{

    __block CXCKeyValueObservingBlock block;

    __block id gotObservee;
    __block NSString *gotKeyPath;
    __block NSDictionary *gotChange;

    __block CXCKeyValueObserverTestsObject *observee;
    __block NSString *keyPath;

    beforeEach(^{
        block = ^(id _observee, NSString *_keyPath, NSDictionary *_change) {
            gotObservee = _observee;
            gotKeyPath = _keyPath;
            gotChange = _change;
        };

        gotObservee = nil;
        gotKeyPath = nil;
        gotChange = nil;

        observee = [[CXCKeyValueObserverTestsObject alloc] init];
        keyPath = NSStringFromSelector(@selector(exampleProperty));
    });

    it(@"should call its block when the observing property changed", ^{
        CXCKeyValueObserver *observer = [[CXCKeyValueObserver alloc]
                initWithObservee:observee
                      forKeyPath:keyPath
                         options:0
                           block:block];

        observee.exampleProperty = @"exampleNewValue";

        expect(gotObservee).to.equal(observee);
        expect(gotKeyPath).to.beIdenticalTo(keyPath);
        expect(gotChange).notTo.beNil();
    });
});

SpecEnd