//
//  ViewController.m
//  SNPhotoCarmeraViewController
//
//  Created by snlo on 2018/5/7.
//  Copyright © 2018年 snlo. All rights reserved.
//

#import "ViewController.h"

#import "SNPhotoCameraViewController.h"

#import <SNTool.h>

@interface ViewController ()

@property (nonatomic) SNPhotoCameraViewController * vc;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    pod trunk push SNPhotoCarmeraViewController.podspec --verbose --allow-warnings --use-libraries
	
	
	UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.frame = CGRectMake(60, 200, 60, 60);
	[button setTitle:SNString_localized(@"测试") forState:UIControlStateNormal];
	[self.view addSubview:button];
	[button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
	
	
}

- (void)handleButton:(UIButton *)sender {
	self.vc = [SNPhotoCameraViewController pictureViewControllerWithPresent:self estimatedSize:CGSizeMake(70, 70)];
	
	SN_ASCII_String(@"---- %@",self.vc.imagePickerController.navigationBar);
	
	
	
	
	[self.vc selectedBlock:^(UIImage *image) {
//		self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);
		self.imageView.image = image;
	} cancelBlock:^{
		
	}];
	
	[SNTool showAlertStyle:UIAlertControllerStyleActionSheet title:@"图片选择器" msg:@"来源" chooseBlock:^(NSInteger actionIndx) {
		
		switch (actionIndx) {
			case 1: {
				[self.vc selectPictureFromAlbunPhotos];
			} break;
			case 2: {
				[self.vc selectPictureFromCamera];
			} break;
			default:
				break;
		}
	} actionsStatement:@"取消",@"相册",@"相机", nil];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
