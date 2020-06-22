FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app

EXPOSE 6000
ENV ASPNETCORE_URLS=http://+:6000/
#EXPOSE 6001
#ENV ASPNETCORE_URLS=https://+:6001/

COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "SimpleApi2.dll"]