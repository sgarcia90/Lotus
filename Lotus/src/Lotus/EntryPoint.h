#pragma once

#ifdef LT_PLATFORM_WINDOWS

extern Lotus::Application* Lotus::CreateApplication();

int main(int argc, char** argv)
{
	Lotus::Log::Init();
	LT_CORE_WARN("Initialized Core Logger!");
	int a = 5;
	LT_INFO("Initialized Client Logger! Var = {0}", a);

	auto app = Lotus::CreateApplication();
	app->Run();
	delete app;
}

#endif