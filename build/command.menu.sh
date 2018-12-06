#Design by Broccoli spring( gcx-高仓雄 ) <Lensgcx@163.com>
#!/usr/bin/env bash

update_CX_grid='cx-grid'
#update_All_list='cx-grid|bootstrap'
update_All_list='cx-grid'

function Update_base {
    clear
    echo '========================== *** Update start *** =========================='
    echo
    echo "Start time : `date +%Y-%m-%d,%H:%m:%s`"
    echo

    cnpm -v
    if [ $? -eq 0 ];
    then
        echo cnpm exists
    else
        echo 'Your connection to the default npm registry seems to be slow.Use https://registry.npm.taobao.org for faster installation'
        echo cnpm is not exists
        npm install -g cnpm --registry=https://registry.npm.taobao.org
    fi

    cnpm install -g npm-check-updates

    rm -rf node_modules
    ncu '/^'"$1"'.*$/' -u
    cnpm i

    echo
    echo "End time : `date +%Y-%m-%d,%H:%m:%s`"
    echo
    echo '========================== *** Update successful *** =========================='
}



# simple script menu
function Update_node_modules {
      clear
      echo '========================== *** Update start *** =========================='
      echo
      echo "Start time : `date +%Y-%m-%d,%H:%m:%s`"
      echo

      rm -rf node_modules
      cnpm i
      df -h

      echo
      echo "End time : `date +%Y-%m-%d,%H:%m:%s`"
      echo
      echo '========================== *** Update successful *** =========================='
}
function Update_CX_grid {
    clear
    Update_base ${update_CX_grid}
}
function Update_all {
    clear
    Update_base ${update_All_list}
}
function menu {
    clear
    echo
    echo -e '\t ========== Design by Broccoli spring( gcx-高仓雄 ) <Lensgcx@163.com> =========='
    echo
    echo -e '\t\t\t (  ) (@@) ( )  (@)  ()    @@    O     @     O     @
                         (@@@)
                     (    )
                  (@@@@)


                (   )
            ====        ________                ___________
        _D _|  |_______/        \__I_I_____===__|_________|
         |(_)---  |   H\________/ |   |        =|___ ___|      _________________
         /     |  |   H  |  |     |   |         ||_| |_||     _|                \___
        |      |  |   H  |__--------------------| [___] |   =|
        | ________|___H__/__|_____/[][]~\_______|       |   -|
        |/ |   |-----------I_____I [][] []  D   |=======|____|______________________
      __/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|________________________
       |/-=|___|=O=====O=====O=====O   |_____/~\___/          |_D__D__D_|  |_D__D__D
        \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \
    '
    echo
    echo -e "\t\t\t === SASS Frontend operation Menu === \n"
    echo -e "\t1. Run development"
    echo -e "\t2. Run mock"
    echo -e "\t3. Run production"
    echo -e "\t4. Run production analyz"
    echo -e "\t5. Run lint"
    echo -e "\t6. Run unit test"
    echo -e "\t7. Run e2e test"
    echo -e "\t8. Run test"
    echo -e "\t9. Reload node_modules"
    echo -e "\t10. Update all ns package"
    echo -e "\t0. Exit program\n\n"
    echo -en "\t\tEnter option: "
    read -n 1 option
}

function run_dev {
  cross-env NODE_ENV=development webpack-dev-server --colors --inline --progress --config build/run/run.dev.js
}
function run_prod {
  cross-env NODE_ENV=production env_config=prod node build/run/run.build.js
}

while [ 1 ]
do
    menu
    case $option in
        0)
         break ;;
        1)
         NODE_ENV=development env_config=dev webpack-dev-server --colors --inline --progress --config build/run/run.dev.js ;;
        2)
         NODE_ENV=development env_config=mock webpack-dev-server --colors --inline --progress --config build/run/run.dev.js ;;
        3)
         cross-env NODE_ENV=production env_config=prod node build/run/run.build.js ;;
        4)
         NODE_ENV=production npm_config_report=true cross-env NODE_ENV=production env_config=prod node build/run/run.build.js ;;
        5)
         eslint --ext .js,.vue src build/test/unit build/test/e2e/specs ;;
        6)
         cross-env BABEL_ENV=test karma start build/test/unit/karma.conf.js --single-run ;;
        7)
         node build/test/e2e/runner.js ;;
        8)
         cross-env BABEL_ENV=test karma start build/test/unit/karma.conf.js --single-run && node build/test/e2e/runner.js ;;
        9)
         Update_node_modules ;;
        10)
         Update_all ;;
        *)
        clear
        echo "Sorry, wrong selection";;
    esac
    echo -en "\n\n\t\t\tHit any key to continue"
    read -n 1 line
done




#list=( "cx-grid" "123" "456" )
#
#arrWithParam(){
#    sw=false;
#    for loop in "cx-grid" "123" "456"
#    do
##        echo "$loop"
##        echo "$1"
#        if [[ "$1" =~ "$loop" ]]
#            then
#                 sw=true
#                 break
#            fi
#    done
#    echo $sw
#}
#
#for package in $(npm outdated --parseable --depth=0 | cut -d: -f2)
#do
#    echo "================"
#    echo "$package"
#    for target in "$list"
#        do
#            echo "$target"
#            state=$(arrWithParam "$package")
#            if [[ $state == "true" ]];
#            then
#                 echo 当前安装的是 "$package"
#                 cnpm install "$package"
#
##                 echo 当前没有安装的是+"$package"
#            fi
#        done
#done
