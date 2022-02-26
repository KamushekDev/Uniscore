ARG c=Release
ARG proto_os
ARG proto_cpu

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
EXPOSE 80
EXPOSE 82
EXPOSE 84
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG c
ARG proto_os
ARG proto_cpu
ENV PROTOBUF_TOOLS_OS $proto_os
ENV PROTOBUF_TOOLS_CPU $proto_cpu

RUN echo $PROTOBUF_TOOLS_OS
RUN echo $PROTOBUF_TOOLS_CPU

WORKDIR /source
COPY src/CreScore.Scores/*.csproj src/CreScore.Scores/
COPY src/CreScore.Scores.Protos/*.csproj src/CreScore.Scores.Protos/
COPY src/CreScore.Scores.Infrastructure/*.csproj src/CreScore.Scores.Infrastructure/
COPY src/CreScore.Scores.Core/*.csproj src/CreScore.Scores.Core/
COPY *.sln .

RUN dotnet restore

COPY . .

# RUN cd /root/.nuget/packages/grpc.tools/2.41.0/tools/linux_arm64 && echo $(ls)
# RUN cd /source/src/CreScore.Scores.Protos && echo $(ls)
# RUN echo $(cat /root/.nuget/packages/grpc.tools/2.41.0/build/_protobuf/Google.Protobuf.Tools.targets)

RUN dotnet build "src/CreScore.Scores.Protos/CreScore.Scores.Protos.csproj" -c $c

RUN dotnet build "CreScore.Scores.sln" -c $c -o /app/build

FROM build AS publish
ARG c
RUN dotnet publish "CreScore.Scores.sln" -c $c -o /app/publish

FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/KamushekDev/CreScore"

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT dotnet CreScore.Scores.dll
