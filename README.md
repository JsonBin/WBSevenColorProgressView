# WBSevenColorProgressView
Swift写的一款7彩颜色进度条 可通过下载进度跟踪变化，且能显示在三个不同的位置

使用方法
=======

         // 初始化
        let view = WBSevenColorProgressView.sharedInstance
        // 显示在最顶部
        //  view.showTop()
        // 默认显示的位置，navigationBar下面
           view.showDefault()
        // 显示在最底部
        // view.showBottom()

* 跟踪进度显示

        // 下载时加入这句表示下载进度
         view.setProgress(count)
         
  
效果图
=======

  ![gif](https://github.com/JsonBin/WBSevenColorProgressView/raw/master/WBSevenColorProgressView/sevencolor1.gif "显示在最顶层")
  ![gif](https://github.com/JsonBin/WBSevenColorProgressView/raw/master/WBSevenColorProgressView/sevencolor2.gif "默认显示位置")
  ![gif](https://github.com/JsonBin/WBSevenColorProgressView/raw/master/WBSevenColorProgressView/sevencolor3.gif "显示在最底层")
