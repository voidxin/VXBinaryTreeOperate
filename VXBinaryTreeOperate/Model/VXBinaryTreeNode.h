//
//  VXBinaryTreeNode.h
//  VXBinaryTreeOperate
//
//  Created by voidxin on 17/2/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import <Foundation/Foundation.h>
///二叉树节点
@interface VXBinaryTreeNode : NSObject
//值
@property(nonatomic,assign) NSInteger value;
//左节点
@property(nonatomic,strong) VXBinaryTreeNode *leftNode;
//右节点
@property(nonatomic,strong) VXBinaryTreeNode *rightNode;
@end
