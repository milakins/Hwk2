//
//  FeedViewController.m
//  week2-2-demo
//
//  Created by jmilam on 6/26/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *feedView;
@property (weak, nonatomic) IBOutlet UIImageView *installBanner;

- (IBAction)onInstall:(id)sender;
@end

@implementation FeedViewController

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
    self.feedScrollView.contentSize = CGSizeMake(320, 1000);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onInstall:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        //self.installBanner.frame = CGRectMake(160, 0, 0, -59);
        CGRect frame = self.installBanner.frame;
        frame.size.height -= 126.0;
        self.installBanner.frame = frame;
        self.feedView.frame = CGRectMake(160, 0, 0, 0);
    } completion:^(BOOL finished) {
        self.installBanner.hidden = YES;
    }
     
     ];
}
@end
