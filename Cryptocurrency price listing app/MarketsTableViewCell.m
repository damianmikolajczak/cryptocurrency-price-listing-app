//
//  MarketsTableViewCell.m
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 16/07/2021.
//

#import "MarketsTableViewCell.h"

@implementation MarketsTableViewCell

@synthesize name, base, price;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // Setting the name label
    [name setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[name leadingAnchor] constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.0] setActive:YES];
    [[[name centerYAnchor] constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    
    // Setting the symbol label
    [base setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[base centerXAnchor] constraintEqualToAnchor:self.contentView.centerXAnchor] setActive:YES];
    [[[base centerYAnchor] constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    
    // Setting the price label
    [price setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[price trailingAnchor] constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20.0] setActive:YES];
    [[[price centerYAnchor] constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
