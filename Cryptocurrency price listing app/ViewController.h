//
//  ViewController.h
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TickerTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property IBOutlet UITableView *tickersTable;
@end

