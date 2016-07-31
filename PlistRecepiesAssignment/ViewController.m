//
//  ViewController.m
//  PlistRecepiesAssignment
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView,rootArray,reciepeDictionary;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    reciepeDictionary  =[[NSMutableDictionary alloc]init];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistpath = [bundle pathForResource:@"recipebook" ofType:@"plist"];
    NSData *plistData = [[NSData alloc]initWithContentsOfFile:plistpath];
    
    NSPropertyListFormat format;
    NSError *error;
    rootArray = [NSPropertyListSerialization
                      propertyListWithData:plistData
                      options:NSPropertyListMutableContainers
                      format:&format
                      error:&error];
    NSLog(@"the data :%@",rootArray);
    
    //get recepies from array
    
    
    
}//eod viewdidload





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rootArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
  
    reciepeDictionary = [rootArray objectAtIndex:indexPath.row];
    
    NSString *Title = [reciepeDictionary objectForKey:@"Title"];
    NSNumber *calories = [reciepeDictionary objectForKey:@"calories"];
    NSString *image = [reciepeDictionary objectForKey:@"Image"];
    cell.imageView.image=[UIImage imageNamed:image];
    NSLog(@"title:%@",Title);
    NSString *str = [NSString stringWithFormat:@"\nTitle:%@,\nCalories:%@ ", Title,calories];
    cell.textLabel.text =Title;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",calories];
       return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
