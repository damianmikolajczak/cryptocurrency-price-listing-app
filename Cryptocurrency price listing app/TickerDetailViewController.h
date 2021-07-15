//
//  TickerDetailViewController.h
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TickerDetailViewController : UIViewController
@property IBOutlet UIImageView *violetRect;
@property IBOutlet UIImageView *blueRect;
@property IBOutlet UILabel *priceInUSD;
@property IBOutlet UILabel *priceInBTC;
@property IBOutlet UILabel *percentChangeLastHour;
@property IBOutlet UILabel *percentChangeLastDay;
@property IBOutlet UILabel *percentChangeLastWeek;
@property NSDictionary *ticker;
@end

NS_ASSUME_NONNULL_END
