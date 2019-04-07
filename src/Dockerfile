FROM fsharp:netcore

MAINTAINER Marteinn

ENV SCAFFOLD_APP_NAME=GiraffeApp

WORKDIR /app
ADD . /app/

RUN dotnet new -i "giraffe-template"

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["runserver"]
