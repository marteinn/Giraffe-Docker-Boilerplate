#!/bin/bash
set -e

# $0 is a script name, $1, $2, $3 etc are passed arguments
# $1 is our command
# Credits: https://rock-it.pl/how-to-write-excellent-dockerfiles/
CMD=$1

setup_giraffe() {
    echo "Scaffold project"

    # It yields "No such file or directory" on nix*, so ignore it and continue
    dotnet new giraffe -o $SCAFFOLD_APP_NAME || true

    echo "Move app"
    cp -Rp ./$SCAFFOLD_APP_NAME/. .
    rm -rf ./$SCAFFOLD_APP_NAME

    echo "Pin aspnetcore to 2.1.3 for project"
    sed -i -E 's/Microsoft.AspNetCore.App.*Version="2.1.."/Microsoft.AspNetCore.App" Version="2.1.3"/g' src/$SCAFFOLD_APP_NAME/$SCAFFOLD_APP_NAME.fsproj

    echo "Install packages"
    chmod +x build.sh
    ./build.sh
}


case "$CMD" in
    "runserver" )
        if [ ! -f ./build.sh ]; then
            setup_giraffe
        fi

        echo "Run server"
        cd src/$SCAFFOLD_APP_NAME
        ASPNETCORE_URLS="http://+:5000" dotnet watch run
        ;;
    * )
        # Run custom command. Thanks to this line we can still use
        # "docker run our_container /bin/bash" and it will work
        exec $CMD ${@:2}
        ;;
esac
