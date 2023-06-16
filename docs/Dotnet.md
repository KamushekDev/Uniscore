### Добавить новый сервис:
* Создать отдельный workflow .github\workflows\\<project-name\>.yaml по образу уже существующих
* В файле .github\workflows\infra-deploy.yaml в шаге restart-services добавить \<project-name\> в matrix
* В файле .github\workflows\service-deploy.yaml добавить \<project-name\> в input options переменной service, создать отдельную джобу билда для нового сервиса (и needs джобы deploy)
* В директории k8s\base\services создать новую директорию \<project-name\> для нового проекта и создать в ней файлы deployment.yaml, service.yaml и описать их в kustomization.yaml с commonLables - resource: \<project-name\>
* В директорях k8s\overlays\production\services и k8s\overlays\staging\services также создать по новой директории \<project-name\> для нового проекта и создать в ней файл kustomization.yaml со ссылкой на kustomization из k8s\base\services\\<project-name\>
* В файлах k8s\overlays\production\services\kustomization.yaml и k8s\overlays\staging\services\kustomization.yaml добавить в resources новую директорию \<project-name\>

### Поднять .net версию:
Если в проекте меняется версия .net нужно поменять следующие места:
* Поменять переменную target-framework в файле dotnet\\<projectName\>\github.ci.yaml
* Убедиться что в файле .github\actions\dotnet\get-runtime-from-ci-file есть строчка runtimes_dict[\<target-framework\>] = '\<runtime-version\>'
* Убедиться что в файле .github\actions\dotnet\get-sdk-by-runtime есть строчка sdk_dict[\<runtime-version\>]='\<sdk-version\>'
* Убедиться что в файле .github\actions\dotnet\create-dockerfile в шагах runtime-image и sdk-image есть строчки 
runtimes_images_dict[\<runtime-version\>]='\<runtime-version-image\>' (существующий имадж взятый [отсюда](https://mcr.microsoft.com/v2/dotnet/aspnet/tags/list)) и
sdk_images_dict[\<sdk-version\>]='\<sdk-version-image\>' (существующий имадж взятый [отсюда](https://mcr.microsoft.com/v2/dotnet/sdk/tags/list))