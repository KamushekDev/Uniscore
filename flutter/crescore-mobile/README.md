# crescore

Creator Score

# Wireless debug
```
adb pair ip:port    
adb connect ip:port
```

## Generate native splash screen
```
flutter pub run flutter_native_splash:create
```

## Generate launch icons
```
flutter pub run flutter_launcher_icons:main
```

## Generate proto client
```
protoc --dart_out=grpc:lib/generated -Iprotos protos/<Protofile_name>

protoc --dart_out=grpc:lib/generated -Iprotos protos/Scores.proto
```