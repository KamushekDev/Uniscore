FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["score-twitch-events/score-twitch-events.csproj", "score-twitch-events/"]
RUN dotnet restore "score-twitch-events/score-twitch-events.csproj"
COPY . .
WORKDIR "/src/score-twitch-events"
RUN dotnet build "score-twitch-events.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "score-twitch-events.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "score-twitch-events.dll"]
