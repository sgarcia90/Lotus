workspace "Lotus"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Lotus"
	location "Lotus"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include;"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"LT_PLATFORM_WINDOWS",
			"LT_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		}

		filter "configurations:Debug"
			defines "LT_DEBUG"
			symbols "On"
		
		filter "configurations:Release"
			defines "LT_RELEASE"
			optimize "On"
		
		filter "configurations:Dist"
			defines "LT_DIST"
			optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Lotus/vendor/spdlog/include;",
		"Lotus/src"
	}

	links
	{
		"Lotus"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"LT_PLATFORM_WINDOWS",
		}

		filter "configurations:Debug"
			defines "LT_DEBUG"
			symbols "On"
		
		filter "configurations:Release"
			defines "LT_RELEASE"
			optimize "On"
		
		filter "configurations:Dist"
			defines "LT_DIST"
			optimize "On"
