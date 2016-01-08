//
//  iColorHellowWorldViewController.m
//  iColorHellowWorld
//
//  Created by Mac on 2014/7/4.
//  Copyright (c) 2014年 iColorHellowWorld. All rights reserved.
//

#import "iColorHellowWorldViewController.h"

@interface iColorHellowWorldViewController ()
{
    int buttonNowTag; // 儲存當前按鈕的tag值.
    float rgb[4]; // 儲存隨機數值0~255,ios rgb數值為0/255~255/255.
    float sliderRandom; // 取得對應到的顏色值.
}
@end

@implementation iColorHellowWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)viewDidAppear:(BOOL)animated
{ // 在螢幕之前就先做的事.
    [self exteriorStepSet];// 最初外觀設定,元件.
    [[UIDevice currentDevice]beginGeneratingDeviceOrientationNotifications]; // 啟動裝置方向偵測.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil]; // 偵測到裝置有動作時要做的事.

}
-(BOOL)prefersStatusBarHidden{  // 隱藏Status Bar.
    return YES;
}
-(void)exteriorStepSet // 最初外觀設定.
{    
    [self changeButtonFront:self.ButtonR]; // ButtonR 紅色.
    [self changeButtonFront:self.ButtonG]; // ButtonG 綠色.
    [self changeButtonFront:self.ButtonB]; // ButtonB 藍色.
    [self sliderState];    // 滑感的狀態.
    self.LabelShowStatus.layer.cornerRadius=15; // LabelShowStatus的形狀為圓形.
    self.LabelShowStatus.layer.borderWidth=4.0f; // LabelShowStatus 編框粗細.
    self.LabelShowValue.layer.cornerRadius=15; // LabelShowValue的形狀為圓形.
    self.LabelShowValue.layer.borderWidth=4.0f; // LabelShowValue 編框粗細.
}

- (IBAction)UISliderRandomTouchDown:(UISlider *)sender { // UISliderRandomTouchDown 觸碰瞬間,隨機變色.
    if(buttonNowTag==0){ // 按鈕都尚未有動作.
        for(int i=1;i<=3;i++)
            rgb[i]=[self arc4]; // 設定隨機亂數.
        self.view.backgroundColor=[UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1];
    }    
    self.LabelShowValue.text=[NSString stringWithFormat:@"R                  G                  B\n%2.0f%17.0f%17.0f",rgb[1],rgb[2],rgb[3]];
}
- (IBAction)SliderChangeValue:(UISlider *)sender { // SliderChangeValue 改變數值.
    if(buttonNowTag!=0){ // 按鈕有動作.
        rgb[buttonNowTag]=sender.value; // 滑桿的值傳給對應的數值.
        self.view.backgroundColor=[UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1];
    }
    self.LabelShowValue.text=[NSString stringWithFormat:@"R                  G                  B\n%2.0f%17.0f%17.0f",rgb[1],rgb[2],rgb[3]];
}

- (IBAction)ButtonR:(UIButton *)sender { // ButtonR 紅色.
    if(sender.tag==buttonNowTag){
        [UIView animateWithDuration:0.6 animations:^{
            [self changeButtonExteriorModel1:sender OnOrOff:YES]; // 尚未按下.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=0;
    }
    else{
        [self changeButtonExteriorModel1:self.ButtonG OnOrOff:YES];// 尚未按下.
        [self changeButtonExteriorModel1:self.ButtonB OnOrOff:YES];// 尚未按下.
        [UIView animateWithDuration:0.6 animations:^{
        [self changeButtonExteriorModel1:sender OnOrOff:NO]; // 按下去了.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=sender.tag; // 記住當前的按鈕編號.
        sliderRandom=rgb[sender.tag]; // 取得對應到的顏色值.
        self.SliderChangeValue.value=sliderRandom; // 滑桿值為當前對應的顏色值.
        self.view.backgroundColor=[UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1];
    }
    [self sliderState]; // 滑感的狀態.
     //NSLog(@"...tag=%d now=%d r=%f",sender.tag,buttonNowTag,sliderRandom);
}
- (IBAction)ButtonG:(UIButton *)sender { // ButtonG 綠色.
    if(sender.tag==buttonNowTag){
        [UIView animateWithDuration:0.6 animations:^{
            [self changeButtonExteriorModel1:sender OnOrOff:YES]; // 按下去了.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=0;
    }
    else{
        [self changeButtonExteriorModel1:self.ButtonR OnOrOff:YES];// 尚未按下.
        [self changeButtonExteriorModel1:self.ButtonB OnOrOff:YES];// 尚未按下.
        [UIView animateWithDuration:0.6 animations:^{
        [self changeButtonExteriorModel1:sender OnOrOff:NO]; // 按下去了.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=sender.tag; // 記住當前的按鈕編號.
        sliderRandom=rgb[sender.tag]; // 取得對應到的顏色值.
        self.SliderChangeValue.value=sliderRandom; // 滑桿值為當前對應的顏色值.
        self.view.backgroundColor=[UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1];
    }
    [self sliderState]; // 滑感的狀態.
    //NSLog(@"...tag=%d now=%d g=%f",sender.tag,buttonNowTag,sliderRandom);
}
- (IBAction)ButtonB:(UIButton *)sender { // ButtonB 藍色.
    if(sender.tag==buttonNowTag){
        [UIView animateWithDuration:0.6 animations:^{
            [self changeButtonExteriorModel1:sender OnOrOff:YES]; // 按下去了.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=0;
    }
    else{
        [self changeButtonExteriorModel1:self.ButtonR OnOrOff:YES];// 尚未按下.
        [self changeButtonExteriorModel1:self.  ButtonG OnOrOff:YES];// 尚未按下.
        [UIView animateWithDuration:0.6 animations:^{
        [self changeButtonExteriorModel1:sender OnOrOff:NO]; // 按下去了.
        } completion:^(BOOL finished){
        }];
        buttonNowTag=sender.tag; // 記住當前的按鈕編號.
        sliderRandom=rgb[sender.tag]; // 取得對應到的顏色值.
        self.SliderChangeValue.value=sliderRandom; // 滑桿值為當前對應的顏色值.
        self.view.backgroundColor=[UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1];
    }
    [self sliderState]; // 滑感的狀態.
    //NSLog(@"...tag=%d now=%d b=%f",sender.tag,buttonNowTag,sliderRandom);
}
-(void)changeButtonExteriorModel1:(UIButton*)sender OnOrOff:(BOOL)YesNo
{ // 改變按鈕外觀.
    if(YesNo){
        sender.backgroundColor=[UIColor whiteColor];// 設定按鈕背景顏色.
        [[sender layer]setBorderColor:[UIColor blackColor].CGColor]; // 設定邊框顏色.
        sender.layer.borderWidth=4.0f;// 設定按鈕編框粗細.
        sender.alpha=1; // 設定按鈕的顏色明亮度.
    }
    else{
        sender.backgroundColor=[UIColor blackColor];// 設定按鈕背景顏色.
        [[sender layer]setBorderColor:[UIColor whiteColor].CGColor]; // 設定邊框顏色.
        sender.layer.borderWidth=7.0f;// 設定按鈕編框粗細.
        sender.alpha=0.6; // 設定按鈕的顏色明亮度.
    }
    sender.layer.masksToBounds=YES;// 超超編框的部分做遮罩.
}
-(void)changeButtonFront:(UIButton*)sender // 改變按鈕前置作業.
{
    float side=100.0;
    CGRect buttondelegate=sender.frame; // 取得此按鈕的大小.
    buttondelegate.size=CGSizeMake(side, side); // 設定邊長必須相同,為了改成圓形.
    sender.frame=buttondelegate; // 改變此按鈕的大小尺寸.
    sender.layer.cornerRadius=sender.frame.size.width/2;// 設定按鈕角度 用邊長的一半.
    sender.backgroundColor=[UIColor whiteColor];// 設定按鈕背景顏色.
    [[sender layer]setBorderColor:[UIColor blackColor].CGColor]; // 設定邊框顏色.
    sender.layer.borderWidth=4.0f;// 設定按鈕編框粗細.
    sender.alpha=1; // 設定按鈕的顏色明亮度.
    sender.layer.masksToBounds=YES;// 超超編框的部分做遮罩.
}
-(void)sliderState
{ // 滑感的狀態.
    if (buttonNowTag!=0) { // 按鈕有動作時,顯示滑桿.
        UIColor *color;
        switch (buttonNowTag) {
            case 1:
                color=[UIColor redColor];  // R.
                break;
            case 2:
                color=[UIColor greenColor];  // G.
                break;
            case 3:
                color=[UIColor blueColor];  // B.
                break;
            default:
                break;
        }
        self.SliderChangeValue.hidden=NO;
        self.self.SliderChangeValue.minimumTrackTintColor=color;
        CGRect cgSlider=self.SliderChangeValue.frame;
        cgSlider.size.width=732;
        cgSlider.origin.x=18;
        [self.SliderChangeValue setFrame:cgSlider];
        
    }
    else{ // 無按鈕有動作時,以藏滑桿.
        //self.SliderChangeValue.hidden=YES;
        CGRect cgSlider=self.SliderChangeValue.frame;
        cgSlider.size.width=30;
        cgSlider.origin.x=367;
        [self.SliderChangeValue setFrame:cgSlider];
        /*
        UIColor *ttcolor=[UIColor blueColor]; // 設定顏色.
        const CGFloat *floatcolor=CGColorGetComponents(ttcolor.CGColor); // 取得RGB.
        CGFloat red=floatcolor[0];
        CGFloat green=floatcolor[1];
        CGFloat blue=floatcolor[2];
        NSLog(@"red=%f green=%f blue=%f",red,green,blue);
        */
    }
    
}
-(int) arc4 // 回傳隨機亂數 0~255
{
    return arc4random()%256;;
}
-(void)getCloorGRB:(UIColor*)senderColor
{ // 取得顏色RGB值.

}
-(void)orientationChanged:(NSNotification *)notification{
    UIDeviceOrientation orientation;
    orientation=[[UIDevice currentDevice]orientation];
    switch (orientation) {
        case UIDeviceOrientationFaceUp:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 上";
            break;
        case UIDeviceOrientationFaceDown:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 下";
            break;
        case UIDeviceOrientationPortrait:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 站";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 站躺";
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 左邊";
            break;
        case UIDeviceOrientationLandscapeRight:
            self.LabelShowStatus.text=@"Hellow World~\n Color\nHi~ 右邊";
            break;
        default:
            break;
    }
}


@end
