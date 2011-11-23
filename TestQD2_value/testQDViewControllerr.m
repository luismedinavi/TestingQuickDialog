//
//  testQDViewControllerr.m
//  TestQD2_value
//
//  Created by Luis Medina on 11/22/11.
//  Copyright (c) 2011 LMV Consulting. All rights reserved.
//

#import "testQDViewControllerr.h"
#import "testQDChangeValue.h"
#import "AppModel.h"

@implementation testQDViewControllerr

- (void) viewDidLoad{
    [super viewDidLoad];
    
//    [[AppModel sharedModel] addManagedObject];  
//    NSString *msg = @"New Name created";
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Testing Values"
//                                                    message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
}

- (IBAction)testQDButton:(id)sender {
    QRootElement *root = [testQDViewControllerr create];          
    QuickDialogController *quickformController = [[QuickDialogController alloc] initWithRoot:root];
    
    [self.navigationController pushViewController:quickformController animated:YES];
}


+ (QRootElement *)create {
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"Testing Values";
    
	QSection *section1 = [[QSection alloc] init];        
    [section1 addElement:[testQDChangeValue createTestValue]];  
    
    [root addSection:section1];
    
    return root;
}


@end
