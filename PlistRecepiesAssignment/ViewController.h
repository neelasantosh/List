//
//  ViewController.h
//  PlistRecepiesAssignment
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableDictionary *reciepeDictionary;
@property NSMutableArray *rootArray;
@end

