//
//  UIGestureRecognizer+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControl+Extension.h"
/**
 * gesture事件Block
 *
 */
typedef void(^FCGestureBlock)(UIGestureRecognizer *gesture);


/**
 * Tap点击事件Block
 *
 */
typedef void(^FCTapGestureBlock)(UITapGestureRecognizer *gesture);

/**
 * Tap长按事件Block
 *
 */
typedef void(^FCLongGestureBlock)(UILongPressGestureRecognizer *gesture);

@interface UIGestureRecognizer (Extension)

/**
 *
 *    Make all gestures support block callback.
 *  This will support all kinds of gestures.
 */
@property (nonatomic, copy) FCGestureBlock fc_onGesture;

/**
 *
 *    Make tap gesture support block callback.
 */
@property (nonatomic, copy) FCTapGestureBlock fc_onTaped;

/**
 *
 *    Make long press gesture support block callback.
 */
@property (nonatomic, copy) FCLongGestureBlock fc_onLongPressed;

+ (UITapGestureRecognizer *)fc_initWithTarget:(id)target action:(FCTapGestureBlock)action;

@end
