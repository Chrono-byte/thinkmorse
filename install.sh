#! /bin/bash

# colors
RED='\033[0;31m'
NC='\033[0m' # No Color

# Useless decorative messages
echo -e "${RED}
 ********** **      **          **     ****     ****                                
/////**/// /**     //          /**    /**/**   **/**                                
    /**    /**      ** ******* /**  **/**//** ** /**  ******  ******  ******  ***** 
    /**    /****** /**//**///**/** ** /** //***  /** **////**//**//* **////  **///**
    /**    /**///**/** /**  /**/****  /**  //*   /**/**   /** /** / //***** /*******
    /**    /**  /**/** /**  /**/**/** /**   /    /**/**   /** /**    /////**/**//// 
    /**    /**  /**/** ***  /**/**//**/**        /**//****** /***    ****** //******
    //     //   // // ///   // //  // //         //  //////  ///    //////   ////// 
${NC}"
echo "--------------------------"
echo "Prepare for install!"

function thinkmorseWithoutUpdate () {
    # I know that if someone is running this script they probably just cloned the repo and are up to date but still
    echo "Skipping Update"

    # Amazing fake loading bar! Totally not from stack overflow/exchange
    sudo cp -i ./thinkmorse.sh /usr/bin/thinkmorse
    sudo chmod +x /usr/bin/thinkmorse
    echo -ne '#####                     (33%)\r'
    sleep 2
    echo -ne '#############             (66%)\r'
    sleep 2
    echo -ne '#######################   (100%)\r'
    echo -ne '\n'
    echo -e "${RED}ThinkMorse${NC} has now been installed"
}

function thinkmorseWithUpdate () {
    # I know that if someone is running this script they probably just cloned the repo and are up to date but still
    echo "Making sure we are up to date"
    git fetch --all
    git reset --hard origin/master -q
    echo "All done updating"

    # Amazing fake loading bar! Totally not from stack overflow/exchange
    sudo cp -i ./thinkmorse.sh /usr/bin/thinkmorse
    sudo chmod +x /usr/bin/thinkmorse
    echo -ne '#####                     (33%)\r'
    sleep 2
    echo -ne '#############             (66%)\r'
    sleep 2
    echo -ne '#######################   (100%)\r'
    echo -ne '\n'
    echo -e "${RED}ThinkMorse${NC} has now been installed"
}

if [ $1 ]; then
    thinkmorseWithoutUpdate
else 
    thinkmorseWithUpdate
fi
