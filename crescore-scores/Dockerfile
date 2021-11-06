ARG c=Release

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
EXPOSE 80
EXPOSE 82
EXPOSE 84
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG c
WORKDIR /source
COPY src/CreScore.Scores/*.csproj src/CreScore.Scores/
COPY src/CreScore.Scores.Protos/*.csproj src/CreScore.Scores.Protos/
COPY src/CreScore.Scores.Infrastructure/*.csproj src/CreScore.Scores.Infrastructure/
COPY src/CreScore.Scores.Core/*.csproj src/CreScore.Scores.Core/
COPY *.sln .

RUN dotnet restore

COPY . .
RUN dotnet build "src/CreScore.Scores.Protos/CreScore.Scores.Protos.csproj" -c $c

RUN dotnet build "CreScore.Scores.sln" -c $c -o /app/build

FROM build AS publish
ARG c
RUN dotnet publish "CreScore.Scores.sln" -c $c -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT dotnet CreScore.Scores.dll