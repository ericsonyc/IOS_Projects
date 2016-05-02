# LGCalender
calender 日历控件 IOS

## LGCalender是一个很好的IOS日历控件，可以切换月份和年份，选中效果也非常好，直接把文件夹拖入您的工程中就可以使用！
示例：

![](https://github.com/jamy0801/LGCalender/blob/master/gif/LGCalendar.gif)

使用代码：
  
    LGCalendar *calendar = [[LGCalendar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 240)];
    [self.view addSubview:calendar];
    calendar.delegate = self;
    self.LGCalendar = calendar;

代理方法：

     -(void)LGCalendar:(LGCalendar *)calendar didSelectDate:(NSDate *)selectDate
      {
        NSLog(@"select date:%@", selectDate);
        [self.textField setText:[NSString stringWithFormat:@"%@", selectDate]];
      }
      
就可以获取点击的时间啦！
