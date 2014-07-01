//
//  MessagesViewController.m
//  week2-2-demo
//
//  Created by jmilam on 6/26/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *messageScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *messageView;

@end

@implementation MessagesViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
