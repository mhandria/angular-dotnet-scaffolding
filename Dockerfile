# Stage 1 (Build)
FROM microsoft/dotnet:2.2-sdk as builder
WORKDIR /src

RUN apt-get update && \
    apt-get -y install sudo 


RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

RUN apt-get install -y nodejs

# copy files over to container 
COPY nuget.config .
COPY . .

RUN dotnet publish --output /app/ --configuration Release


# Stage 2 (Package)
FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app

COPY --from=builder /app/ .

EXPOSE 80
ENV ASPNETCORE_URLS http://*:80
ENTRYPOINT ["dotnet", "Horus.ToxOrNotV2.dll"]