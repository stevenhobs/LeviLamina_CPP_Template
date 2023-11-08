set_project("MC_LL_PLUG")
set_languages("c++20")
add_rules("mode.debug", "mode.release")
set_optimize("fastest")

--[[⬇️ 指定插件文件名，SDK路径，server路径]]
local PLUGIN_NAME = "_fake_plugin"
local LL_SDK_PATH = "fake_sdk_path" --最后不要带 / 
local SERVER_PATH = "fake_server_path"
--[[⬆️ 指定插件文件名，SDK路径，server路径]]

--[[⬇️ 默认默认配置代码 谨慎修改]]
add_includedirs(LL_SDK_PATH.."/include")
add_linkdirs(LL_SDK_PATH.."/lib")
add_defines(
	"NDEBUG",
	"NOMINMAX",
	"TEMPLATE_EXPORTS",
	"UNICODE",
	"WIN32_LEAN_AND_MEAN",
	"_AMD64_",
	"_CRT_SECURE_NO_WARNINGS",
	"_UNICODE",
	"_USRDLL",
	"_WINDLL",
	"_WINDOWS"
)
add_cxxflags(
	-- "/diagnostics:column",
	"/EHsc",
	-- "/FC",
	"/FS",
	"/GL",
	"/MD",
	"/nologo",
	-- "/permissive-",
	"/sdl",
	"/utf-8",
	"/Zc:inline",
	"/Zi"
)
add_shflags(
	"/DEBUG",
	-- "/DELAYLOAD:bedrock_server.dll",
	"/DLL",
	"/IGNORE:4199",
	"/INCREMENTAL:NO",
	"/LTCG:INCREMENTAL",
	"/MANIFESTUAC:NO",
	"/MACHINE:X64",
	"/NOLOGO",
	"/OPT:ICF",
	"/OPT:REF",
	"/SUBSYSTEM:CONSOLE"
)

--* 功能函数
function sdk_load(options) -- 加载 sdk，参数应当在使用PeEditor反编译服务器主程序后设定为true
	local br_lib = options.br_lib or false
	add_links("LiteLoader", "SymDBHelper")
	if br_lib == true then
	    add_links("bedrock_server_api", "bedrock_server_var")
	end
end
function copy_to_server() -- 插件到服务器 plugins 文件夹
	after_build(function (target) 
		os.cp(target:targetfile(), SERVER_PATH.."/plugins/")
	end)
end
function load_in_server()
    -- todo 配置是否在 server 中加载
end
--[[⬆️ 默认默认配置代码 谨慎修改]]

--[[⬇️ 插件目标构建]]
target(PLUGIN_NAME)
	set_kind("shared")
	add_files("src/*.cpp")
	sdk_load{br_lib = false}
	-- copy_to_server()
target_end()
--[[⬆️ 插件目标构建]]
