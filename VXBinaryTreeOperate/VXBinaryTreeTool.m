//
//  VXBinaryTreeTool.m
//  VXBinaryTreeOperate
//
//  Created by voidxin on 17/2/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXBinaryTreeTool.h"
@implementation VXBinaryTreeTool
// 创建二叉排序树
+ (VXBinaryTreeNode *)createBinaryTreeWithArrays:(NSArray *)values {
    VXBinaryTreeNode *root = nil;
    for (NSInteger i = 0; i < values.count; i ++) {
        NSInteger value = [values[i] integerValue];
        root = [VXBinaryTreeTool addTreeNodeWithValue:value andNode:root];
    }
    return root;
}
// 向二叉树添加节点
+ (VXBinaryTreeNode *)addTreeNodeWithValue:(NSInteger)value andNode:(VXBinaryTreeNode *)treeNode {
    if (!treeNode) {
        treeNode = [[VXBinaryTreeNode alloc] init];
        treeNode.value = value;
        NSLog(@"%ld--root",value);
    }
    
    else if (value <= treeNode.value) {
        //值小于根节点，插入左子树
        NSLog(@"--left");
        treeNode.leftNode = [VXBinaryTreeTool addTreeNodeWithValue:value andNode:treeNode.leftNode];
    }
    else{
        //值大于根节点，插入右子树
        NSLog(@"--right");
        treeNode.rightNode = [VXBinaryTreeTool addTreeNodeWithValue:value andNode:treeNode.rightNode];
    }
    return treeNode;
}

//先序遍历
+ (void)presentOrderReadTree:(VXBinaryTreeNode *)rootNode handler:(void(^)(VXBinaryTreeNode *treeNode))handler{
    if (rootNode) {
        if (handler) {
            handler(rootNode);
        }
        [VXBinaryTreeTool presentOrderReadTree:rootNode.leftNode handler:handler];
        [VXBinaryTreeTool presentOrderReadTree:rootNode.rightNode handler:handler];
    }
}

//层次遍历
/*
   按照从上到下、从左到右的次序进行遍历。先遍历完一层，再遍历下一层，因此又叫广度优先遍历。需要用到队列，在OC里可以用可变数组来实现
 ***/

+ (void)levelTraverse:(VXBinaryTreeNode *)rootNode handler:(void(^)(VXBinaryTreeNode *treeNode))handler {
    if (!rootNode) {
        return;
    }
    NSMutableArray *nodeArr = [[NSMutableArray alloc] init];
    [nodeArr addObject:rootNode];
    while (nodeArr.count > 0) {
        if (handler) {
            handler([nodeArr firstObject]);
        }
        VXBinaryTreeNode *node = [nodeArr firstObject];
        //弹出最前面的节点，仿照队列先进先出原则
        [nodeArr removeObjectAtIndex:0];
        if (node.leftNode) {
            [nodeArr addObject:node.leftNode];
        }
        if (node.rightNode) {
            [nodeArr addObject:node.rightNode];
        }
    }
}

//二叉树的深度
/*
 二叉树的深度定义为：从根节点到叶子结点依次经过的结点形成树的一条路径,最长路径的长度为树的深度。
 
 1）如果根节点为空，则深度为0；
 
 2）如果左右节点都是空，则深度为1；
 
 3）递归思想：二叉树的深度=max（左子树的深度，右子树的深度）+ 1
 */

+ (NSInteger)depthWithNode:(VXBinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    //左子树深度
    NSInteger leftDep = [self depthWithNode:rootNode.leftNode];
    //右子树深度
    NSInteger rightDep = [self depthWithNode:rootNode.rightNode];
    
    NSInteger dep = MAX(leftDep, rightDep) + 1;
    return dep;
}


//二叉树中所有节点数
/* 
 递归思想：二叉树所有节点数=左子树节点数+右子树节点数+1
 */
+ (NSInteger)numberOfNodeInTree:(VXBinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    
    return [self numberOfNodeInTree:rootNode.leftNode] + [self numberOfNodeInTree:rootNode.rightNode] + 1;
}

//二叉树某层中的节点数
+ (NSInteger)numberOfNodeLevel:(NSInteger)level inTree:(VXBinaryTreeNode *)rootNode {
    if (!rootNode || level <= 0) {
        return 0;
    }
    if (level == 1) {
        return 1;
    }
    NSInteger countLevel = [self numberOfNodeLevel:level - 1 inTree:rootNode.leftNode] + [self numberOfNodeLevel:level -1 inTree:rootNode.rightNode];
    return countLevel;
}
//二叉树叶子节点的节点数
/*
 叶子节点，又叫终端节点，是左右子树都是空的节点。
 */
+ (NSInteger)numberOfTreeNodeCount:(VXBinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    //左节点和右节点数都是空的时候就是叶子节点
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    return [self numberOfTreeNodeCount:rootNode.leftNode] + [self numberOfTreeNodeCount:rootNode.rightNode];
}
@end
