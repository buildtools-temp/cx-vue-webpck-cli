"use strict";var chalk=require("chalk"),run_dev=require("./run.dev"),run_build=require("./run.build"),env=process.env.env_config;function console_text(e){console.log("\n"),console.log(chalk.blue("  ================      "+{dev:"Dev",mock:"Mock",prod:"Build"}[e]+" is running...  please wait for a while. ===============")),console.log("\n")}console_text(env),module.exports="dev"===env||"mock"===env?run_dev:run_build;