<CODEGEN_FILENAME><Structure_name>DataObject.dbl</CODEGEN_FILENAME>
<OPTIONAL_USERTOKEN>RPSDATAFILES= </OPTIONAL_USERTOKEN>
;//****************************************************************************
;//
;// Title:       Symphony_Data.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Template to define structure based Data Object with CLR types
;//
;// Author:      Richard C. Morris, Synergex Professional Services Group
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
;//****************************************************************************
;;****************************************************************************
;; WARNING: This code was generated by CodeGen. Any changes that you
;;          make to this code will be overwritten if the code is regenerated!
;;
;; Template author: Richard C. Morris, Synergex Professional Services Group
;;
;; Template Name:   Symphony Framework : <TEMPLATE>.tpl
;;
;;***************************************************************************
import System
import System.Collections.Generic
import System.Text
import Harmony.Core.Converters

namespace <NAMESPACE>

	.include '<structure_noalias>' repository <RPSDATAFILES>, structure = 'STR<Structure_name>', end

    public partial class <Structure_name> extends Harmony.Core.DataObjectBase
        ;;make the record available and a copy
        private mSynergyData, STR<Structure_name> 
		private mOriginalSynergyData, STR<Structure_name> 
		
		private static sMetadata, @<Structure_name>Metadata
		static method <Structure_name>
		proc
			sMetadata = new <Structure_name>Metadata()
			Harmony.Core.DataObjectMetadataBase.MetadataLookup.TryAdd(^typeof(<Structure_name>), sMetadata)
		endmethod
		
        ;;; <summary>
        ;;;  Constructor, initialise the base fields
        ;;; </summary>
        public method <Structure_name>
            endparams
            parent()
        proc
			init mSynergyData, mOriginalSynergyData
        endmethod

		;;; <summary>
		;;;  Alternate Constructor, accepts the structured data
		;;; </summary>
		public method <Structure_name>
			in req inData			,STR<Structure_name>
			endparams
			parent()
		proc
			mSynergyData = mOriginalSynergyData = inData
		endmethod

		public override method InternalSynergyRecord, void
			targetMethod, @Harmony.Core.AlphaAction
		proc
			targetMethod(mSynergyData, mGlobalRFA)
		endmethod
		
        ;;Expose fields as properties for data binding
        <FIELD_LOOP>
		<IF CUSTOM_NOT_SYMPHONY_ARRAY_FIELD>
        ;;<Field_name>
		public property <Field_sqlname>, <FIELD_CSTYPE>
			method get
			proc
				<IF ALPHA>
				mreturn (<FIELD_CSTYPE>)SynergyAlphaConverter.Convert(mSynergyData.<Field_name>, ^null, ^null, ^null)
				</IF ALPHA>
				<IF DATE>
				<IF DATE_YYYYMMDD>
				mreturn (<FIELD_CSTYPE>)mDateConveter.Convert(mSynergyData.<Field_name>, ^null, ^null, ^null)
				<ELSE>
				mreturn (<FIELD_CSTYPE>)DateTime.Parse((string)mSynergyData.<Field_name>)
				</IF>
				</IF>
				<IF DECIMAL>
				<IF PRECISION>
				mreturn (<FIELD_CSTYPE>)SynergyImpliedDecimalConverter.Convert(mSynergyData.<Field_name>, ^null, "DECIMALPLACES#<FIELD_PRECISION>", ^null)
				<ELSE>
				mreturn (<FIELD_CSTYPE>)mSynergyData.<Field_name>
				</IF>
				</IF DECIMAL>
				<IF INTEGER>
				mreturn (<FIELD_CSTYPE>)mSynergyData.<Field_name>
				</IF INTEGER>
				
            endmethod
			method set
			proc
				<IF ALPHA>
				mSynergyData.<Field_name> = (<FIELD_TYPE>)SynergyAlphaConverter.ConvertBack(value, ^null, ^null, ^null)
				</IF ALPHA>
				<IF DATE_YYYYMMDD>
				mSynergyData.<Field_name> = (<FIELD_TYPE>)mDateConveter.ConvertBack(value, ^null, ^null, ^null)
				</IF DATE_YYYYMMDD>
				<IF DECIMAL>
				mSynergyData.<Field_name> = value
				</IF DECIMAL>
				<IF INTEGER>
				mSynergyData.<Field_name> = value
				</IF INTEGER>
			endmethod
		endproperty
		</IF CUSTOM_NOT_SYMPHONY_ARRAY_FIELD>
        </FIELD_LOOP>

        ;;; <summary>
        ;;; Expose the complete synergy record
        ;;; </summary>
		public override property SynergyRecord, a
            method get
            proc
                mreturn mSynergyData
            endmethod
        endproperty
		
		;;; <summary>
        ;;; Expose the complete original synergy record
        ;;; </summary>
		public override property OriginalSynergyRecord, a
            method get
            proc
                mreturn mOriginalSynergyData
            endmethod
        endproperty

		;;; <summary>
		;;; Allow the host to validate all fields. Each field will fire the validation method.
		;;; </summary>
		public override method InitialValidateData, void
			endparams
		proc
		endmethod
		
		public override property Metadata, @DataObjectMetadataBase
			method get
			proc
				mreturn sMetadata
			endmethod
		endproperty
	endclass
	
	public partial class <Structure_name>Metadata extends Harmony.Core.DataObjectMetadataBase
		
		public method <Structure_name>Metadata
		proc
			RPSStructureName = "<STRUCTURE_NOALIAS>"
			RPSStructureSize = ^size(STR<Structure_name>)
			;;fill in all of the field defs and other type level info here
			<FIELD_LOOP>
			<IF CUSTOM_NOT_SYMPHONY_ARRAY_FIELD>
			AddFieldInfo("<Field_sqlname>", "<FIELD_TYPE_NAME>", <FIELD_SIZE>, <FIELD_POSITION>, 0<FIELD_PRECISION>, false)
			</IF>
            </FIELD_LOOP>
			
		endmethod
	
		public override method MakeNew, @DataObjectBase
			dataArea, a
			grfa, a
		proc
			mreturn new <Structure_name>((STR<Structure_name>)dataArea) { GlobalRFA = grfa }
		endmethod
	endclass
endnamespace

