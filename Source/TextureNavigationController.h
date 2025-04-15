//
//  TextureNavigationController.h
//  Texture
//
//  Copyright (c) Facebook, Inc. and its affiliates.  All rights reserved.
//  Changes after 4/13/2017 are: Copyright (c) Pinterest, Inc.  All rights reserved.
//  Licensed under Apache 2.0: http://www.apache.org/licenses/LICENSE-2.0
//

#import <UIKit/UIKit.h>

#import <AsyncDisplayKit/ASVisibilityProtocols.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * TextureNavigationController
 *
 * @discussion TextureNavigationController is a drop in replacement for UINavigationController
 * which improves memory efficiency by implementing the @c ASManagesChildVisibilityDepth protocol.
 * You can use TextureNavigationController with regular UIViewControllers, as well as ASDKViewControllers. 
 * It is safe to subclass or use even where AsyncDisplayKit is not adopted.
 *
 * @see ASManagesChildVisibilityDepth
 */
@interface TextureNavigationController : UINavigationController <ASManagesChildVisibilityDepth>

@end

NS_ASSUME_NONNULL_END
