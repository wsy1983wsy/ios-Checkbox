//
//  DJViewController.m
//  CustomizeCheckbox
//
//  Created by wang songye on 13-5-22.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import "DJViewController.h"
#import "DJCheckbox.h"

@interface DJViewController ()

@end

@implementation DJViewController
@synthesize checkbox;
@synthesize checkbox2;

- (void)viewDidLoad
{
    [super viewDidLoad];
//	 Do any additional setup after loading the view, typically from a nib.
    self.checkbox = [[DJCheckbox alloc]initWithTitle:@"aaaaaB"];
    checkbox.tag = 1;
    checkbox.delegate = self;
    [self.view addSubview:checkbox];
    
    self.checkbox2 = [[DJCheckbox alloc]initWithTitle:@"你好"];
    checkbox2.tag = 2;
    checkbox2.delegate = self;
    checkbox2.frame = CGRectMake(0, 40, 300, 300);
    [checkbox2 setTextAlignment:DJCheckboxTextAlignmentLeft];
    [self.view addSubview:checkbox2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleCheckboxState:(id)sender{
    [self.checkbox2 toggleState];
    [self.checkbox toggleState];
}

- (void)checkboxCheckedChange:(int)state byTag:(int)tag{
    NSString *checked = @"unchecked";
    if(state == DJCheckboxChecked){
        checked = @"checked";
    }
    NSString *message = [NSString stringWithFormat:@"checkbox with tag:%d and new state %@",tag,checked];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Checkbox Changed" message:message delegate:self cancelButtonTitle:@"cancelled" otherButtonTitles: nil];
    alertView.tag = tag;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //do nothing
}

@end
