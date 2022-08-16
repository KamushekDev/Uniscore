ARG c=Release

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-arm64v8 AS base
EXPOSE 80
EXPOSE 82
EXPOSE 84
WORKDIR /app


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG c

RUN --mount=type=secret,id=packages_pat,required=true \
    dotnet nuget add source -u KamushekDev -p "$(cat /run/secrets/packages_pat)" --store-password-in-clear-text -n github "https://nuget.pkg.github.com/KamushekDev/index.json"

WORKDIR /source
COPY src/Uniscore.Auth.Client/*.csproj src/Uniscore.Auth.Client/
COPY src/Uniscore.Auth/*.csproj src/Uniscore.Auth/
COPY src/Uniscore.Auth.Contract/*.csproj src/Uniscore.Auth.Contract/
COPY src/Uniscore.Auth.Core/*.csproj src/Uniscore.Auth.Core/
COPY src/Uniscore.Auth.Infrastructure/*.csproj src/Uniscore.Auth.Infrastructure/
COPY src/Uniscore.Auth.Protos/*.csproj src/Uniscore.Auth.Protos/
COPY *.sln .

RUN dotnet restore

COPY . .


FROM build AS publish
ARG c
RUN dotnet publish "Uniscore.Auth.sln" -c $c -o /app/publish


FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/KamushekDev/Uniscore"

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT dotnet Uniscore.Auth.dll
