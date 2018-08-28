<CODEGEN_FILENAME>SelfHost.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.3.5</REQUIRES_CODEGEN_VERSION>
<REQUIRES_USERTOKEN>DATA_FOLDER</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>API_DOCS_PATH</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVICES_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_PROTOCOL</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_NAME</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_HTTP_PORT</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_HTTPS_PORT</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       ODataStandaloneSelfHost.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Generates a program to self-host Harmony Core services
;//
;// Copyright (c) 2018, Synergex International, Inc. All rights reserved.
;//
;// Redistribution and use in source and binary forms, with or without
;// modification, are permitted provided that the following conditions are met:
;//
;// * Redistributions of source code must retain the above copyright notice,
;//   this list of conditions and the following disclaimer.
;//
;// * Redistributions in binary form must reproduce the above copyright notice,
;//   this list of conditions and the following disclaimer in the documentation
;//   and/or other materials provided with the distribution.
;//
;// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;// POSSIBILITY OF SUCH DAMAGE.
;//
;;*****************************************************************************
;;
;; Title:       SelfHost.dbl
;;
;; Description: A program to self-host Harmony Core services
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

import Microsoft.AspNetCore
import Microsoft.AspNetCore.Hosting
import Microsoft.AspNetCore.TestHost
import System.Collections.Generic
import System.IO
import System.Text
import <SERVICES_NAMESPACE>
import <MODELS_NAMESPACE>

main SelfHost

proc
    ;;Configure the environment
    SelfHostEnvironment.Initialize()

<IF DEFINED_ENABLE_SWAGGER_DOCS>
    Console.WriteLine("API documentation is available at <SERVER_PROTOCOL>://<SERVER_NAME>:<SERVER_HTTPS_PORT>/<API_DOCS_PATH>")

    data wwwroot = Path.Combine(AppContext.BaseDirectory, "wwwroot")

    ;;Make sure the wwwroot folder is present
    if (!Directory.Exists(wwwroot))
        Directory.CreateDirectory(wwwroot)

</IF DEFINED_ENABLE_SWAGGER_DOCS>
    ;;Start self-hosting (Kestrel)
    WebHost.CreateDefaultBuilder(new string[0])
<IF DEFINED_ENABLE_SWAGGER_DOCS>
    &    .UseContentRoot(wwwroot)
    &    .UseWebRoot(wwwroot)
</IF DEFINED_ENABLE_SWAGGER_DOCS>
<IF DEFINED_ENABLE_IIS_SUPPORT>
    &    .UseIISIntegration()
</IF DEFINED_ENABLE_IIS_SUPPORT>
    &    .UseStartup<Startup>()
    &    .UseUrls("http://<SERVER_NAME>:<SERVER_HTTP_PORT>", "https://<SERVER_NAME>:<SERVER_HTTPS_PORT>")
    &    .Build()
    &    .Run()

    ;;Cleanup the environment
    SelfHostEnvironment.Cleanup()

endmain

.Array 0

namespace <NAMESPACE>

    public static class SelfHostEnvironment

        public static Server, @TestServer
<IF DEFINED_ENABLE_AUTHENTICATION>
        public static AccessToken, string
</IF DEFINED_ENABLE_AUTHENTICATION>

        public static method Initialize, void

        proc
            ;;Allows select to join when the keys in the file are not the same type as the keys in the code
            data status, int
            xcall setlog("SYNSEL_NUMALPHA_KEYS", 1, status) 

            ;;Configure the test environment (set logicals, create files in a known state, etc.)
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance)
            setLogicals()
<IF DEFINED_ENABLE_CREATE_TEST_FILES>
            deleteFiles()
            createFiles()
</IF DEFINED_ENABLE_CREATE_TEST_FILES>

            ;;Define the content root and web root folders (so we can pick up the Swagger file for API documentation)
            data wwwroot = Path.Combine(AppContext.BaseDirectory, "wwwroot")

            ;;Create a TestServer to host the Web API services
            if (!String.IsNullOrEmpty(wwwroot) && Directory.Exists(wwwroot)) then
                Server = new TestServer(new WebHostBuilder().UseContentRoot(wwwroot).UseWebRoot(wwwroot).UseStartup<Startup>())
            else
                Server = new TestServer(new WebHostBuilder().UseStartup<Startup>())

            ;;Fake out HTTPS
            Server.BaseAddress = new Uri("<SERVER_PROTOCOL>://<SERVER_NAME>")

<IF DEFINED_ENABLE_AUTHENTICATION>
            ;;Get the access token from the OAuth Server
            data disco = DiscoveryClient.GetAsync("<OAUTH_SERVER>").GetAwaiter().GetResult()

            if (disco.IsError) then
            begin
                throw new Exception("OAuth endpoint discovery failed. Error was: " + disco.Error)
            end
            else
            begin
                data tokenClient = new TokenClient(disco.TokenEndpoint, "<OAUTH_CLIENT>", "<OAUTH_SECRET>");
                data tokenResponse = tokenClient.RequestResourceOwnerPasswordAsync("<OAUTH_TEST_USER>","<OAUTH_TEST_PASSWORD>","<OAUTH_API>").GetAwaiter().GetResult()

                if (tokenResponse.IsError) then
                begin
                    ;;Failed to get an access token from the OAuth server
                    throw new Exception(tokenResponse.Error);
                end
                else
                begin
                    ;;Now we have an access token that we can use to call our protected API
                    AccessToken = tokenResponse.AccessToken
                end
            end

</IF DEFINED_ENABLE_AUTHENTICATION>
        endmethod

        public static method Cleanup, void

        proc
            ;;Clean up the test host
            Server.Dispose()
            Server = ^null

<IF DEFINED_ENABLE_CREATE_TEST_FILES>
            ;;Delete the data files
            deleteFiles()

</IF DEFINED_ENABLE_CREATE_TEST_FILES>
        endmethod

        private static method setLogicals, void
        proc
            data sampleDataFolder = findRelativeFolderForAssembly("<DATA_FOLDER>")
            data logicals = new List<string>()
            data logical = String.Empty
            data fileSpec = String.Empty
            <STRUCTURE_LOOP>

            fileSpec = "<FILE_NAME>"
            if (fileSpec.Contains(":"))
            begin
                logical = fileSpec.Split(":")[0].ToUpper()
                if (!logicals.Contains(logical))
                    logicals.Add(logical)
            end
            </STRUCTURE_LOOP>

            foreach logical in logicals
            begin
                data sts, int
                xcall setlog(logical,sampleDataFolder,sts)
            end

        endmethod

<IF DEFINED_ENABLE_CREATE_TEST_FILES>
        private static method createFiles, void
        proc
            data chout, int
            data dataFile, string
            data xdlFile, string

            <STRUCTURE_LOOP>
            data <structurePlural> = load<StructurePlural>()
            </STRUCTURE_LOOP>

            <STRUCTURE_LOOP>
            ;;Create and load the <structurePlural> file

            dataFile = "<FILE_NAME>"
            xdlFile = "@" + dataFile.ToLower().Replace(".ism",".xdl")

            data <structureNoplural>, @<StructureNoplural>
            open(chout=0,o:i,dataFile,FDL:xdlFile)
            foreach <structureNoplural> in <structurePlural>
                store(chout,<structureNoplural>.SynergyRecord)
            close chout

            </STRUCTURE_LOOP>
        endmethod

        private static method deleteFiles, void
        proc
            <STRUCTURE_LOOP>
            ;;Delete the <structurePlural> file
            try
            begin
                xcall delet("<FILE_NAME>")
            end
            catch (e, @NoFileFoundException)
            begin
                nop
            end
            endtry

            </STRUCTURE_LOOP>
        endmethod

        <STRUCTURE_LOOP>
        public static method load<StructurePlural>, @List<<StructureNoplural>>
        proc
            data dataFile = "<FILE_NAME>"
            data textFile = dataFile.ToLower().Replace(".ism",".txt")
            data <structureNoplural>Ch, int, 0
            data <structureNoplural>Rec, str<StructureNoplural>
            data <structurePlural> = new List<<StructureNoplural>>()
            open(<structureNoplural>Ch,i:s,textFile)
            repeat
            begin
                reads(<structureNoplural>Ch,<structureNoplural>Rec,eof)
                <structurePlural>.Add(new <StructureNoplural>(<structureNoplural>Rec))
            end
        eof,
            close <structureNoplural>Ch
            mreturn <structurePlural>
        endmethod

        </STRUCTURE_LOOP>
</IF DEFINED_ENABLE_CREATE_TEST_FILES>
        private static method findRelativeFolderForAssembly, string
            folderName, string
        proc
            data assemblyLocation = ^typeof(SelfHostEnvironment).Assembly.Location
            data currentFolder = Path.GetDirectoryName(assemblyLocation)
            data rootPath = Path.GetPathRoot(currentFolder)
            while(currentFolder != rootPath)
            begin
                if(Directory.Exists(Path.Combine(currentFolder, folderName))) then
                    mreturn Path.Combine(currentFolder, folderName)
                else
                    currentFolder = Path.GetFullPath(currentFolder + "..\")
            end
            mreturn ^null
        endmethod

    endclass

endnamespace