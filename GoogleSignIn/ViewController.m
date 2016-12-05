//
//  ViewController.m
//  GoogleSignIn
//
//  Created by CI-07 on 3/9/16.
//  Copyright © 2016 CI-07. All rights reserved.
//

//sohilGoogleSignIn

#import "ViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize signInButton;

static NSString * const KclientId=@"351227212031-m05v3ku9g54ud3v35hjnm0v1o94st30a.apps.googleusercontent.com";


- (void)viewDidLoad {
    [super viewDidLoad];

    
    GIDSignIn* signIn = [GIDSignIn sharedInstance];
//    if (self.fetchEmailToggle.isEnabled) {
//        signIn.shouldFetchBasicProfile = YES;
//    }
     signIn.shouldFetchBasicProfile = YES;
    signIn.clientID = KclientId;
    signIn.scopes = @[ @"profile", @"email" ];
    signIn.delegate = self;
    signIn.uiDelegate = self;
    //self.statusField.text = @"Initialized auth2...";
    
    
    
     
   /*  signIn.allowsSignInWithBrowser = NO;
     signIn.allowsSignInWithWebView = YES;
     signIn.scopes = @[@"https://www.googleapis.com/auth/plus.login",@"https://www.googleapis.com/auth/userinfo.email",@"https://www.googleapis.com/auth/userinfo.profile"];
    */
    
    
}

- (IBAction)loginClick:(id)sender
{
    [[GIDSignIn sharedInstance] signIn];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
    NSLog(@"Signin");
    
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    
    NSLog(@"User Name : %@",name);
    NSLog(@"User Email : %@",email);
    NSLog(@"User ID : %@",userId);
    NSLog(@"User IDToken : %@",idToken);
    
    NSLog(@"User Access Token : %@",user.authentication.accessToken);
    NSLog(@"User Refresh Token : %@",user.authentication.refreshToken);
    NSLog(@"Person Token Expire Date : %@",user.authentication.idTokenExpirationDate);
    NSLog(@"Person Client ID : %@",user.authentication.clientID);
    
    if ([GIDSignIn sharedInstance].currentUser.profile.hasImage)
    {
        NSUInteger dimension = round(50 * [[UIScreen mainScreen] scale]);
        NSURL *imageURL = [user.profile imageURLWithDimension:dimension];
        NSLog(@"User Picture Url : %@",imageURL);
    }
    
    
}
- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
   // self.statusField.text = @"Disconnected user";
    
    NSLog(@"Success full Disconnet");
}

- (IBAction)signOutClick:(id)sender {
      NSLog(@"Sign Out");
     [[GIDSignIn sharedInstance] signOut];
}

- (IBAction)disConnnectClick:(id)sender {
      NSLog(@"Disconnect");
     [[GIDSignIn sharedInstance] disconnect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
