/*
 Copyright 2012 LinkedIn, Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "EDViewController.h"
#import "SAMGradientView.h"

@interface EDViewController (Private)

- (void)setupDetailButton;

@end

@implementation EDViewController

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor yellowColor];
    
    SAMGradientView *gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	gradientView.gradientColors = @[
                                    [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f],
                                    [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f],
                                    ];
    gradientView.gradientMode = SAMGradientViewModeRadial;
	[self.view addSubview:gradientView];
    
    
    // Optional button to demonstrate navigation stack
//    [self setupDetailButton];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) || (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = YES;
//    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"expose_title", @"expose_title")
//                                                                               style:UIBarButtonItemStyleBordered
//                                                                              target:self.navigationController.exposeController
//                                                                              action:@selector(toggleExpose)] autorelease];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    button.frame = CGRectMake(self.view.frame.size.width - 50, 20, 30, 30);
    [button addTarget:self.navigationController.exposeController action:@selector(toggleExpose) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:%d, %@", animated, self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:%d, %@", animated, self);
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear:%d, %@", animated, self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear:%d, %@", animated, self);
}

- (void)viewWillShrinkInExposeController:(LIExposeController *)exposeController animated:(BOOL)animated {
    NSLog(@"viewWillShrinkInExposeController:%d, %@", animated, self);
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidShrinkInExposeController:(LIExposeController *)exposeController animated:(BOOL)animated {
    NSLog(@"viewDidShrinkInExposeController:%d, %@", animated, self);
}

- (void)viewWillExpandInExposeController:(LIExposeController *)exposeController animated:(BOOL)animated {
    NSLog(@"viewWillExpandInExposeController:%d, %@", animated, self);
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidExpandInExposeController:(LIExposeController *)exposeController animated:(BOOL)animated {
    NSLog(@"viewDidExpandInExposeController:%d, %@", animated, self);
}

- (void)dealloc
{
    NSLog(@"123");
}

@end