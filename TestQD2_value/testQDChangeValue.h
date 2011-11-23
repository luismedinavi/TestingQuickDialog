//
//  testQDChangeValue.h
//  TestQD2_value
//
//  Created by Luis Medina on 11/22/11.
//  Copyright (c) 2011 LMV Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Names.h"

//#import "../quickdialog/QuickDialogController+Loading.h"
//#import "../quickdialog/QuickDialogStyleProvider.h"

@class QRootElement;
@class QuickDialogController;
@protocol QuickDialogStyleProvider;

@interface testQDChangeValue : QuickDialogController <QuickDialogStyleProvider> {
    UITextField *name;
    UITextField *lastName;
    UITextField *webPage;
    
    Names *nameSet;
}

+ (QRootElement *)createTestValue;

@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UITextField *webPage;

@end
