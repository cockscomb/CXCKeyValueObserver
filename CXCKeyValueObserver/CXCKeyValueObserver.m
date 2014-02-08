#import "CXCKeyValueObserver.h"

@interface CXCKeyValueObserver ()
@property (nonatomic, strong) id observee;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic) NSKeyValueObservingOptions options;
@property (nonatomic, copy) CXCKeyValueObservingBlock block;
@end

@implementation CXCKeyValueObserver

static void * Context = &Context;

#pragma mark - initialize

- (instancetype)initWithObservee:(id)observee forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(CXCKeyValueObservingBlock)block
{
    self = [super init];
    if (self) {
        self.observee = observee;
        self.keyPath = keyPath;
        self.options = options;
        self.block = block;
        [self.observee addObserver:self forKeyPath:keyPath options:options context:Context];
    }
    return self;
}

#pragma mark - deallocate

- (void)dealloc
{
    [self.observee removeObserver:self forKeyPath:self.keyPath context:Context];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == Context) {
        self.block(object, keyPath, change);
    }
}

#pragma mark - description

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.observee=%@", self.observee];
    [description appendFormat:@", self.keyPath=%@", self.keyPath];
    [description appendFormat:@", self.options=%d", self.options];
    [description appendFormat:@", self.block=%p", self.block];
    [description appendString:@">"];
    return description;
}

@end
