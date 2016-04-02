//
//  ViewController.m
//  Demo2_JS_Client
//
//  Created by  江苏 on 16/3/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "AsyncSocket.h"
@interface ViewController ()<AsyncSocketDelegate>
@property(nonatomic,strong)AsyncSocket* clinetSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)clicked:(id)sender {
    self.clinetSocket=[[AsyncSocket alloc]initWithDelegate:self];
    [self.clinetSocket connectToHost:@"192.168.1.102" onPort:8000 error:nil];
    NSString* info=@"你好啊";
    NSData* data=[info dataUsingEncoding:NSUTF8StringEncoding];
    [self.clinetSocket writeData:data withTimeout:-1 tag:0];
}
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"数据发送完成");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
