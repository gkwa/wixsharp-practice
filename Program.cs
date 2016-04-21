using System;
using WixSharp;

class Script
{
    static public void Main()
    {
        var project = new Project("sbxcam_ndi",
        new Dir(@"%ProgramFiles%\Streambox\Tricaster NDI decoder plugin",
        new DirFiles(@"dist\*.*")));

        project.GUID = new Guid("6f330b47-2577-43ad-9095-1861ba25889b");

        Compiler.BuildMsi(project);
    }
}
