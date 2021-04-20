#pragma once

#ifdef LT_PLATFORM_WINDOWS

extern Lotus::Application* Lotus::CreateApplication();

int main(int argc, char** argv)
{
	printf("Lotus Engine");
	auto app = Lotus::CreateApplication();
	app->Run();
	delete app;
}

#endif