set_project("MC_LL_PLUG")
set_languages("c++20")
add_rules("mode.debug", "mode.release")
set_optimize("fastest")

--? 指定 SDK路径 和 server路径
local LL_SDK_PATH = "fake_sdk_path" --最后不要带 / 
local SERVER_PATH = "fake_server_path"

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

target("_mc_plug_template")
	set_kind("shared")
	add_files("src/*.cpp")
	add_links("LiteLoader", "SymDBHelper")
	--? 下面两个lib需要使用 SDK 中的 tools/PeEditor.exe 反编译server启动程序
	-- add_links("bedrock_server_api", "bedrock_server_var")
	after_build(function (target) 
		os.cp(target:targetfile(), SERVER_PATH.."/plugins/")
	end)
target_end()

