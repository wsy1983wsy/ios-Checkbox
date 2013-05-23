//
//  DJCheckbox.m
//  CustomizeCheckbox
//
//  Created by wang songye on 13-5-22.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import "DJCheckbox.h"

#define kCheckedImage   @"checkbox_checked.png"
#define kUnCheckedImage @"checkbox_normal.png"

@implementation DJCheckbox
@synthesize checkboxImageView;
@synthesize titleLabel;
@synthesize checkState;
@synthesize textAlignment;
@synthesize textColor;
@synthesize textFont;
@synthesize imageSize;
@synthesize delegate;

- (id)init{
    UIImage *image = [UIImage imageNamed:kUnCheckedImage];
    imageSize = CGRectMake(0, 0, image.size.width, image.size.height);
    self =  [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    return self;
}

- (id)initWithTitle:(NSString *)title{
    UIImage *image = [UIImage imageNamed:kUnCheckedImage];
    imageSize = CGRectMake(0, 0, image.size.width, image.size.height);
    self = [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if(self){
        titleLabel.text = title;
        [self autoFitWidthToText];
        [self layoutSubviews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        checkState = DJCheckboxUnchecked;
        textAlignment = DJCheckboxTextAlignmentRight;
        textColor = [UIColor blackColor];
        textFont = [UIFont systemFontOfSize:20.0f];
        
        UIImage *image = [UIImage imageNamed:kUnCheckedImage];
        checkboxImageView = [[UIImageView alloc]initWithImage:image];
        checkboxImageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [checkboxImageView sizeToFit];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(image.size.width + 2,0, 100, image.size.height)];
        titleLabel.textColor = textColor;
        titleLabel.font = textFont;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:checkboxImageView];
        [self addSubview:titleLabel];
        self.clipsToBounds = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//调整titlelabe的font大小
- (void)autoFitFontToHeight{
    CGFloat height = self.frame.size.height;
    CGFloat fontSize = 20;
    CGFloat tempHeight = MAXFLOAT;
    do{
        fontSize -= 1;
        UIFont *font = [UIFont fontWithName:titleLabel.font.fontName size:fontSize];
        //Get size
        CGSize labelSize = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" sizeWithFont:font];
        tempHeight = labelSize.height;
    }while (tempHeight >= height);
    titleLabel.font = [UIFont fontWithName:titleLabel.font.fontName size:fontSize];
}

- (void)autoFitWidthToText{
    CGSize labelSize = [titleLabel.text sizeWithFont:titleLabel.font];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width + 2 + self.imageSize.size.width, self.imageSize.size.height);
    [self layoutSubviews];
}

- (void)layoutSubviews{
    //文字在左边
    if(textAlignment == DJCheckboxTextAlignmentLeft){
        titleLabel.frame = CGRectMake(0, 0, self.frame.size.width - 2 - imageSize.size.width, self.frame.size.height);
        checkboxImageView.frame = CGRectMake(self.frame.size.width - imageSize.size.width, 0, imageSize.size.width, imageSize.size.height);
    } else {
        titleLabel.frame = CGRectMake(imageSize.size.width + 2, 0, self.frame.size.width - 2 - imageSize.size.width, self.frame.size.height);
        checkboxImageView.frame = CGRectMake(0, 0, imageSize.size.width, imageSize.size.height);
    }
}

- (void)setState:(DJcheckboxState)state{
    checkState = state;
    UIImage *image = [UIImage imageNamed:kCheckedImage];
    if(state == DJCheckboxUnchecked){
        image = [UIImage imageNamed:kUnCheckedImage];
    }
    [checkboxImageView setImage:image];
    
    if(delegate){
        [delegate checkboxCheckedChange:checkState byTag:self.tag];
    }
}

- (void)toggleState{
    if(checkState == DJCheckboxUnchecked){
        checkState = DJCheckboxChecked;
    } else {
        checkState = DJCheckboxUnchecked;
    }
    [self setState:checkState];
}

- (void)setTextAlignment:(DJCheckboxTextAlignment)alignment{
    textAlignment = alignment;
    [self autoFitWidthToText];
    [self layoutSubviews];
}

-(void)setTitle:(NSString *)title{
    titleLabel.text = title;
    [self autoFitWidthToText];
    [self layoutSubviews];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    [self toggleState];
    return YES;
}

- (float)getNeededHeight{
    float height = imageSize.size.height;
    UIFont *font = [UIFont fontWithName:titleLabel.font.fontName size:20];
    NSString *title = titleLabel.text;
    CGSize labelSize;
    if(title){
        labelSize = [title sizeWithFont:font];
    } else {
        labelSize = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" sizeWithFont:font];
    }
    if(labelSize.height > height){
        height = labelSize.height;
    }
    return height;
}

- (float)getNeededWidth{
    NSString *title = titleLabel.text;
    if(title){
        CGSize labelSize = [titleLabel.text sizeWithFont:titleLabel.font];
        return labelSize.width + 2 + self.imageSize.size.width;
    } else {
        return self.imageSize.size.width + 2;
    }
}
@end
