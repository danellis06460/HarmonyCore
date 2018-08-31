<CODEGEN_FILENAME><StructurePlural>Controller.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.3.5</REQUIRES_CODEGEN_VERSION>
<REQUIRES_OPTION>TF</REQUIRES_OPTION>
<CODEGEN_FOLDER>Controllers</CODEGEN_FOLDER>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVICES_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>API_ENABLE_QUERY_PARAMS</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       ODataController.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Used to create OData Controllers in a Harmony Core environment
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
;; Title:       <StructurePlural>Controller.dbl
;;
;; Description: OData controller for the <STRUCTURE_NOALIAS> structure.
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

import Microsoft.AspNetCore.JsonPatch
import Microsoft.AspNetCore.Mvc
import Microsoft.AspNet.OData
import Microsoft.AspNet.OData.Routing
import Microsoft.EntityFrameworkCore
import Microsoft.EntityFrameworkCore.Infrastructure
import Harmony.Core.EF.Extensions
<IF DEFINED_ENABLE_AUTHENTICATION>
import Microsoft.AspNetCore.Authorization
</IF DEFINED_ENABLE_AUTHENTICATION>
import <MODELS_NAMESPACE>
import Harmony.Core.Interface

namespace <NAMESPACE>

<IF DEFINED_ENABLE_AUTHENTICATION>
    {Authorize}
</IF DEFINED_ENABLE_AUTHENTICATION>
    ;;; <summary>
    ;;; OData controller for <StructurePlural>
    ;;; </summary>
    public class <StructurePlural>Controller extends ODataController
    
        public readwrite property DBContext, @<SERVICES_NAMESPACE>.DBContext
        public readwrite property ServiceProvider, @IServiceProvider

        ;;; <summary>
        ;;; Constructs a new instance of <StructurePlural>Controller
        ;;; </summary>
        ;;; <param name="dbContext">Database context</param>
        public method <StructurePlural>Controller
            dbContext, @<SERVICES_NAMESPACE>.DBContext
            serviceProvider, @IServiceProvider
        proc
            this.DBContext = dbContext
            this.ServiceProvider = serviceProvider
        endmethod

;//
;// GET ALL -------------------------------------------------------------------
;//
        {ODataRoute("<StructurePlural>")}
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        ;;; <summary>
        ;;; Get all <StructurePlural>
        ;;; </summary>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get, @IActionResult
        proc
            mreturn Ok(DBContext.<StructurePlural>)
        endmethod

;//
;// GET ONE -------------------------------------------------------------------
;//
<PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        ;;; <summary>
        ;;; Get a single <StructureNoplural> by primary key.
        ;;; </summary>
    <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
    </SEGMENT_LOOP>
        ;;; <returns>Returns a SingleResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get, @SingleResult<<StructureNoplural>>
    <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
    </SEGMENT_LOOP>
        proc
;//Shouldn't really need the generic type arg on FindQuery. Compiler issue?
            mreturn new SingleResult<<StructureNoplural>>(DBContext.<StructurePlural>.FindQuery<<StructureNoplural>>(<SEGMENT_LOOP>a<SegmentName><,></SEGMENT_LOOP>))
        endmethod
</PRIMARY_KEY>

;//
;// GET BY ALTERNATE KEY ------------------------------------------------------
;//
<IF DEFINED_ENABLE_ALTERNATE_KEYS>
<ALTERNATE_KEY_LOOP>
    <IF DUPLICATES>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        ;;; <summary>
        ;;; Get <structurePlural> by alternate key key <KeyName>.
        ;;; </summary>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method GetByKey<KeyName>, @IActionResult
            <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
            </SEGMENT_LOOP>
        proc
            data result = DBContext.<StructurePlural>.FindAlternate(<SEGMENT_LOOP>"<SegmentName>",a<SegmentName><,></SEGMENT_LOOP>)
            if (result == ^null)
                mreturn NotFound()
            mreturn Ok(result)
        endmethod
    <ELSE>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        ;;; <summary>
        ;;; Get <structureNoplural> by alternate key <KeyName>.
        ;;; </summary>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        ;;; <returns>Returns a SingleResult indicating the status of the operation and containing any data that was returned.</returns>
        public method GetByKey<KeyName>, @SingleResult<<StructureNoplural>>
            <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
            </SEGMENT_LOOP>
        proc
            mreturn new SingleResult<<StructureNoplural>>(DBContext.<StructurePlural>.FindAlternate(<SEGMENT_LOOP>"<SegmentName>",a<SegmentName><,></SEGMENT_LOOP>))
        endmethod
    </IF DUPLICATES>

</ALTERNATE_KEY_LOOP>
</IF DEFINED_ENABLE_ALTERNATE_KEYS>
;//
;// GET INDIVIDUAL PROPERTIES -------------------------------------------------
;//
<IF DEFINED_ENABLE_PROPERTY_ENDPOINTS>
;//
;// In order for the $value function to work in conjunction with these properties,
;// the name of a single key segment MUST be "key"!!! Likely doesn't work with segmented keys.
;//
    <FIELD_LOOP>
      <IF NOTPKSEGMENT>
        <IF CUSTOM_NOT_HARMONY_EXCLUDE>
        <PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<IF SINGLE_SEGMENT>{key}<ELSE><SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP></IF SINGLE_SEGMENT>)/<FieldSqlName>")}
        ;;; <summary>
        ;;; Get the <FieldSqlName> property of a single <StructureNoplural>, by primary key.
        ;;; </summary>
        <IF SINGLE_SEGMENT>
        ;;; <param name="key"><FIELD_DESC></param>
        <ELSE>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        </IF SINGLE_SEGMENT>
        ;;; <returns>
        ;;; Returns <IF ALPHA>a string</IF ALPHA><IF DECIMAL><IF PRECISION>a decimal<ELSE><IF CUSTOM_HARMONY_AS_STRING>a string<ELSE>an int</IF CUSTOM_HARMONY_AS_STRING></IF PRECISION></IF DECIMAL><IF DATE>a DateTime</IF DATE><IF TIME>a DateTime</IF TIME><IF INTEGER>an int</IF INTEGER> containing the value of the requested property.
        ;;;</returns>
        public method Get<FieldSqlName>, @IActionResult
        <SEGMENT_LOOP>
            <IF SINGLE_SEGMENT>
            {FromODataUri}
            required in key, <SEGMENT_SNTYPE>
            <ELSE>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
            </IF SINGLE_SEGMENT>
        </SEGMENT_LOOP>
        proc
            data result = DBContext.<StructurePlural>.Find(<IF SINGLE_SEGMENT>key<ELSE><SEGMENT_LOOP>a<SegmentName><,></SEGMENT_LOOP></IF SINGLE_SEGMENT>)
            if (result==^null)
                mreturn NotFound()
            mreturn OK(result.<FieldSqlName>)
        endmethod

        </PRIMARY_KEY>
        </IF CUSTOM_NOT_HARMONY_EXCLUDE>
      </IF NOTPKSEGMENT>
    </FIELD_LOOP>
</IF DEFINED_ENABLE_PROPERTY_ENDPOINTS>
;//
;// POST ----------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_POST>
        {ODataRoute("<StructurePlural>")}
        ;;; <summary>
        ;;; Create a new <structureNoplural> (automatically assigned primary key).
        ;;; </summary>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Post, @IActionResult
            {FromBody}
            required in a<StructureNoplural>, @<StructureNoplural>
        proc
            ;;Remove the primary key fields from ModelState
<PRIMARY_KEY>
<SEGMENT_LOOP>
            ModelState.Remove("<FieldSqlName>")
</SEGMENT_LOOP>
</PRIMARY_KEY>

            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)
            disposable data keyFactory = (@IPrimaryKeyFactory)ServiceProvider.GetService(^typeof(IPrimaryKeyFactory))
            ;;Get the next available primary key value
            KeyFactory.AssignPrimaryKey(a<StructureNoplural>)

            ;;Add the new <structureNoplural>
            DBContext.<StructurePlural>.Add(a<StructureNoplural>)
            DBContext.SaveChanges()

            mreturn Created(a<StructureNoplural>)

        endmethod

</IF DEFINED_ENABLE_POST>
;//
;// PUT -----------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_PUT>
    <PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        ;;; <summary>
        ;;; Create (with a client-supplied primary key) or replace a <structureNoplural>.
        ;;; </summary>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Put, @IActionResult
            <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
            </SEGMENT_LOOP>
            {FromBody}
            required in a<StructureNoplural>, @<StructureNoplural>
        proc
            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)

            ;;Ensure that the key values in the URI win over any data that may be in the model object
            <SEGMENT_LOOP>
            a<StructureNoplural>.<FieldSqlname> = a<SegmentName>
            </SEGMENT_LOOP>

            try
            begin
                ;;Add and commit
                data existing = DBContext.<StructurePlural>.Find(<SEGMENT_LOOP>a<SegmentName><,></SEGMENT_LOOP>)
                if(existing == ^null) then
                begin
                    DBContext.<StructurePlural>.Add(a<StructureNoplural>)
                    DBContext.SaveChanges()
                    mreturn Created(a<StructureNoplural>)
                end
                else
                begin
                    a<StructureNoplural>.CopyTo(existing)
                    DBContext.SaveChanges()
                    mreturn NoContent()
                end
            end
            catch (e, @InvalidOperationException)
            begin
                mreturn BadRequest(e)
            end
            endtry

        endmethod

    </PRIMARY_KEY>
</IF DEFINED_ENABLE_PUT>
;//
;// PATCH ---------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_PATCH>
        <PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        ;;; <summary>
        ;;; Patch  (partial update) a <structureNoplural>.
        ;;; </summary>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Patch, @IActionResult
        <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
        </SEGMENT_LOOP>
            {FromBody}
            required in a<StructureNoplural>, @JsonPatchDocument<<StructureNoplural>>
        proc
            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)

            ;;Patch the existing <structureNoplural>
            try
            begin
                ;;Get the <structureNoplural> to be updated
                data <structureNoplural>ToUpdate = DBContext.<StructurePlural>.Find(<SEGMENT_LOOP>a<SegmentName><,></SEGMENT_LOOP>)

                ;;Did we find it?
                if(<structureNoplural>ToUpdate == ^null)
                    mreturn NotFound()

                ;;Apply the changes to the <structureNoplural> we read
                a<StructureNoplural>.ApplyTo(<structureNoplural>ToUpdate)

                ;;Update and commit
                DBContext.<StructurePlural>.Update(<structureNoplural>ToUpdate)
                DBContext.SaveChanges()
            end
            catch (e, @InvalidOperationException)
            begin
                mreturn BadRequest(e)
            end
            endtry

            mreturn NoContent()

        endmethod

    </PRIMARY_KEY>
</IF DEFINED_ENABLE_PATCH>
;//
;// DELETE --------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_DELETE>
    <PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><SegmentName>={a<SegmentName>}<,></SEGMENT_LOOP>)")}
        ;;; <summary>
        ;;; Delete a <structureNoplural>.
        ;;; </summary>
        <SEGMENT_LOOP>
        ;;; <param name="a<SegmentName>"><FIELD_DESC></param>
        </SEGMENT_LOOP>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Delete, @IActionResult
        <SEGMENT_LOOP>
            {FromODataUri}
            required in a<SegmentName>, <SEGMENT_SNTYPE>
        </SEGMENT_LOOP>
        proc
            ;;Get the <structureNoplural> to be deleted
            data <structureNoplural>ToRemove = DBContext.<StructurePlural>.Find(<SEGMENT_LOOP>a<SegmentName><,></SEGMENT_LOOP>)

            ;;Did we find it?
            if (<structureNoplural>ToRemove == ^null)
                mreturn NotFound()

            ;;Delete and commit
            DBContext.<StructurePlural>.Remove(<structureNoplural>ToRemove)
            DBContext.SaveChanges()

            mreturn NoContent()

        endmethod

    </PRIMARY_KEY>
</IF DEFINED_ENABLE_DELETE>
    endclass

endnamespace