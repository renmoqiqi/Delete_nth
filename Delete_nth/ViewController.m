//
//  ViewController.m
//  Delete_nth
//
//  Created by penghe on 2018/8/30.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//



/*

 Given a list lst and a number N, create a new list
 that contains each number of the list at most N times without reordering.
 For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2],
 drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3,
 which leads to [1,2,3,1,2,3]

 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   NSArray *reslutsArray = [self delete_nth_naiveByArray:@[@1,@2,@3,@1,@2,@1,@2,@3] n:2];
    NSLog(@"%@",reslutsArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Time complexity O(n^2)
- (NSArray *)delete_nth_naiveByArray:(NSArray *)inArray n:(NSInteger)n
{
    NSMutableArray *restultsArray = [NSMutableArray array];
    NSArray *tempArray = [inArray copy];

    for (id obj in tempArray)
    {
    //https://stackoverflow.com/questions/4833992/objective-c-count-the-number-of-times-an-object-occurs-in-an-array
       NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:restultsArray];
        if ([countedSet countForObject:obj] <n )
        {
            [restultsArray addObject:obj];
        }

    }
    return [restultsArray copy];
}

@end
