<CODEGEN_FILENAME>TestContext.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.3.5</REQUIRES_CODEGEN_VERSION>
;//****************************************************************************
;//
;// Title:       ODataTestContext.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Generates a test context class with static values that can
;//              be used to feed data into unit tests.
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
;; Title:       TestContext.dbl
;;
;; Type:        Class
;;
;; Description: Test context class with static values that can be used to feed
;;              data into unit tests.
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

namespace <NAMESPACE>

	public static partial class TestContext
<STRUCTURE_LOOP>

		;;------------------------------------------------------------
		;;Test data for <StructureNoplural>

	<PRIMARY_KEY>
		<SEGMENT_LOOP>
		public static readwrite property Get<StructureNoplural>_<SegmentName>, <SEGMENT_CSTYPE>
		</SEGMENT_LOOP>
	</PRIMARY_KEY>
;//
;//
;//
<IF STRUCTURE_RELATIONS>
	<RELATION_LOOP>

		<PRIMARY_KEY>
		<SEGMENT_LOOP>
		public static readwrite property Get<StructureNoplural>_Expand_<IF MANY_TO_ONE_TO_MANY>REL_<RelationFromkey></IF MANY_TO_ONE_TO_MANY><IF ONE_TO_ONE>REL_<RelationFromkey></IF ONE_TO_ONE><IF ONE_TO_MANY_TO_ONE>REL_<RelationTostructurePlural></IF ONE_TO_MANY_TO_ONE><IF ONE_TO_MANY>REL_<RelationTostructurePlural></IF ONE_TO_MANY>_<SegmentName>, <SEGMENT_CSTYPE>
		</SEGMENT_LOOP>
		</PRIMARY_KEY>
	</RELATION_LOOP>
</IF STRUCTURE_RELATIONS>
;//
;//
;//
		<PRIMARY_KEY>

		<SEGMENT_LOOP>
		public static readwrite property Get<StructureNoplural>_Expand_All_<SegmentName>, <SEGMENT_CSTYPE>
		</SEGMENT_LOOP>
		</PRIMARY_KEY>
;//
;//
;//
	<ALTERNATE_KEY_LOOP>
	
		<SEGMENT_LOOP>
		public static readwrite property Get<StructureNoplural>_ByAltKey_<KeyName>_<SegmentName>, <SEGMENT_CSTYPE>
		</SEGMENT_LOOP>
	</ALTERNATE_KEY_LOOP>
;//
;//
;//
	<PRIMARY_KEY>
		<SEGMENT_LOOP>
		public static readwrite property Update<StructureNoplural>_<SegmentName>, <SEGMENT_CSTYPE>
		</SEGMENT_LOOP>
	</PRIMARY_KEY>

</STRUCTURE_LOOP>


	endclass

endnamespace
