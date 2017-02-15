//
//  ViewController.m
//  VXBinaryTreeOperate
//
//  Created by voidxin on 17/2/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "ViewController.h"
#import "VXBinaryTreeTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self treeOperate];
}

- (void)treeOperate {
    NSArray *values = @[@2,@3,@1,@11,@8,@19,@4,@5,@9,@20,@15];
    VXBinaryTreeNode *treeNode = [VXBinaryTreeTool createBinaryTreeWithArrays:values];
    //前序遍历
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [VXBinaryTreeTool presentOrderReadTree:treeNode handler:^(VXBinaryTreeNode *treeNode) {
        [arr addObject:@(treeNode.value)];
    }];
    for (id value in arr) {
        NSLog(@"遍历:%ld",[value integerValue]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
