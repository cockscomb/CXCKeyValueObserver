#import <Foundation/Foundation.h>

/**
 *  Block invoked when KVO fired.
 *
 *  @param observee The observed object.
 *  @param keyPath  The observing keyPath.
 *  @param change   A dictionary describing the changes.
 *
 *  @return `void`.
 */
typedef void (^CXCKeyValueObservingBlock) (id observee, NSString *keyPath, NSDictionary *change);

/**
 *  Observer using KVO.
 */
@interface CXCKeyValueObserver : NSObject

/**
 *  Basic initialization.
 *
 *  @param observee An object observed.
 *  @param keyPath  The keyPath for observing.
 *  @param options  `NSKeyValueObservingOptions`.
 *  @param block    The block invoked when KVO fired.
 *
 *  @return Initialized instance of CXCKeyValueObserver.
 */
- (instancetype)initWithObservee:(id)observee forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(CXCKeyValueObservingBlock)block;

@end
