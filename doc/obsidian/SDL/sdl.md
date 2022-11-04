# `sdl`
## расширенный набор команд низкоуровневой графики
### отображение библиотеки `libSDL2` на команды и операции виртуальной машины

https://lazyfoo.net/tutorials/SDL/

## [[cmake]]

```
find_package(SDL2 REQUIRED)
include_directories(skelex ${SDL2_INCLUDE_DIRS})
target_link_libraries(skelex ${SDL2_LIBRARIES})
```
