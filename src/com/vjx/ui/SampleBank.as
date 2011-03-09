package com.vjx.ui
{
	public class SampleBank
	{
		import mx.core.DragSource;
		import mx.events.DragEvent;
		import mx.managers.CursorManager;
		import mx.managers.DragManager;
		import spark.components.BorderContainer;
		
		// Variable to store original border color.
		private var tempBgColor:uint;
		private var tempBorderColor:uint;
		
		// Flag to indicate that tempBorderColor has been set.
		private var backgroundColorSet:Boolean = false;
		
		public function SampleBank()
		{		
		}
		
		public function SelectSample(sample:Number):void 
		{
			trace("Sample " + sample + " selected");
		}
		
		public function dragOverHandler(event:DragEvent):void {
			
			// Explpicitly handle the dragOver event.            
			event.preventDefault();
			
			var dropTarget:BorderContainer=event.currentTarget as BorderContainer; 	
			DragManager.acceptDragDrop(dropTarget);
			
			// Since you are explicitly handling the dragOver event,
			// call showDropIndicator() to have the drop target
			// display the drop indicator.
			// The drop indicator is removed
			// automatically for the list controls by the built-in 
			// event handler for the dragDrop event.
			
			// Set the border to green to indicate that 
			// this is a drop target.
			// Since the dragOver event is dispatched continuosly 
			// as you move over the drop target, only set it once.
			if (backgroundColorSet == false) {                 
				tempBgColor = 
					event.currentTarget.getStyle('backgroundColor');
				tempBorderColor = 
					event.currentTarget.getStyle('borderColor');
				backgroundColorSet = true;
			}
			
			// Set the drag-feedback indicator based on the 
			// type of drag-and-drop operation.
			event.currentTarget.setStyle('backgroundColor', "#A8C6EE");
			event.currentTarget.setStyle('borderColor', "#538EDD");
			
			
			DragManager.showFeedback(DragManager.LINK);
			return;		
			
			// Drag not allowed.
			//DragManager.showFeedback(DragManager.NONE);                
		}
		
		public function dragDropHandler(event:DragEvent):void {
			trace(event.dragSource);
			dragExitHandler(event);
		}            
		
		// Restore the border color.
		public function dragExitHandler(event:DragEvent):void {
			event.currentTarget.setStyle('backgroundColor', tempBgColor);
			event.currentTarget.setStyle('borderColor', tempBorderColor);
			backgroundColorSet = true;
		}
	}
}