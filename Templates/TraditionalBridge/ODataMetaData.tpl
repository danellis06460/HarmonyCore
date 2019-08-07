<CODEGEN_FILENAME><StructureNoplural>MetaData.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.4.1</REQUIRES_CODEGEN_VERSION>
;//****************************************************************************
;//
;// Title:       ODataMetaData.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Template to define meta data associated with a data model
;//
;// Copyright (c) 2012, Synergex International, Inc. All rights reserved.
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
;; Title:       <StructureNoplural>MetaData.dbl
;;
;; Description: Defines meta data associated with a <StructureNoplural> model.
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

import System
import System.Collections.Generic
import System.Text
import Harmony.Core
import Harmony.Core.Converters

namespace <NAMESPACE>

    ;;; <summary>
    ;;; Global structure representing a <StructureNoplural> record.
    ;;; </summary>
    .include "<STRUCTURE_NOALIAS>" repository, public structure="str<StructureNoplural>", end

    ;;; <summary>
    ;;; Exposes metadata relating to the <StructureNoplural> model class.
    ;;; </summary>
    public partial class <StructureNoplural>Metadata extends DataObjectMetadataBase

;//
;//    Instantiate any required converters
;//
<COUNTER_1_RESET>
<FIELD_LOOP>
    <IF CUSTOM_NOT_HARMONY_EXCLUDE>
      <COUNTER_1_INCREMENT>
      <IF COUNTER_1_EQ_1>
        ;; Define custom property formatters
      </IF>
        <IF DATEORTIME>
          <IF DATE_YYMMDD>
            <IF CUSTOM_HARMONY_AS_STRING>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalConverter.LiteralFormatter("XX-XX-XX")
            <ELSE>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalDateConverter.LiteralFormatter("FORMAT:YYMMDD")
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF DATE_YYMMDD>
          <IF DATE_YYYYMMDD>
            <IF CUSTOM_HARMONY_AS_STRING>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalConverter.LiteralFormatter("XXXX-XX-XX")
            <ELSE>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalDateConverter.LiteralFormatter("FORMAT:YYYYMMDD")
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF DATE_YYYYMMDD>
          <IF DATE_YYYYJJJ>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalDateConverter.LiteralFormatter("FORMAT:YYYYJJJ")
          </IF DATE_YYYYJJJ>
          <IF TIME>
            <IF CUSTOM_HARMONY_AS_STRING>
            <IF TIME_HHMM>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalConverter.LiteralFormatter("XX:XX")
            </IF TIME_HHMM>
            <IF TIME_HHMMSS>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalConverter.LiteralFormatter("XX:XX:XX")
            </IF TIME_HHMMSS>
            <ELSE>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalDateConverter.LiteralFormatter("FORMAT:HHMM")
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF TIME>
        <ELSE>
            <IF CUSTOM_HARMONY_AS_STRING>
        private m<FieldSqlname>Formatter, @ILiteralFormatter, new SynergyDecimalConverter.LiteralFormatter("<FIELD_FORMATSTRING>")
            <ELSE>
            </IF CUSTOM_HARMONY_AS_STRING>
        </IF DATEORTIME>
    </IF CUSTOM_NOT_HARMONY_EXCLUDE>
</FIELD_LOOP>

        ;;; <summary>
        ;;; Constructs an new <StructureNoplural>Metadata object.
        ;;; </summary>
        public method <StructureNoplural>Metadata
        proc
            ;; Define structure name and size
            RPSStructureName = "<STRUCTURE_NOALIAS>"
            RPSStructureSize = ^size(str<StructureNoplural>)
;//
;//    Add definitions for the structures fields
;//

            ;; Define fields
<FIELD_LOOP>
<IF STRUCTURE_RELATIVE>
            AddFieldInfo("RecordNumber", "INTEGER", 4, 0, 0, false)
</IF STRUCTURE_RELATIVE>
    <IF CUSTOM_NOT_HARMONY_EXCLUDE>
        <IF DATEORTIME>
          <IF DATE_YYMMDD>
            <IF CUSTOM_HARMONY_AS_STRING>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            <ELSE>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF DATE_YYMMDD>
          <IF DATE_YYYYMMDD>
            <IF CUSTOM_HARMONY_AS_STRING>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            <ELSE>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF DATE_YYYYMMDD>
          <IF DATE_YYYYJJJ>
            <IF CUSTOM_HARMONY_AS_STRING>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            <ELSE>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF DATE_YYYYJJJ>
          <IF TIME>
            <IF CUSTOM_HARMONY_AS_STRING>
            <IF TIME_HHMM>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF TIME_HHMM>
            <IF TIME_HHMMSS>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF TIME_HHMMSS>
            <ELSE>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            </IF CUSTOM_HARMONY_AS_STRING>
          </IF TIME>
        <ELSE>
            <IF CUSTOM_HARMONY_AS_STRING>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false, m<FieldSqlname>Formatter)
            <ELSE>
            AddFieldInfo("<FieldSqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false)
            </IF CUSTOM_HARMONY_AS_STRING>
        </IF DATEORTIME>
    </IF CUSTOM_NOT_HARMONY_EXCLUDE>
</FIELD_LOOP>

            ;;If we have an InitializeCustomFields method then call it.
            InitializeCustomFields()

        endmethod

        ;;; <summary>
        ;;; Returns a new <StructureNoplural> object containing data from a record and a GRFA.
        ;;; </summary>
        ;;; <param name="dataArea">The record containing the data for the new <StructureNoplural> object.</param>
        ;;; <param name="grfa">The GRFA associated with the current state of the data.</param>
        ;;; <returns></returns>
        public override method MakeNew, @DataObjectBase
            required in dataArea, a
            required in grfa, a
        proc
            mreturn new <StructureNoplural>(dataArea, grfa)
        endmethod

        ;;; <summary>
        ;;; Returns a new <StructureNoplural> object containing data from a record and a GRFA.
        ;;; </summary>
        ;;; <param name="dataArea">The record containing the data for the new <StructureNoplural> object.</param>
        ;;; <param name="grfa">The GRFA associated with the current state of the data.</param>
        ;;; <param name="joinedObjects">Data to allow the related data properties <IF DEFINED_ENABLE_RELATIONS><IF STRUCTURE_RELATIONS>(<RELATION_LOOP><IF TO_STRUCTURE_INCLUDED><IF MANY_TO_ONE_TO_MANY><HARMONYCORE_RELATION_NAME></IF MANY_TO_ONE_TO_MANY><IF ONE_TO_ONE><HARMONYCORE_RELATION_NAME></IF ONE_TO_ONE><IF ONE_TO_MANY_TO_ONE><HARMONYCORE_RELATION_NAME></IF ONE_TO_MANY_TO_ONE><IF ONE_TO_MANY><HARMONYCORE_RELATION_NAME></IF ONE_TO_MANY><,and></IF TO_STRUCTURE_INCLUDED></RELATION_LOOP>) </IF STRUCTURE_RELATIONS></IF DEFINED_ENABLE_RELATIONS>to be populated.</param>
        ;;; <returns></returns>
        public override method MakeNew, @DataObjectBase
            required in dataArea, a
            required in grfa, a
            required in joinedObjects, [#]KeyValuePair<String, Object>
        proc
            data new<StructureNoplural> = new <StructureNoplural>(dataArea, grfa)
            mreturn new<StructureNoplural>

        endmethod

<IF STRUCTURE_ISAM>
        ;;; <summary>
        ;;; Formats a literal value for a key lookup.
        ;;; </summary>
        ;;; <param name="keyNumber">Key number.</param>
        ;;; <param name="parts">Dictionary containing key segment names and values.</param>
        ;;; <returns></returns>
        public override method FormatKeyLiteral, a
            required in keyNumber, int
            required in parts, @Dictionary<String, Object>
            endparams
        proc

            throw new ApplicationException(String.Format("Invalid key number {0} encountered in <StructureNoplural>Metadata.FormatKeyLiteral",keyNumber))

        endmethod
<ELSE>
        public override method FormatKeyLiteral, a
            required in keyNumber, int
            required in parts, @Dictionary<String, Object>
        proc
            mreturn ' '
        endmethod

</IF STRUCTURE_ISAM>

        ;;;<summary>
        ;;; Provide a partial method to allow for initialization of custom fields.
        ;;;</summary>
        private partial method InitializeCustomFields, void

        endmethod

    endclass

endnamespace
