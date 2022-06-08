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
COPY src/Uniscore.Scores/*.csproj src/Uniscore.Scores/
COPY src/Uniscore.Scores.Protos/*.csproj src/Uniscore.Scores.Protos/
COPY src/Uniscore.Scores.Infrastructure/*.csproj src/Uniscore.Scores.Infrastructure/
COPY src/Uniscore.Scores.Core/*.csproj src/Uniscore.Scores.Core/
COPY *.sln .

RUN dotnet restore

COPY . .


FROM build AS publish
ARG c
RUN dotnet publish "Uniscore.Scores.sln" -c $c -o /app/publish


FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/KamushekDev/Uniscore"

WORKDIR /app
COPY --from=publish /app/publish .
# COPY --from=publish /app/GIT .
ENTRYPOINT dotnet Uniscore.Scores.dll
