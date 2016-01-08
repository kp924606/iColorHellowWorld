//
//  iColorHellowWorldViewController.h
//  iColorHellowWorld
//
//  Created by Mac on 2014/7/4.
//  Copyright (c) 2014年 iColorHellowWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iColorHellowWorldViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LabelShowStatus; // LabelShowStatus 顯示狀態.
@property (weak, nonatomic) IBOutlet UILabel *LabelShowValue; // LabelShowValue 顯示RGB數值.
@property (weak, nonatomic) IBOutlet UISlider *SliderChangeValue; // SliderChangeValue 改變數值.
@property (weak, nonatomic) IBOutlet UIButton *ButtonR; // ButtonR 紅色.
@property (weak, nonatomic) IBOutlet UIButton *ButtonG; // ButtonG 綠色.
@property (weak, nonatomic) IBOutlet UIButton *ButtonB; // ButtonB 藍色.
@property(nonatomic) UIButton* ButtonALL;

- (IBAction)ButtonR:(UIButton *)sender; // ButtonR 紅色.
- (IBAction)ButtonG:(UIButton *)sender; // ButtonG 綠色.
- (IBAction)ButtonB:(UIButton *)sender; // ButtonB 藍色.
- (IBAction)SliderChangeValue:(UISlider *)sender; // SliderChangeValue 改變數值,滑動中.

- (IBAction)UISliderRandomTouchDown:(UISlider *)sender; // UISliderRandomTouchDown 觸碰瞬間,隨機變色.
-(void)exteriorStepSet; // 最初外觀設定.
-(void)changeButtonExteriorModel1:(UIButton*)sender OnOrOff:(BOOL)YesNo; // 改變按鈕外觀.
-(void)changeButtonFront:(UIButton*)sender; // 改變按鈕前置作業.
-(void)sliderState; // 滑感的狀態.
-(int) arc4; // 回傳隨機亂數 0~255
-(void)getCloorGRB:(UIColor*)senderColor; // 取得顏色RGB值.


@end
