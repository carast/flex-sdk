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
import flash.events.FocusEvent;
import flash.events.Event;

import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.NumericStepper;

use namespace mx_internal;


/**
 *  NumericStepperAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the NumericStepper class.
 *
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class NumericStepperAccImpl extends SpinnerAccImpl
{
    include "../core/Version.as";
    
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Enables accessibility in the Spinner class.
     *
     *  <p>This method is called by application startup code
     *  that is autogenerated by the MXML compiler.
     *  Afterwards, when instances of Spinner are initialized,
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
        NumericStepper.createAccessibilityImplementation = 
            createAccessibilityImplementation;
    }

    /**
     *  @private
     *  Creates a Spinner's AccessibilityImplementation object.
     *  This method is called from UIComponent's
     *  initializeAccessibility() method.
     */
    mx_internal static function createAccessibilityImplementation(
                                component:UIComponent):void
    {
        component.accessibilityImplementation =
            new NumericStepperAccImpl(component);
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
    public function NumericStepperAccImpl(master:UIComponent)
    {
        super(master);
        
        role = AccConst.ROLE_SYSTEM_TEXT;
        
        NumericStepper(master).textDisplay.addEventListener(Event.CHANGE,
            eventHandler);
        
        NumericStepper(master).textDisplay.addEventListener(
            FocusEvent.FOCUS_IN, focusInHandler);
    }
    
    /**
     *  @private
     *
     */
    private function focusInHandler(event:Event):void
    {
        Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_FOCUS);
    }
}

}
