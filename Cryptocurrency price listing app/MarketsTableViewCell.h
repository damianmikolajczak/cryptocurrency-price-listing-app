//
//  MarketsTableViewCell.h
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 16/07/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketsTableViewCell : UITableViewCell
@property IBOutlet UILabel *name;
@property IBOutlet UILabel *base;
@property IBOutlet UILabel *price;
@end

NS_ASSUME_NONNULL_END
