//
//  testQDChangeValue.m
//  TestQD2_value
//
//  Created by Luis Medina on 11/22/11.
//  Copyright (c) 2011 LMV Consulting. All rights reserved.
//

#import "testQDChangeValue.h"
#import "AppModel.h"
//#import "../quickdialog/QuickDialogTableView.h"

@interface testQDChangeValue ()

- (void)onSave;

@end

@implementation testQDChangeValue
@synthesize name, lastName, webPage;

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHue:0.5500 saturation:0.175 brightness:0.900 alpha:1.0000];
    
    //self.view.backgroundColor = [UIColor colorWithHue:0.1174 saturation:0.7131 brightness:0.8618 alpha:1.0000];
    //    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.tableView.bounces = YES;
//    ((QuickDialogTableView *)self.tableView).styleProvider = self;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];         // [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(onSave)];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.tintColor = nil;
}

-(void) cell:(UITableViewCell *)cell willAppearForElement:(QElement *)element atIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor colorWithHue:0.5500 saturation:0.150 brightness:0.995 alpha:1.0000];
        
    if ([element isKindOfClass:[QEntryElement class]] || [element isKindOfClass:[QButtonElement class]]){
        cell.textLabel.textColor = [UIColor colorWithRed:0.6033 green:0.2323 blue:0.0000 alpha:1.0000];
    }   
}

- (void)onSave{
    
//    [self loading:YES];
    
    testQDChangeValue *info = [[testQDChangeValue alloc] init];
    
    [self.root fetchValueIntoObject:info];
    
    Names *newName = [[[AppModel sharedModel] listOfNames] objectAtIndex:0]; 
    newName.name     = info.name.text ;
    newName.lastName = info.lastName.text;
    newName.webPage  = info.webPage.text;
    
//    [[AppModel sharedModel] saveChangesToDataStore];
    
    NSString *msg = @"Name Values has been Updated";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (QRootElement *)createTestValue {     
    
    Names *nameSet = [[[AppModel sharedModel] listOfNames] objectAtIndex:0];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.controllerName = @"testQDChangeValue";
    root.grouped = YES;
    root.title = @"Test Values";
    
    QSection *sectionName = [[QSection alloc] init];
    
    QEntryElement *name = [[QEntryElement alloc] init];
    name.title = @"Name";    
    name.key = @"name";
    name.textValue = nameSet.name;   
    name.hiddenToolbar = YES;
    name.placeholder = @"Name";
    [sectionName addElement:name];   
    
    QEntryElement *lastName = [[QEntryElement alloc] init];
    lastName.title = @"Last Name";    
    lastName.key = @"lastName";
    lastName.textValue = nameSet.lastName; 
    lastName.hiddenToolbar = YES;
    lastName.placeholder = @"Last Name";
    [sectionName addElement:lastName];       
    
    QEntryElement *webPage = [[QEntryElement alloc] init];
    webPage.title = @"Web Page";    
    webPage.key = @"webPage";
    webPage.textValue = nameSet.webPage; 
    webPage.hiddenToolbar = YES;
    webPage.placeholder = @"Web Page";
    [sectionName addElement:webPage]; 
    
    
    [root addSection:sectionName];
        
    return root;
    
}

@end
