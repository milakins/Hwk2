//
//  LoginViewController.m
//  fb-site
//
//  Created by jmilam on 6/29/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "LoginViewController.h"
//#import "UITabBarController.h"
//#import "FeedViewController.h"
#import "NewFeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MenuViewController.h"



@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *loginImageView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginIndicatorView;
@property (weak, nonatomic) IBOutlet UIButton *logButton;

- (IBAction)onUserEdit:(id)sender;
- (IBAction)onPwdEdit:(id)sender;
- (IBAction)loginButton:(id)sender;
- (IBAction)onTap:(UITapGestureRecognizer *)sender;

// Declare some keyboard methods
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

    [self.logButton setEnabled:NO];
    [self.userTextField becomeFirstResponder];
    
    // hide status bar
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
    {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    else
    {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUserEdit:(id)sender {
    [self validateInput];
}

- (IBAction)onPwdEdit:(id)sender {
    [self validateInput];
}

- (IBAction)loginButton:(id)sender
{
    //NSLog(@"I clicked the login button");
    [self.view endEditing:YES];
    [self.logButton setTitle:@"Logging in" forState:UIControlStateNormal];
    [self.loginIndicatorView startAnimating];
    [self performSelector:@selector (login) withObject:nil afterDelay:2];
}

- (void)validateInput {
    //NSLog(@"validateInput called");
    if(self.userTextField.text && self.userTextField.text.length > 0 && self.pwdTextField.text && self.pwdTextField.text.length > 0 )
    {
        //enable button
        //NSLog(@"enabling button");
        [self.logButton setEnabled:YES];
    }
    else
    {
        //disable button
        //NSLog(@"disabling button");
        [self.logButton setEnabled:NO];
    }
}


- (void)login {
    [self.loginIndicatorView stopAnimating];

    //if ([self.userTextField.text isEqual: @"jmilam@google.com"])
    if ([self.pwdTextField.text isEqual: @"password"])
    {
            //NSLog(@"Good login");
            [self.logButton setTitle:@"Logging in" forState:UIControlStateNormal];
            //self.logButton.text = [NSString stringWithFormat:@"Hi, %@! It's a beautiful day! ", self.InputField.text];
            [self.loginIndicatorView startAnimating];
            
            
            //[self performSelector:@selector (login) withObject:nil afterDelay:2];
            //self.OnGoButton
            
                
                // set up view controllers
                
                NewFeedViewController *feedViewController = [[NewFeedViewController alloc] init];
                UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
                feedNavigationController.tabBarItem.title = @"Feed";
                feedNavigationController.tabBarItem.image = [UIImage imageNamed:@"feed-selected"];
                
                RequestsViewController *requestsViewController = [[RequestsViewController alloc] init];
                UINavigationController *requestsNavigationController = [[UINavigationController alloc] initWithRootViewController:requestsViewController];
                requestsNavigationController.tabBarItem.title = @"Requests";
                requestsNavigationController.tabBarItem.image = [UIImage imageNamed:@"requests-unselected"];
                
                MessagesViewController *messagesViewController = [[MessagesViewController alloc] init];
                UINavigationController *messagesNavigationController = [[UINavigationController alloc] initWithRootViewController:messagesViewController];
                messagesNavigationController.tabBarItem.title = @"Messages";
                messagesNavigationController.tabBarItem.image = [UIImage imageNamed:@"messages-unselected"];
                
                NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
                UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];
                notificationsNavigationController.tabBarItem.title = @"Notifications";
                notificationsNavigationController.tabBarItem.image = [UIImage imageNamed:@"notify-unselected"];
                
                MenuViewController *menuViewController = [[MenuViewController alloc] init];
                UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
                menuNavigationController.tabBarItem.title = @"Menu";
                menuNavigationController.tabBarItem.image = [UIImage imageNamed:@"menu-unselected"];
                
                // set up tab bar and nav controllers
                
                UITabBarController *tabBarController = [[UITabBarController alloc] init];
                tabBarController.viewControllers = @[feedNavigationController, requestsNavigationController, messagesNavigationController, notificationsNavigationController, menuNavigationController];
                
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
                navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
                
                [self presentViewController:navigationController animated:YES completion:nil];
    }
    else
    {
            //NSLog(@"Bad login");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect.  Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            // clear contents of pwd input field
            [self.logButton setTitle:@"Log In" forState:UIControlStateNormal];

            self.pwdTextField.text = @"";
            [self.pwdTextField becomeFirstResponder];
    }
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender
{
    NSLog(@"I tapped the view");
    [self.view endEditing:YES];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.view.frame = CGRectMake(0, self.view.frame.size.height - 75 - self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
                         //self.view.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.view.frame = CGRectMake(0, self.view.frame.size.height - self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
}
@end
