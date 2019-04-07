FROM fsharp:netcore

ENV SCAFFOLD_APP_NAME=GiraffeApp \
    ASPNETCORE_ENVIRONMENT=Development \
    DOTNET_USE_POLLING_FILE_WATCHER=1

WORKDIR /app
ADD . /app/

RUN dotnet new -i "giraffe-template"

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["runserver"]
