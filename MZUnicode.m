//
//  MZUnicode.m
//
//

#import "MZUnicode.h"
#import <objc/runtime.h>

static inline void MZ_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSString (MZUnicode)

- (NSString *)stringByReplaceUnicode {
    NSMutableString *convertedString = [self mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end

@implementation NSArray (MZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        MZ_swizzleSelector(class, @selector(description), @selector(MZ_description));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(MZ_descriptionWithLocale:));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(MZ_descriptionWithLocale:indent:));
    });
}

- (NSString *)MZ_description {
    return [[self MZ_description] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale {
    return [[self MZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self MZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSDictionary (MZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        MZ_swizzleSelector(class, @selector(description), @selector(MZ_description));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(MZ_descriptionWithLocale:));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(MZ_descriptionWithLocale:indent:));
    });
}

- (NSString *)MZ_description {
    return [[self MZ_description] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale {
    return [[self MZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self MZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSSet (MZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        MZ_swizzleSelector(class, @selector(description), @selector(MZ_description));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(MZ_descriptionWithLocale:));
        MZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(MZ_descriptionWithLocale:indent:));
    });
}

- (NSString *)MZ_description {
    return [[self MZ_description] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale {
    return [[self MZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)MZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self MZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

