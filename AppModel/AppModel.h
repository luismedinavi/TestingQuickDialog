
//  Singleton with Core Data stack header
//  AppModel.h

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Names.h"


@interface AppModel : NSObject{
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

+(id)sharedModel;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(strong) NSString *dataStoreFile;

-(NSString *)applicationDocumentsDirectory;
-(void)getObjectsFromDataStore;
-(void)addManagedObject;
-(void)saveChangesToDataStore;

//Core Data Note App Code
@property(strong) NSMutableArray *listOfNames;


@end
