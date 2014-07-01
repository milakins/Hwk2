//
//  NotificationsViewController.m
//  week2-2-demo
//
//  Created by jmilam on 6/26/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *notificationsScrollView;

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.notificationsScrollView.contentSize = CGSizeMake(320, 1000);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
