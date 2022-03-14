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
COPY src/CreScore.Auth/*.csproj src/CreScore.Auth/
COPY src/CreScore.Auth.Protos/*.csproj src/CreScore.Auth.Protos/
COPY src/CreScore.Auth.Infrastructure/*.csproj src/CreScore.Auth.Infrastructure/
COPY src/CreScore.Auth.Core/*.csproj src/CreScore.Auth.Core/
COPY src/CreScore.Auth.Helper/*.csproj src/CreScore.Auth.Helper/
COPY *.sln .

RUN dotnet restore

COPY . .


FROM build AS publish
ARG c
RUN dotnet publish "CreScore.Auth.sln" -c $c -o /app/publish


FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/KamushekDev/CreScore"

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT dotnet CreScore.Auth.dll
