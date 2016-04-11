//
//  ViewController.swift
//  WBSevenColorProgressView
//
//  Created by Zwb on 16/4/11.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title="WBSevenColorProgressView"
        
        // 初始化
        let view = WBSevenColorProgressView.sharedInstance
        // 显示在最顶部
//        view.showTop()
        // 默认显示的位置，navigationBar下面
        view.showDefault()
        // 显示在最底部
//        view.showBottom()
        
        var count = CGFloat()
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer,dispatch_walltime(nil, 0), 1 * NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer, {
            if(count >= 1){
                dispatch_source_cancel(timer);
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    // 下载时加入这句表示下载进度
                    view.setProgress(count)
                });
                count += 0.05;
            }
        });
        dispatch_resume(timer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

