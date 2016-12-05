//
//  ViewController.h
//  GoogleSignIn
//
//  Created by CI-07 on 3/9/16.
//  Copyright © 2016 CI-07. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController : UIViewController<GIDSignInDelegate, GIDSignInUIDelegate>


@property(strong, nonatomic)GIDSignInButton *signInButton;
- (IBAction)signOutClick:(id)sender;
- (IBAction)disConnnectClick:(id)sender;

@end

