
//  Singleton with Core Data stack header
//  AppModel.m

#import "AppModel.h"

@implementation AppModel
@synthesize dataStoreFile;
@synthesize listOfNames;

#pragma Singleton
static AppModel *sharedObject = nil;

+(id)sharedModel{
    @synchronized(self) {
    if(sharedObject == nil)
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}

-(id)init{
    self = [super init];
    if (self) {
        self.dataStoreFile = @"Names.sqlite";
        [self getObjectsFromDataStore];

    }
    
    return self;
}

#pragma Core Data

-(void)getObjectsFromDataStore{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Names"
                                              inManagedObjectContext:[self managedObjectContext]];
    request.entity = entity;
    self.listOfNames = [[[self managedObjectContext] executeFetchRequest:request error:nil] mutableCopy];
     
}

-(void)addManagedObject{
    
    Names *managedObject = (Names *)[NSEntityDescription insertNewObjectForEntityForName:@"Names" inManagedObjectContext:[self managedObjectContext]];

    
    managedObject.name = @"John"; 
    managedObject.lastName = @"Appleton";
    managedObject.webPage = @"www.apple.com";

    
    [listOfNames addObject:managedObject];
    [self saveChangesToDataStore];
     
}

- (void)saveChangesToDataStore {
    NSError *error = nil;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

- (NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (managedObjectModel) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory]
                                              stringByAppendingPathComponent:self.dataStoreFile]];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeUrl
                                                        options:nil
                                                          error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end