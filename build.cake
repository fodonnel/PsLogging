var target = Argument("target", "Default");

Task("Default")
    .IsDependentOn("Install-Packages")
    .Does(() => {
      Information("Build Completed");
});

Task("Install-Packages").Does(() => {
  NuGetInstallFromConfig(
    new FilePath("packages.config"),
    new NuGetInstallSettings { OutputDirectory = "packages"} );

  CopyFile(
    @"packages\NLog.4.4.10\lib\net45\nlog.dll", 
    @"src\PsLogging\libs\nlog.dll");
});


RunTarget(target);