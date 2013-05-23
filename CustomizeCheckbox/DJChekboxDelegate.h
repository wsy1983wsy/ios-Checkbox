//
//  DJChekboxDelegate.h
//  CustomizeCheckbox
//
//  Created by wang songye on 13-5-22.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DJChekboxDelegate <NSObject>
//状态修改回调 state：新状态， tag：checkbox的tag，标记各个checkbox，如果不需要可以设定为0
- (void)checkboxCheckedChange:(int)state byTag:(int)tag;
@end
