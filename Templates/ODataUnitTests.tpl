<CODEGEN_FILENAME><StructureNoplural>Tests.dbl</CODEGEN_FILENAME>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       ODataUnitTests.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Generates unit tests for Web API / OData controllers in a
;//              Harmony Core environment.
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
;; Title:       <StructureNoplural>Tests.dbl
;;
;; Type:        Class
;;
;; Description: Unit tests for the operastions defined in <StructurePlural>Controller.
;;
;;*****************************************************************************
;; WARNING
;;
;; This file was code generated. Avoid editing this file, as any changes that
;; you make will be lost of the file is re-generated.
;;
;;*****************************************************************************
;;
;; Copyright (c) 2018, Synergex International, Inc.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;;
;; * Redistributions of source code must retain the above copyright notice,
;;   this list of conditions and the following disclaimer.
;;
;; * Redistributions in binary form must reproduce the above copyright notice,
;;   this list of conditions and the following disclaimer in the documentation
;;   and/or other materials provided with the distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.
;;
;;*****************************************************************************

import Microsoft.VisualStudio.TestTools.UnitTesting
import Newtonsoft.Json
import System.Collections.Generic
import System.Net.Http
import <NAMESPACE>.Models

namespace <NAMESPACE>

	{TestClass}
	public partial class <StructureNoplural>Tests

		{TestMethod}
		{TestCategory("<StructureNoplural> Tests")}
		public method GetAll<StructurePlural>, void
		proc
			disposable data client = TestEnvironment.Server.CreateClient()
			disposable data response = client.GetAsync("/odata/<StructurePlural>").Result
			data result = response.Content.ReadAsStringAsync().Result
			response.EnsureSuccessStatusCode()
			data <structurePlural>, @OData<StructurePlural>, JsonConvert.DeserializeObject<OData<StructurePlural>>(result)
		endmethod
	
		{TestMethod}
		{TestCategory("Order Tests")}
		public method Get<StructureNoplural>, void
		proc
			data client = TestEnvironment.Server.CreateClient()
			data request = String.Format("/odata/<StructurePlural>({0})", TestContext.<StructureNoplural>ID)
			data response = client.GetAsync(request).Result
			data result = response.Content.ReadAsStringAsync().Result
			response.EnsureSuccessStatusCode()
			data <structureNoplural>, @OData<StructureNoplural>, JsonConvert.DeserializeObject<OData<StructureNoplural>>(result)
		endmethod

;		{TestMethod}
;		{TestCategory("<StructureNoplural> Tests")}
;		public method Create<StructureNoplural>, void
;		proc
;			disposable data client = TestEnvironment.Server.CreateClient()
;			disposable data requestBody = new StringContent("")
;			disposable data response = client.PostAsync("/odata/<StructurePlural>", requestBody).Result
;			data result = response.Content.ReadAsStringAsync().Result
;			response.EnsureSuccessStatusCode()
;		endmethod

;		{TestMethod}
;		{TestCategory("<StructureNoplural> Tests")}
;		public method Update<StructureNoplural>, void
;		proc
;			disposable data client = TestEnvironment.Server.CreateClient()
;			disposable data requestBody = new StringContent("")
;			disposable data response = client.PutAsync("/odata/<StructurePlural>(1)", requestBody).Result
;			response.EnsureSuccessStatusCode()
;		endmethod

	endclass

endnamespace