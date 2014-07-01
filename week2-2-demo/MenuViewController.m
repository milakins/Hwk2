//
//  MenuViewController.m
//  week2-2-demo
//
//  Created by jmilam on 6/26/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *menuScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *menuView;

@end

@implementation MenuViewController

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
    self.menuScrollView.contentSize = CGSizeMake(320, 1000);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
