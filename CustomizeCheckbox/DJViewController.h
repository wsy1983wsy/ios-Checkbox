//
//  DJViewController.h
//  CustomizeCheckbox
//
//  Created by wang songye on 13-5-22.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJChekboxDelegate.h"

@class DJCheckbox;
@interface DJViewController : UIViewController <DJChekboxDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) DJCheckbox *checkbox;
@property (strong, nonatomic) DJCheckbox *checkbox2;
- (IBAction)toggleCheckboxState:(id)sender;
@end
