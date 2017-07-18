//
//  ViewController.m
//  calculator
//
//  Created by iOSIntern on 2017/7/6.
//  Copyright © 2017年 iOSIntern. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel1;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel2;
@end

@implementation ViewController
NSInteger steps=1;
NSInteger number1=0;
NSInteger number2=0;
NSString* operatingString;
NSString* operator;
int answer=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)inputInteger:(UIButton *)sender {
    if(steps==1){
        number1=number1*10+[sender.currentTitle integerValue];
    }
    else if (steps==2||steps==3){
        number2=number2*10+[sender.currentTitle integerValue];
        steps=3;
    }
    else{
        steps=1;
        number1=0;
        number1=[sender.currentTitle integerValue];
    }
    [self uiUpdate];
}
- (IBAction)inputOperator:(UIButton*)sender {
    operator=sender.currentTitle;
    if(steps==3){
        number1=[self calculateAnswer];
    }
    else if(steps==4){
        number1=[_numberLabel2.text integerValue];
    }
    steps=2;
    number2=0;
    [self uiUpdate];
}
- (IBAction)inputEqual:(UIButton *)sender {
    if(steps==3){
        _numberLabel2.text=[NSString stringWithFormat:@"%ld", [self calculateAnswer]];
        steps=4;
    }
    [self uiUpdate];
}
- (NSInteger)calculateAnswer{
    if([operator isEqualToString:@"+"])
        return number1+number2;
    else if([operator isEqualToString:@"-"])
        return number1-number2;
    else if([operator isEqualToString:@"*"])
        return number1*number2;
    else
        return number1/number2;
}
- (void)uiUpdate{
    if(steps==1){
        _numberLabel2.text=[NSString stringWithFormat:@"%ld",number1];
        _numberLabel1.text=@"";
        _operatorLabel.text=@"";
    }
    else if(steps==2){
        _numberLabel1.text=[NSString stringWithFormat:@"%ld",number1];
        _numberLabel2.text=@"";
        _operatorLabel.text=operator;
    }
    else if(steps==3){
        _numberLabel1.text=[NSString stringWithFormat:@"%ld",number1];
        _numberLabel2.text=[NSString stringWithFormat:@"%ld",number2];
        _operatorLabel.text=operator;
    }
    else{
        _numberLabel1.text=[NSString stringWithFormat:@"%ld%@%ld",number1,operator,number2];
        _operatorLabel.text=@"=";
        _numberLabel2.text=[NSString stringWithFormat:@"%ld",[self calculateAnswer]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
