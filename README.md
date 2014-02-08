# CXCKeyValueObserver

## Overview

CXCKeyValueObserver is wrapping Key Value Observation (KVO) for convenience. The KVO is a super powerful mechanism in the Objective-C. However, it's little confusing. So CXCKeyValueObserver is trying to solve that problem.

## Requirements

* ARC

## Usage

For example, an implementation using KVO in some ViewController.

### Traditional implementation

```objc
@implementation XXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.someObject addObserver:self forKeyPath:@"example" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)dealloc
{
    [self.someObject removeObserver:self forKayPath:@"example"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == self.someObject) {
        if ([keyPath isEqualToString:@"example"]) {
            // do something
        }
    }
}

@end
```

### New implementation

```objc
@implementation XXViewController {
    CXCKeyValueObserver *_observer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _observer = [[CXCKeyValueObserver alloc]
                     initWithObservee:self.someObject
                           forKeyPath:@"example"
                              options:NSKeyValueObservingOptionNew
                                block:^(id observee, NSString *keyPath, NSDictionary *change) {
                                    // do something
                                }];
}

@end
```

That's all. It is easy to use with declaratory interface. CXCKeyValueObserver will call its block when observed key path value is changed, and it's automatically removed as observer when deallocated.

## Install

Use CocoaPods,

```ruby
pod 'CXCKeyValueObserver', :git => 'https://github.com/cockscomb/CXCKeyValueObserver.git'
```

## License

MIT.