//
//  ViewController.m
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *tickers;
@end

@implementation ViewController

@synthesize tickers;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchDataFromApi];
    
}

- (void)fetchDataFromApi {
    NSURL *url = [NSURL URLWithString:@"https://api.coinlore.net/api/tickers/?start=100&limit=10"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (data == nil) { return; }
        
        self.tickers = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@",self.tickers);
    }];
    
    [task resume];
}

@end
