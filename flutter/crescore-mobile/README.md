# uniscore

Unique score

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
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml
```

## Generate proto client
```
protoc --dart_out=grpc:lib/generated --proto_path=protos protos/google/protobuf/timestamp.proto
protoc --dart_out=grpc:lib/generated --proto_path=protos protos/google/protobuf/wrappers.proto
protoc --dart_out=grpc:lib/generated --proto_path=protos protos/BFF.proto
```

## Update firebase config
```
flutterfire configure
```

## Get app keys
```

Uniscore\flutter\crescore-mobile\android> ./gradlew signingReport

cd "C:\Program Files\Java\jdk-11.0.10\bin"
-- data from key.properties
./keytool.exe -list -v -keystore "<storeFile>" -alias upload -storepass <storePassword> -keypass <keyPassword>
./keytool.exe -list -v -keystore "C:\Users\Kamushek\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```

412x914