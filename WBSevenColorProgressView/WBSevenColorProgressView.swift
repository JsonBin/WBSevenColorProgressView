//
//  WBSevenColorProgressView.swift
//  WBSevenColorProgressView
//
//  Created by Zwb on 16/4/11.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class WBSevenColorProgressView: UIView {

    private var gress:CGFloat?
    private var height:CGFloat?
    private var maskLayer:CALayer?
    private var pwindows:UIWindow?
    private var timer:NSTimer?
    private var gradient=CAGradientLayer()
    
    class var sharedInstance : WBSevenColorProgressView {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : WBSevenColorProgressView? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WBSevenColorProgressView()
            Static.instance?.gress=0
            Static.instance?.pwindows=UIApplication.sharedApplication().keyWindow
            Static.instance?.startTimer()
        }
        return Static.instance!
    }
    
    // 显示在最上面
    internal func showTop()->Void{
        height=0
        created()
        pwindows?.addSubview(self)
    }
    // 默认显示在navigationBar的下面
    internal func showDefault()->Void{
        height=32
        created()
        pwindows?.addSubview(self)
    }
    // 显示在最下面
    internal func showBottom()->Void{
        height=(pwindows?.frame.size.height)!/2-1
        created()
        pwindows?.addSubview(self)
    }
    
    internal func setProgress(progress:CGFloat)->Void{
        gress=progress
        print(progress)
        maskLayer?.frame=CGRectMake(0, 0, gress!*width(), 2)
        if progress>=1.0 {
            stopLoop()
            hidde()
        }
    }
    
    private func hidde()->Void{
        self.removeFromSuperview()
    }
    
    private func created()->Void{
        self.frame=CGRectMake(0, height!,width(), 2)
        gradient.bounds = self.bounds
        gradient.position = self.center
        gradient.colors = [UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.yellowColor().CGColor,UIColor.greenColor().CGColor, UIColor.blueColor().CGColor, UIColor.blackColor().CGColor, UIColor.purpleColor().CGColor]
        gradient.startPoint = CGPointMake(0, 0.5)
        gradient.endPoint = CGPointMake(1, 0.5)
        self.layer.addSublayer(gradient)
        
        maskLayer=CALayer()
        maskLayer?.frame=CGRectMake(gradient.frame.origin.x, gradient.frame.origin.y, gress!*width(), 2)
        maskLayer?.borderWidth=2
        maskLayer?.borderColor=UIColor.blueColor().CGColor
        gradient.mask=maskLayer
    }
    
    private func startTimer()->Void{
        timer=NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(WBSevenColorProgressView.timeLoop), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }
    
    @objc private func timeLoop()->Void{
        var colorarray=gradient.colors
        let lastcolor=colorarray?.last
        colorarray?.removeLast()
        colorarray?.insert(lastcolor!, atIndex: 0)
        gradient.colors=colorarray
    }
    
    private func stopLoop()->Void{
        timer?.invalidate()
        timer=nil
    }
    
    private func width()->CGFloat{
        return pwindows!.bounds.size.width
    }

}
