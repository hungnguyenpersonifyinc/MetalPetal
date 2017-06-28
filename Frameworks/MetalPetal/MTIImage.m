//
//  MTIImage.m
//  Pods
//
//  Created by YuAo on 25/06/2017.
//
//

#import "MTIImage.h"

@interface MTIImage ()

@end

@implementation MTIImage

- (instancetype)initWithPromise:(id<MTIImagePromise>)promise {
    MTLSamplerDescriptor *samplerDescriptor = [[MTLSamplerDescriptor alloc] init];
    samplerDescriptor.minFilter = MTLSamplerMipFilterLinear;
    samplerDescriptor.magFilter = MTLSamplerMipFilterLinear;
    samplerDescriptor.sAddressMode = MTLSamplerAddressModeClampToZero;
    samplerDescriptor.tAddressMode = MTLSamplerAddressModeClampToZero;
    return [self initWithPromise:promise samplerDescriptor:samplerDescriptor];
}

- (instancetype)initWithPromise:(id<MTIImagePromise>)promise samplerDescriptor:(MTLSamplerDescriptor *)samplerDescriptor {
    if (self = [super init]) {
        _promise = [promise copyWithZone:nil];
        _extent = CGRectMake(0, 0, _promise.textureDescriptor.width, _promise.textureDescriptor.height);
        _samplerDescriptor = [samplerDescriptor copy];
    }
    return self;
}

- (instancetype)imageWithSamplerDescriptor:(MTLSamplerDescriptor *)samplerDescriptor {
    MTIImage *image = [[MTIImage alloc] initWithPromise:self.promise];
    if (image) {
        image -> _samplerDescriptor = samplerDescriptor;
    }
    return image;
}

- (CGSize)size {
    return self.extent.size;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end