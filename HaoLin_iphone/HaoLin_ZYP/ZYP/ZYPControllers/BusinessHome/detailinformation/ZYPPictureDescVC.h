//
//  ZYPPictureDescVC.h
//  HaoLin
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPPictureDescVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@property (nonatomic, strong)NSMutableArray*requstImageArray;
- (void)addImage;
- (void)deleteImage:(NSInteger )tag;
@end