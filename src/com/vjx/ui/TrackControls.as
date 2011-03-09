package com.vjx.ui
{
	public class TrackControls
	{
		public function TrackControls()
		{
		}
		
		public function TrackHSliderToolTip(val:String):String 
		{
			return "x" + String(val);
		}
		
		public function TrackVSliderToolTip(val:String):String 
		{
			var level:Array = val.split(".00", 1);
			return level[0];
		}
		
		public function SelectTrack(track:Number):void 
		{
			trace("Track " + track + " selected");
		}
	}
}