# LiteLoaderBDS C++插件 工程模板

## 工程文件介绍

注意：初始的模板并不包含以下所有内容（有些东西是构建生成的）

| 路径          | 说明                    | 注意                                                         |
| :------------ | :---------------------- | ------------------------------------------------------------ |
| /.vscode      | vscode 相关配置         | xmake会将生成的compile_commands.json放在这里，所以vscode的clangd插件要设置解析此json路径 |
| /.xmake       | xmake 相关配置及缓存    |                                                              |
| /src          | c++源码                 | 在version.h设定插件信息，plugin.cpp里写插件功能              |
| /build        | 构建缓存及目标          |                                                              |
| /vsxmake2022  | vs2022工程              | 这个需要自己执行xmake命令生成，用于项目调试                  |
| .clang-format | C++代码格式化style配置  |                                                              |
| .clangd       | clangd配置              |                                                              |
| readme.md     | 这个就不用说了吧        |                                                              |
| xmake.lua     | xmake 构建脚本          |                                                              |
| vc140.pdb     | debug构建生成的信息文件 |                                                              |
|               |                         |                                                              |



## 一些有用的命令

- 生成 VS2022 工程

  `xmake project -k vsxmake`

