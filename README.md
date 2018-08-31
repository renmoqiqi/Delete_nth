# Delete_nth 删除第n项

/*

 Given a list lst and a number N, create a new list
 that contains each number of the list at most N times without reordering.
 For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2],
 drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3,
 which leads to [1,2,3,1,2,3]

 */
 
 # 方法一
 // Time complexity O(n^2)
 ```
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
```
 # 方法二
//http://kodango.com/understand-defaultdict-in-python
//Time Complexity O(n), using hash tables.
```
- (NSArray *)delete_nth_naiveByArray:(NSArray *)inArray n:(NSInteger)n
{

    NSMutableArray *restultsArray = [NSMutableArray array];
    NSArray *tempArray = [inArray copy];
    //用hashtable 存储
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    //用数组的的元素作为key存放在字典中
    for (id obj in tempArray)
    {
        //如果字典的keys不包含 这个数组的元素 那么value是1
        if (![tempDic.allKeys containsObject:obj])
        {
            tempDic[obj] = @1;
            [restultsArray addObject:obj];

        }
        else
        {
            //如果字典obj为key的value小于n 那么obj的key对应的 value+1
            if ([tempDic[obj] integerValue] < n)
            {
                [restultsArray addObject:obj];
                tempDic[obj] = @([tempDic[obj] integerValue] + 1);

            }

        }

    }
    return [restultsArray copy];
}
```
