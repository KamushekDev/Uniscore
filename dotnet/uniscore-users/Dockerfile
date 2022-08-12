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
COPY src/Uniscore.Users/*.csproj src/Uniscore.Users/
COPY src/Uniscore.Users.Contract/*.csproj src/Uniscore.Users.Contract/
COPY src/Uniscore.Users.Core/*.csproj src/Uniscore.Users.Core/
COPY src/Uniscore.Users.Infrastructure/*.csproj src/Uniscore.Users.Infrastructure/
COPY src/Uniscore.Users.Protos/*.csproj src/Uniscore.Users.Protos/

COPY tests/Uniscore.Users.Tests/*.csproj tests/Uniscore.Users.Tests
COPY *.sln .

RUN dotnet restore

COPY . .


FROM build AS publish
ARG c
RUN dotnet publish "Uniscore.Users.sln" -c $c -o /app/publish


FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/KamushekDev/Uniscore"

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT dotnet Uniscore.Users.dll
