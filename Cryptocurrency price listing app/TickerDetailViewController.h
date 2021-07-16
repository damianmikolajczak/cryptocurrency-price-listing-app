//
//  TickerDetailViewController.h
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MarketsTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TickerDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property IBOutlet UIImageView *violetRect;
@property IBOutlet UIImageView *blueRect;
@property IBOutlet UILabel *rank;
@property IBOutlet UILabel *marketCup;
@property IBOutlet UILabel *circulatingSupply;
@property IBOutlet UILabel *volume24;
@property IBOutlet UILabel *priceInUSD;
@property IBOutlet UILabel *priceInBTC;
@property IBOutlet UILabel *percentChangeLastHour;
@property IBOutlet UILabel *percentChangeLastDay;
@property IBOutlet UILabel *percentChangeLastWeek;
@property IBOutlet UILabel *coinName;
@property IBOutlet UITableView *marketsTable;
@property NSDictionary *ticker;
@end

NS_ASSUME_NONNULL_END
