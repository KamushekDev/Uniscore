### Добавить новый сервис:
* Создать отдельный workflow .github\workflows\\<project-name\>.yaml по образу уже существующих
* В файле .github\workflows\infra-deploy.yaml в шаге restart-services добавить \<project-name\> в matrix
* В файле .github\workflows\service-deploy.yaml:
    1. Добавить \<project-name\> в input options переменной service
    2. Создать отдельную джобу билда для нового сервиса
    3. В файле .github\workflows\service-deploy.yaml:
        1. Cоздать джобу deploy-\<project-name\>
        2. Добавить эту джобу в needs джобы deploy
* В директории k8s\base\services:
    1. Создать новую директорию \<project-name\> для нового проекта
    2. Создать в новой директории файлы:
        1. deployment.yaml
        2. service.yaml
        3. kustomization.yaml
    3. В файле kustomization.yaml
        1. Описать файлы deployment.yaml и service.yaml
        2. Добавить commonLables: resource: \<project-name\>
* В директории k8s\overlays\production\services:
    1. Создать новую директорию \<project-name\> для нового проекта
    2. Создать в ней файл kustomization.yaml со ссылкой на kustomization из k8s\base\services\\<project-name\>
* В директории k8s\overlays\staging\services:
    1. Создать новую директорию \<project-name\> для нового проекта
    2. Создать в ней файл kustomization.yaml со ссылкой на kustomization из k8s\base\services\\<project-name\>
* В файле k8s\overlays\production\services\kustomization.yaml добавить в resources новую директорию \<project-name\>
* В файле k8s\overlays\staging\services\kustomization.yaml добавить в resources новую директорию \<project-name\>

### Поднять .net версию:
Если в проекте меняется версия .net нужно поменять следующие места:
* Поменять переменную target-framework в файле dotnet\\<projectName\>\github.ci.yaml
* Убедиться что в файле .github\actions\dotnet\get-runtime-from-ci-file есть строчка runtimes_dict[\<target-framework\>] = '\<runtime-version\>'
* Убедиться что в файле .github\actions\dotnet\get-sdk-by-runtime есть строчка sdk_dict[\<runtime-version\>]='\<sdk-version\>'
* Убедиться что в файле .github\actions\dotnet\create-dockerfile:
    1. В шаге runtime-image есть строчка runtimes_images_dict[\<runtime-version\>]='\<runtime-version-image\>' (существующий имадж взятый [отсюда](https://mcr.microsoft.com/v2/dotnet/aspnet/tags/list))
    2. В шаге sdk-image есть строчка sdk_images_dict[\<sdk-version\>]='\<sdk-version-image\>' (существующий имадж взятый [отсюда](https://mcr.microsoft.com/v2/dotnet/sdk/tags/list))