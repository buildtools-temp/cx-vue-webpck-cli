"use strict";var FriendlyErrorsPlugin=require("friendly-errors-webpack-plugin"),portfinder=require("portfinder"),utils=require("../utils"),config=require(utils.rootPath("env.param.config")),devWebpackConfig=require("../env/webpack.dev.conf");module.exports=new Promise(function(o,i){portfinder.basePort=process.env.PORT||config.dev.port,portfinder.getPort(function(e,r){e?i(e):(process.env.PORT=r,devWebpackConfig.devServer.port=r,console.log(r),devWebpackConfig.plugins.push(new FriendlyErrorsPlugin({compilationSuccessInfo:{notes:["Create by Broccoli spring( gcx ) <Lensgcx@163.com>: https://github.com/Lensgcx"],messages:["Your application is running here: http://"+devWebpackConfig.devServer.host+":"+r]},onErrors:config.dev.notifyOnErrors?utils.createNotifierCallback():void 0})),o(devWebpackConfig))})});