#!/bin/bash
set -e

if [[ $(command -v lcov) == '' ]]; then
    printf "${RED}You haven't installed lcov.\n"
    printf "${RED}We will run 'brew install lcov'.\n"
    brew install lcov
else
    printf "${GREEN}You have installed lcov 👍.\n"
fi

RED='\033[0;31m'
GREEN='\033[0;32m'

PATH_COVERAGE='coverage/lcov.info'

flutter pub get
flutter test --coverage
lcov --remove $PATH_COVERAGE \
    'lib/main.dart' \
    'lib/*/*.g.dart' \
    -o coverage/lcov.info
if [ -n "$1" ]; then
    if [ "$1" = true ]; then
        printf "${GREEN}Let's open an report.\n"
        genhtml $PATH_COVERAGE -o coverage
        open coverage/index.html
    fi
fi


MIN_COVERAGE_PERC=100
percentageRate=$(lcov --summary "$PATH_COVERAGE" | grep "lines......" | cut -d ' ' -f 4 | cut -d '%' -f 1)

if [ "$(echo "${percentageRate} < $MIN_COVERAGE_PERC" | bc)" -eq 1 ]; then
    printf "${RED}Error: Your coverage rate is to low, expected ${MIN_COVERAGE_PERC}%% but have ${percentageRate}%%.\n"
    printf "${RED}Please add more tests to cover your code.\n"
    printf "${RED}To see in local your coverage rate use:\n"
    printf "${RED}    sh ftest.sh true\n"
    exit 1
else
    printf "${GREEN}Coverage rate is fine 👍.\n"
fi
