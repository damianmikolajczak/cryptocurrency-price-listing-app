//
//  TickerTableViewCell.h
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TickerTableViewCell : UITableViewCell
@property IBOutlet UILabel *name;
@property IBOutlet UILabel *symbol;
@property IBOutlet UILabel *price;
@end

NS_ASSUME_NONNULL_END
