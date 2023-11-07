/**
 * @file plugin.cpp
 * @brief The main file of the plugin
 */
#include "version.h"
// #include <llapi/mc/CommandOrigin.hpp>
// #include <llapi/mc/CommandOutput.hpp>
// #include <llapi/mc/ItemStack.hpp>
// #include <llapi/mc/Level.hpp>
// #include <llapi/mc/Player.hpp>
// #include <llapi/mc/Types.hpp>

// #include <llapi/DynamicCommandAPI.h>
// #include <llapi/EventAPI.h>
// #include <llapi/GlobalServiceAPI.h>
#include <llapi/LoggerAPI.h>

#include <string>

extern Logger logger;

void PluginInit() {
  logger.info("{} {}", "🤷",
              "这是 >>工程模板<< 构建的插件，没有任何作用。");
}