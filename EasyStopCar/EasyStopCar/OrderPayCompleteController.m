//
//  OrderPayCompleteController.m
//  EasyStopCar
//
//  Created by savvy on 16/3/2.
//  Copyright © 2016年 Savvy. All rights reserved.
//

#import "OrderPayCompleteController.h"
 


@interface OrderPayCompleteController ()

 
@property(nonatomic,strong)UIView *infoView;      //信息视图


@property(nonatomic,strong)UIView *infoParkView;//信息停车场视图
@property(nonatomic,strong)UIView *infoLine;//信息分割线
@property(nonatomic,strong)UIView *infoPriceView;//信息价钱视图
@property(nonatomic,strong)UIImageView *lineImageView;//分割线

@property(nonatomic,strong)UIView *infoCouponView;//优惠券视图


//信息停车场布局
@property(nonatomic,strong)UIImageView *infoHeadImageView;//信息头像
@property(nonatomic,strong)UIImageView *infoLocationFlag;//地址标记
@property(nonatomic,strong)UILabel *infoAddressLabel;//地址
@property(nonatomic,strong)UILabel *infoAddressDetailLabel;//地址
@property(nonatomic,strong)UIImageView *infoElectricityFlag;//充电标记
@property(nonatomic,strong)UILabel *infoPriceLabel;//价格
@property(nonatomic,strong)UILabel *infoTimeLabel;//时间

//信息价钱视图
@property(nonatomic,strong)UIImageView *orderCompleteFlag;//订单完成标识
@property(nonatomic,strong)UILabel *orderCompleteLabel;
@property(nonatomic,strong)UILabel *outTimeTitle;
@property(nonatomic,strong)UILabel *outTimeLabel;
@property(nonatomic,strong)UILabel *useTimeTitle;
@property(nonatomic,strong)UILabel *useTimeLabel;
@property(nonatomic,strong)UILabel *priceTitle;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *payWayLabel;    //支付方式
@property(nonatomic,strong)UIImageView *priceFlag;


//分享视图布局
@property(nonatomic,strong)UIImageView *shareImageView;//分享图片
@property(nonatomic,strong)UILabel *shareLabel;
@property(nonatomic,strong)UIButton *wechatButton;
@property(nonatomic,strong)UIButton *wechatCircleButton;


@end

@implementation OrderPayCompleteController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     [WXApiManager sharedManager].delegate = self;
    
    
    [super initNavBarItems:@"停车订单详情"];
    
    self.infoView = [[UIView alloc]initWithFrame:CGRectMake(marginSize, 15, ScreenWidth-marginSize*2, 465)];
    self.infoView.backgroundColor = [UIColor whiteColor];
    self.infoView.layer.cornerRadius = 10;
    self.infoView.layer.masksToBounds = YES;
    //设置边框及边框颜色
    self.infoView.layer.borderWidth = 0.5;
    self.infoView.layer.borderColor =[ lineColorGray CGColor];
    [self.view addSubview:self.infoView];
    
    
    //信息停车场布局
    self.infoParkView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.infoView.frame.size.width, 123)];
    [self.infoView addSubview:self.infoParkView];
 
    self.infoHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 75, 75)];
    self.infoHeadImageView.image = [UIImage imageNamed:@"test_picture.jpg"];
//    self.infoHeadImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.infoHeadImageView.layer.cornerRadius = 37.5;
    self.infoHeadImageView.layer.masksToBounds = YES;
    [self.infoParkView addSubview:self.infoHeadImageView];
    
    self.infoLocationFlag = [[UIImageView alloc]initWithFrame:CGRectMake(self.infoHeadImageView.frame.origin.x+self.infoHeadImageView.frame.size.width+5, self.infoHeadImageView.frame.origin.y-3, 10, 20)];
    self.infoLocationFlag.image = [UIImage imageNamed:@"ico_home_cell_location"];
    self.infoLocationFlag.contentMode = UIViewContentModeScaleAspectFit;
    [self.infoParkView addSubview:self.infoLocationFlag];
    
    self.infoAddressLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.infoLocationFlag.frame.origin.x+self.infoLocationFlag.frame.size.width+5, self.infoHeadImageView.frame.origin.y, 150, 30)];
    self.infoAddressLabel.text = @"暂无\n";
    self.infoAddressLabel.font = [UIFont systemFontOfSize:12];
    self.infoAddressLabel.textColor = fontColorLightgray;
    self.infoAddressLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.infoAddressLabel.numberOfLines = 0;//上面两行设置多行显示
    [self.infoParkView addSubview:self.infoAddressLabel];
    
    self.infoAddressDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.infoAddressLabel.frame.origin.x, self.infoAddressLabel.frame.origin.y+self.infoAddressLabel.frame.size.height+2, 150, 20)];
    self.infoAddressDetailLabel.text = @"暂无 暂无";
    self.infoAddressDetailLabel.font = [UIFont boldSystemFontOfSize:18];
    self.infoAddressDetailLabel.textColor = fontColorBlack;
    [self.infoParkView addSubview:self.infoAddressDetailLabel];
 
    self.infoElectricityFlag = [[UIImageView alloc]initWithFrame:CGRectMake(self.infoView.frame.size.width-marginSize-15, self.infoAddressDetailLabel.frame.origin.y, 15, 20)];
    self.infoElectricityFlag.image = [UIImage imageNamed:@"ico_home_cell_flag"];
    self.infoElectricityFlag.contentMode = UIViewContentModeScaleAspectFit;
    [self.infoParkView addSubview:self.infoElectricityFlag];
    
    self.infoPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.infoAddressLabel.frame.origin.x, self.infoHeadImageView.frame.origin.y+self.infoHeadImageView.frame.size.height-13, 80, 13)];
    self.infoPriceLabel.text = @"￥0/小时";
    self.infoPriceLabel.font = [UIFont systemFontOfSize:14];
    self.infoPriceLabel.textColor = backageColorRed;
    [self.infoParkView addSubview:self.infoPriceLabel];
    
    self.infoTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.infoPriceLabel.frame.origin.x+self.infoPriceLabel.frame.size.width-15, self.infoPriceLabel.frame.origin.y+self.infoPriceLabel.frame.size.height-12, 80, 12)];
    self.infoTimeLabel.text = @"0:00-0:00";
    self.infoTimeLabel.font = [UIFont systemFontOfSize:12];
    self.infoTimeLabel.textColor = fontColorLightgray;
    [self.infoParkView addSubview:self.infoTimeLabel];
 
    
    self.infoLine = [[UIView alloc]initWithFrame:CGRectMake(marginSize, self.infoParkView.frame.size.height, self.infoView.frame.size.width-marginSize*2, 0.5)];
    self.infoLine.backgroundColor = lineColorLightgray;
    [self.infoView addSubview:self.infoLine];
    
    
    //信息价钱视图
    self.infoPriceView = [[UIView alloc]initWithFrame:CGRectMake(0, self.infoLine.frame.origin.y+self.infoLine.frame.size.height, self.infoView.frame.size.width, 160)];
    self.infoPriceView.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.infoPriceView];
 
    
    self.orderCompleteFlag = [[UIImageView alloc]initWithFrame:CGRectMake(marginSize+12.5, 20, 50, 50)];
    self.orderCompleteFlag.image = [UIImage imageNamed:@"image_order_complete"];
        self.orderCompleteFlag.contentMode = UIViewContentModeScaleAspectFit;
    [self.infoPriceView addSubview:self.orderCompleteFlag];
    
    
    
    self.orderCompleteLabel = [[UILabel alloc]initWithFrame:CGRectMake(marginSize, self.orderCompleteFlag.frame.origin.y+self.orderCompleteFlag.frame.size.height+5, 80, 15)];
    self.orderCompleteLabel.text = @"订单已完成";
    self.orderCompleteLabel.font = [UIFont boldSystemFontOfSize:14];
    self.orderCompleteLabel.textColor = fontColorBlack;
    [self.infoPriceView addSubview:self.orderCompleteLabel];
    
    
    self.outTimeTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.orderCompleteFlag.frame.origin.x+self.orderCompleteFlag.frame.size.width+30, self.orderCompleteFlag.frame.origin.y, 80, 15)];
    self.outTimeTitle.text = @"取车出库时间";
    self.outTimeTitle.font = [UIFont systemFontOfSize:12];
    self.outTimeTitle.textColor = fontColorLightgray;
    [self.infoPriceView addSubview:self.outTimeTitle];
    
    self.outTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x+self.outTimeTitle.frame.size.width-3, self.orderCompleteFlag.frame.origin.y+3, 150, 12)];
    self.outTimeLabel.text = @"0000-00-00 00:00";
    self.outTimeLabel.font = [UIFont systemFontOfSize:9];
    self.outTimeLabel.textColor = fontColorLightgray;
    [self.infoPriceView addSubview:self.outTimeLabel];
    
    self.useTimeTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x, self.outTimeTitle.frame.origin.y+self.outTimeTitle.frame.size.height+5, 100, 15)];
    self.useTimeTitle.text = @"使用时间";
    self.useTimeTitle.font = [UIFont systemFontOfSize:12];
    self.useTimeTitle.textColor = fontColorGray;
    [self.infoPriceView addSubview:self.useTimeTitle];
    
    self.useTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x, self.useTimeTitle.frame.origin.y+self.useTimeTitle.frame.size.height+5, 150, 15)];
    self.useTimeLabel.text = @"00:00";
    self.useTimeLabel.font = [UIFont boldSystemFontOfSize:18];
    self.useTimeLabel.textColor = fontColorGray;
    [self.infoPriceView addSubview:self.useTimeLabel];
    
    self.priceTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x, self.useTimeLabel.frame.origin.y+self.useTimeLabel.frame.size.height+15, 150, 15)];
    self.priceTitle.text = @"实付金额";
    self.priceTitle.font = [UIFont systemFontOfSize:12];
    self.priceTitle.textColor = fontColorGray;
    [self.infoPriceView addSubview:self.priceTitle];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x-3, self.priceTitle.frame.origin.y+self.priceTitle.frame.size.height+5, 150, 25)];
    self.priceLabel.text = @"￥0.0元";
    self.priceLabel.font = [UIFont systemFontOfSize:30];
    self.priceLabel.textColor = backageColorRed;
    [self.infoPriceView addSubview:self.priceLabel];
    
    
    //修改不同字体
    NSMutableAttributedString *priceAttributedString = [[NSMutableAttributedString alloc] initWithString:@"￥0.0元"];
    [priceAttributedString addAttribute:NSForegroundColorAttributeName value:backageColorRed range:NSMakeRange(4,1)];
    [priceAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(4, 1)];
    self.priceLabel.attributedText = priceAttributedString;
    
    
    self.payWayLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.outTimeTitle.frame.origin.x, self.priceLabel.frame.origin.y+self.priceLabel.frame.size.height+5, 150, 15)];
    self.payWayLabel.text = [NSString stringWithFormat:@"支付方式：%@",self.payWay];
    self.payWayLabel.font = [UIFont systemFontOfSize:12];
    self.payWayLabel.textColor = fontColorGray;
    [self.infoPriceView addSubview:self.payWayLabel];
    
    self.priceFlag = [[UIImageView alloc]initWithFrame:CGRectMake(self.infoPriceView.frame.size.width-7-marginSize, self.priceLabel.frame.origin.y+self.priceLabel.frame.size.height-14, 7, 14)];
    self.priceFlag.image = [UIImage imageNamed:@"ico_home_select_arrow"];
    self.priceFlag.contentMode = UIViewContentModeScaleToFill;
    [self.infoPriceView addSubview:self.priceFlag];
    
    
    
    
    
    
    
    
    //分割线
    self.lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(marginSize, self.infoView.frame.origin.y+291, self.infoView.frame.size.width, 10)];
    
    if (ScreenWidth == 375*2) {
        self.lineImageView.image = [UIImage imageNamed:@"image_order_detail_line_iphone6"];
    }else{
        self.lineImageView.image = [UIImage imageNamed:@"image_order_detail_line"];
    }
 
    self.lineImageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:self.lineImageView];
    
    self.infoCouponView = [[UIView alloc]initWithFrame:CGRectMake(0, 291, self.infoView.frame.size.width, 174)];
    self.infoCouponView.backgroundColor = backageColorRed;
    [self.infoView addSubview:self.infoCouponView];

 

    self.shareImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.infoCouponView.frame.size.width-35)/2, 20, 35, 50)];
    self.shareImageView.image = [UIImage imageNamed:@"image_order_red_envelope"];
    self.shareImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.infoCouponView addSubview:self.shareImageView];
    
    self.shareLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.shareImageView.frame.origin.y+self.shareImageView.frame.size.height+9, self.infoCouponView.frame.size.width, 15)];
    self.shareLabel.text = @"—— 分享停车费红包给小伙伴 ——";
    self.shareLabel.font = [UIFont systemFontOfSize:14];
    self.shareLabel.textColor = [UIColor whiteColor];
    self.shareLabel.textAlignment = NSTextAlignmentCenter;
    [self.infoCouponView addSubview:self.shareLabel];
    
    
    self.wechatButton = [[UIButton alloc]initWithFrame:CGRectMake(self.infoCouponView.frame.size.width*(0.5-0.09)-50, self.shareLabel.frame.origin.y+self.shareLabel.frame.size.height+10, 50, 50)];
    [self.wechatButton setImage:[UIImage imageNamed:@"ico_order_wechat"] forState:UIControlStateNormal];
    self.wechatButton.tag = 198801;
    [self.wechatButton addTarget:self action:@selector(shareWeChat:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoCouponView addSubview:self.wechatButton];

    self.wechatCircleButton = [[UIButton alloc]initWithFrame:CGRectMake(self.infoCouponView.frame.size.width*(0.5+0.09), self.wechatButton.frame.origin.y, 50, 50)];
    [self.wechatCircleButton setImage:[UIImage imageNamed:@"ico_order_wechat_circle"] forState:UIControlStateNormal];
    self.wechatCircleButton.tag = 198802;
    [self.wechatCircleButton addTarget:self action:@selector(shareWeChat:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoCouponView addSubview:self.wechatCircleButton];

}


//微信分享
-(void)shareWeChat:(UIButton *)myButton{
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.text = @"分享红包";
    req.bText = YES;
    if (myButton.tag == 198801) {
          req.scene = WXSceneSession;
    }else{
        req.scene = WXSceneTimeline;
    }
    [WXApi sendReq:req];
 
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
