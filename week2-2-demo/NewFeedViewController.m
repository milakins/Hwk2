//
//  NewFeedViewController.m
//  fb-site
//
//  Created by jmilam on 6/29/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "NewFeedViewController.h"

@interface NewFeedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedLoadingIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;

@end

@implementation NewFeedViewController

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
    [self.feedLoadingIndicator startAnimating];
    [self performSelector:@selector (loadNewFeed) withObject:nil afterDelay:2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadNewFeed
{
    // stop animating load indicator & show feed
    [self.feedLoadingIndicator stopAnimating];
    self.feedImageView.hidden = FALSE;
}

@end
