//
//  VXBinaryTreeTool.h
//  VXBinaryTreeOperate
//
//  Created by voidxin on 17/2/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VXBinaryTreeNode.h"
@interface VXBinaryTreeTool : NSObject
+ (VXBinaryTreeNode *)createBinaryTreeWithArrays:(NSArray *)values;

//先序遍历
+ (void)presentOrderReadTree:(VXBinaryTreeNode *)rootNode handler:(void(^)(VXBinaryTreeNode *treeNode))handler;
//层次遍历
+ (void)levelTraverse:(VXBinaryTreeNode *)rootNode handler:(void(^)(VXBinaryTreeNode *treeNode))handler;
@end
