////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2009 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package spark.accessibility
{

import flash.accessibility.Accessibility;
import flash.events.Event;

import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.supportClasses.ButtonBarBase;
import spark.components.supportClasses.ListBase;

use namespace mx_internal;

/**
 *  ButtonBarBaseAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the ButtonBarBase class.
 *
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class ButtonBarBaseAccImpl extends ListBaseAccImpl
{
    include "../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Enables accessibility in the ButtonBarBase class.
     *
     *  <p>This method is called by application startup code
     *  that is autogenerated by the MXML compiler.
     *  Afterwards, when instances of ButtonBarBase are initialized,
     *  their <code>accessibilityImplementation</code> property
     *  will be set to an instance of this class.</p>
     *
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public static function enableAccessibility():void
    {
        ButtonBarBase.createAccessibilityImplementation =
            createAccessibilityImplementation;
    }

    /**
     *  @private
     *  Creates a ButtonBarBase's AccessibilityImplementation object.
     *  This method is called from UIComponent's
     *  initializeAccessibility() method.
     */
    mx_internal static function createAccessibilityImplementation(
                                component:UIComponent):void
    {
        component.accessibilityImplementation =
            new ButtonBarBaseAccImpl(component);
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param master The UIComponent instance that this AccImpl instance
     *  is making accessible.
     *
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function ButtonBarBaseAccImpl(master:UIComponent)
    {
        super(master);
        role = AccConst.ROLE_SYSTEM_TOOLBAR;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods: AccessibilityImplementation
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Gets the role for the component.
     *
     *  @param childID children of the component
     */
    override public function get_accRole(childID:uint):uint
    {
        return childID == 0 ? role : AccConst.ROLE_SYSTEM_PUSHBUTTON;
    }

    /**
     *  @private
     *  IAccessible method for returning the state of the ButtonBar Button.
     *  States are predefined for all the components in MSAA.
     *  Values are assigned to each state.
     *  Depending upon the ButtonBar Button being Selected, Selectable, pressed
     *  a value is returned.
     *
     *  @param childID uint
     *
     *  @return State uint
     */
    override public function get_accState(childID:uint):uint
    {
        var accState:uint = getState(childID);

        if (childID > 0)
        {
            var index:int = childID - 1;
            if (ListBase(master).isItemIndexSelected(index))
                accState |= AccConst.STATE_SYSTEM_PRESSED;
            if (index == ListBase(master).caretIndex)
                accState |= AccConst.STATE_SYSTEM_FOCUSED;
        }
        return accState;
    }

    /**
     *  @private
     *  IAccessible method for returning the Default Action.
     *
     *  @param childID uint
     *
     *  @return DefaultAction String
     */
    override public function get_accDefaultAction(childID:uint):String
    {
        if (childID == 0)
            return null;

        return "Press";
    }
    
    //--------------------------------------------------------------------------
    //
    //  Event handlers
    //
    //--------------------------------------------------------------------------
    
    /**
	 *  @private
	 */
	override protected function eventHandler(event:Event):void
    {
        // Let AccImpl class handle the events
        // that all accessible UIComponents understand.
        $eventHandler(event);
        
        switch (event.type)
        {
            case "change":
            {
                var pressed:int = ButtonBarBase(master).selectedIndex;
                
                Accessibility.sendEvent(master, pressed + 1,
                    AccConst.EVENT_OBJECT_STATECHANGE, true);
                break;
            }
            default:
            {
                super.eventHandler(event);
                break;
            }
        }
    }

}

}
