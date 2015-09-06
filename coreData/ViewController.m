//
//  ViewController.m
//  coreData
//
//  Created by shenZhenNewWorld on 15-8-8.
//  Copyright (c) 2015年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());
    //[self insertdata];
    //[self queryAllStudent];
    //[self queryStudentWithCondition];
    //[self deleteStudent];
    [self upData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  更新数据
 */
- (void)upData
{
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"name = '学生4' or age > '13'"];
    request.predicate= predicate;
    NSArray * array = [[AppDelegate context] executeFetchRequest:request error:nil];
    for (Student *s in array) {
        [s setValue:@"学生5" forKey:@"name"];
        [s setValue:@"19" forKey:@"age"];
    }
    [[AppDelegate context] save:nil];
}

/**
 *  删除数据
 */
- (void)deleteStudent
{

    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"name > '学生5'and age > '12'"];
    request.predicate = predicate;
    
    NSArray * deteledStudents = [[AppDelegate context] executeFetchRequest:request error:nil];
    for (Student * s in deteledStudents) {
        [[AppDelegate context] deleteObject:s];
    }
    [[AppDelegate context] save:nil];
}


/**
 *  按条件查询
 */
- (void)queryStudentWithCondition
{

    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
#if 0
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"name = '学生4'"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"age > '05'"];
    
#endif
    
#if 0
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"age > '05' or name = '学生4'"];
#endif
    
    NSPredicate * namePredicate = [NSPredicate predicateWithFormat:@"name = '学生4'"];
    NSPredicate * agePredicate = [NSPredicate predicateWithFormat:@"age > '05'"];
    NSCompoundPredicate * comparite = [NSCompoundPredicate andPredicateWithSubpredicates:@[namePredicate,agePredicate]];
    request.predicate = comparite;
    NSArray * allStudent = [[AppDelegate context] executeFetchRequest:request error:nil];
    for (Student  * s1 in allStudent) {
        NSLog(@"%@--%@",s1.name,s1.age);
        
    }
}


/**
 *  查询所哟数据
 */
- (void)queryAllStudent
{
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSManagedObjectContext * context = [AppDelegate context];
    
  NSArray * allStudent = [context executeFetchRequest:request error:nil];
    for (Student  * s1 in allStudent) {
        NSLog(@"%@--%@",s1.name,s1.age);
        
    }

}

/**
 *  插入数据
 */
- (void)insertdata
{

    for (int i = 0 ; i<10; i++) {
        Student *s1 = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:[AppDelegate context]];
        [s1 setValue:[NSString stringWithFormat:@"学生%d",i] forKey:@"name"];
        
        [s1 setValue:[NSString stringWithFormat:@"%d",arc4random()%10+10] forKey:@"age"];
        if ([[AppDelegate context] save:nil]) {
            NSLog(@"success");
        }
        else
        {
            NSLog(@"fail");
        
        }

    }
        

}

@end
