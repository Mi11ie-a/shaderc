project "ShaderC"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"libshaderc/src/shaderc.cc",
		"libshaderc/src/shaderc_private.h",
		"libshaderc_util/src/compiler.cc",
		"libshaderc_util/src/file_finder.cc",
		"libshaderc_util/src/io_shaderc.cc",
		"libshaderc_util/src/message.cc",
		"libshaderc_util/src/resources.cc",
		"libshaderc_util/src/shader_stage.cc",
		"libshaderc_util/src/spirv_tools_wrapper.cc",
		"libshaderc_util/src/version_profile.cc",
		
	}

    defines
    {
		"ENABLE_HLSL"
    }

	links
	{
		"glslang",
		"SPIRV-Tools",
		"SPIRV-Cross"
	}

    includedirs
    {
		"libshaderc/include",
		"libshaderc_util/include",
		"../SPIRV-Tools/include",
		"../SPIRV-Cross",
		"../glslang"
    }

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter {"configurations:Dist"}
        runtime "Release"
        optimize "on"
			
	filter "configurations:Release"
		runtime "Release"
		optimize "on"