"use strict";function _toConsumableArray(e){if(Array.isArray(e)){for(var r=0,t=Array(e.length);r<e.length;r++)t[r]=e[r];return t}return Array.from(e)}var path=require("path"),webpack=require("webpack"),_require=require("vue-loader"),VueLoaderPlugin=_require.VueLoaderPlugin,utils=require("../utils"),config=require(utils.rootPath("env.param.config")),rules=require("./webpack.rules.conf.js");function resolve(e){return path.join(__dirname,"..",e)}module.exports={context:utils.rootPath(""),entry:{app:"./src/main.js"},output:{path:config.build.assetsRoot,filename:"[name].js",publicPath:"production"===process.env.NODE_ENV?config.build.assetsPublicPath:config.dev.assetsPublicPath},resolve:{extensions:[".js",".vue",".json"],alias:utils.getAliasPathConfig()},module:{rules:[].concat(_toConsumableArray(rules))},plugins:[new VueLoaderPlugin,new webpack.ProvidePlugin({jQuery:"jquery",$:"jquery"})],node:{setImmediate:!1,dgram:"empty",fs:"empty",net:"empty",tls:"empty",child_process:"empty"}};