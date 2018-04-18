//
//  ViewController.m
//  Arrays
//
//  Created by Viktoryia Barzdyka on 4/12/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    //Create NSArray, containing several strings, using literal declaration.
    NSArray* array = @[@"first", @"second", @"third"];
    
    //Create mutable array from previously created NSArray.
    NSMutableArray* mutableArray = [array mutableCopy];
    
    //Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [[NSArray alloc] init];
    NSLog(@"First Object: %@", [emptyArray firstObject]);
    NSLog(@"First Object: %@", [emptyArray lastObject]);
    
    //Create NSArray, containing strings from 1 to 20:
    NSArray* basicArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                            @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"];
    NSArray *arrayWithNumbers = [NSArray arrayWithArray: basicArray];
    
    //Get its shallow copy and real deep copy.
    NSArray *shallowCopyArray = [arrayWithNumbers copy];
    NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:
                                  [NSKeyedArchiver archivedDataWithRootObject:arrayWithNumbers]];
    
    NSLog(@"array2: %d", &arrayWithNumbers);
    NSLog(@"shallow: %d", &shallowCopyArray);
    NSLog(@"deep: %d", &trueDeepCopyArray);
    
    //Iterate over array and obtain item at index 13. Print an item.
    [shallowCopyArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
        if (index == 13) {
            NSLog(@"Object Found: %@ at index: %i",obj, index);
            *stop = YES;
        }
    }];
     
     [trueDeepCopyArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
        if (index == 13) {
            NSLog(@"Object Found at Deep Copy: %@ at index: %i",obj, index);
            *stop = YES;
        }
     }];
    
    //Make array mutable.
    NSMutableArray* mutableArray2 = [arrayWithNumbers mutableCopy];
    
    //Add two new entries to the end of the array, add an entry to the beginning of the array.
    [mutableArray2 insertObject:@"21" atIndex: mutableArray2.count];
    [mutableArray2 insertObject:@"22" atIndex: mutableArray2.count];
    [mutableArray2 insertObject:@"0" atIndex: 0];
    NSLog(@"%@",mutableArray2);
    
    //Iterate over an array and remove item at index 5
    [mutableArray2 enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
        if (index == 5) {
            NSLog(@"Object remove: %@ at index: %i",obj, index);
            [mutableArray2 removeObjectAtIndex:index];
            *stop = YES;
        }
    }];
     NSLog(@" Mutable array after removing the element %@",mutableArray2);

    //Create new array of mixed numbers.
     NSMutableArray* arrayWithMixedNumbers = [[NSMutableArray alloc] init];
     for (int i = 0; i < 15; i++){
         [arrayWithMixedNumbers addObject: [NSNumber numberWithInt: arc4random()%200]];
     }
    NSLog(@" Mixed array %@",arrayWithMixedNumbers);
    
    //Sort it in an ascending and descending order.
    NSSortDescriptor *asc = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
    
    [arrayWithMixedNumbers sortUsingDescriptors:[NSArray arrayWithObject:asc]];
    NSLog(@" Mixed array asc %@",arrayWithMixedNumbers);
    
    [arrayWithMixedNumbers sortUsingDescriptors:[NSArray arrayWithObject:desc]];
    NSLog(@" Mixed array desc %@",arrayWithMixedNumbers);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
