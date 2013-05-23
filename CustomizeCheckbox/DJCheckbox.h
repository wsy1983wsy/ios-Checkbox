//
//  DJCheckbox.h
//  CustomizeCheckbox
//
//  Created by wang songye on 13-5-22.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJChekboxDelegate.h"
//状态
typedef enum {
    DJCheckboxChecked,
    DJCheckboxUnchecked
}DJcheckboxState;

typedef  enum {
    DJCheckboxTextAlignmentLeft,
    DJCheckboxTextAlignmentRight
}DJCheckboxTextAlignment;

@interface DJCheckbox : UIControl
@property (strong, nonatomic) UIImageView *checkboxImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) DJcheckboxState checkState;
@property (assign, nonatomic) DJCheckboxTextAlignment textAlignment;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIFont *textFont;
@property (assign, nonatomic) CGRect imageSize;
@property (strong, nonatomic) id<DJChekboxDelegate> delegate;
- (id)init;
- (id)initWithTitle:(NSString *)title;
- (id)initWithFrame:(CGRect)frame;
- (void)setState:(DJcheckboxState)state;
- (void)autoFitWidthToText;
- (void)autoFitFontToHeight;
- (void)toggleState;
- (void)setTextAlignment:(DJCheckboxTextAlignment)textAlignment;
- (void)setTitle:(NSString *)title;
- (float)getNeededHeight;
- (float)getNeededWidth;
@end
