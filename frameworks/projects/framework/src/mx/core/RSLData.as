////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2010 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.core
{

[ExcludeClass]
    
/**
 *  A Class the describes configuration data for an RSL.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.0
 *  @productversion Flex 4.5
 */
public class RSLData
{
    include "../core/Version.as";
    
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     */
    public function RSLData(url:String = null, policyFileUrl:String = null, 
                            digest:String = null, hashType:String = null, 
                            isSigned:Boolean = false, 
                            verifyDigest:Boolean = false,
                            applicationDomainTarget:String = "default",
                            moduleFactory:IFlexModuleFactory = null)
    {
        super();
        
        this.url = url;
        this.policyFileUrl = policyFileUrl;
        this.digest = digest;
        this.hashType = hashType;
        this.isSigned = isSigned;
        this.verifyDigest = verifyDigest;
        this.applicationDomainTarget = applicationDomainTarget;
        this.moduleFactory = moduleFactory;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------
    
    //----------------------------------
    //  applicationDomainTarget
    //----------------------------------
    
    /**
     *  @private
     * 
     *  The requested application domain to load the RSL into.
     *  <p>One of the following:
     *  <ul>
     *  <li>"default"
     *  <li>"current"
     *  <li>"parent"
     *  <li>"top-level"
     *  </p>
     */
    public var applicationDomainTarget:String;
    
    //----------------------------------
    //  digest
    //----------------------------------

    /**
     *  @private
     * 
     *  The digest of the RSL. This is null for and RSL without a digest.
     */
    public var digest:String;
    
    //----------------------------------
    //  digest type
    //----------------------------------

    /**
     *  @private
     * 
     *  The type of hash used to create the RSL digest. This is null for an RSL 
     *  without a digest. The only supported hash type is SHA256.TYPE_ID.
     */
    public var hashType:String;
    
    //----------------------------------
    //  isSigned
    //----------------------------------

    /**
     *  @private
     * 
     *  True if the RSL has been signed by Adobe. False otherwise.
     */
    public var isSigned:Boolean;
    
    //----------------------------------
    //  moduleFactory
    //----------------------------------
    
    /**
     *  @private
     * 
     *  Non-null if this RSL should be loaded into an application
     *  domain other than the application domain associated with the
     *  module factory performing the load. If null, then load into
     *  the current application domain.
     */
    public var moduleFactory:IFlexModuleFactory;
    
   //----------------------------------
    //  policy file url
    //----------------------------------
    
    /**
     *  @private
     * 
     *  Location of the policy file.
     */
    public var policyFileUrl:String;
    
    //----------------------------------
    //  url
    //----------------------------------
    
    /**
     *  @private
     * 
     *  Location of the RSL. The URL can be absolute or relative to the 
     *  application or module. 
     */
    public var url:String;
    
    //----------------------------------
    //  verifyDigest
    //----------------------------------
    
    /**
     *  @private
     * 
     *  True if the digest must be verified before loading the RSL into memory.
     *  False allows the RSL to be loaded without verification.
     */
    public var verifyDigest:Boolean;
 
}
}