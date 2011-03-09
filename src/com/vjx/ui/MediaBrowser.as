package com.vjx.ui
{
	public class MediaBrowser
	{
		import flash.filesystem.File;
		
		import mx.events.DragEvent;
		
		public var contentTypes:Array = new Array(".flv", ".mp4", ".jpg", ".png", ".gif");
		
		private var filePath:String;
		private var fileType:String;
		private var clip:Array
		
		public function MediaBrowser()
		{
		}
		
		public function onFileDragStart(event:DragEvent):void 
		{
			var file:File = event.currentTarget.selectedItem as File;
			
			if(!file.isDirectory)
			{ //if file.isFile,
					
				//check if file is a video or an image
				switch(file.extension.toLowerCase())
				{
					case "flv":
						fileType = "video";
						break;
					
					case "mp4":
						fileType = "video";
						break;
					
					case "jpg":
						fileType = "image";
						break;
					
					case "png":
						fileType = "image";
						break;
					
					case "gif":
						fileType = "image";
						break;
				}
				
				filePath = file.url;
				clip = new Array(filePath, fileType);
				trace(clip);
				event.dragSource.addData(file, "clip");
				
			} //END if
		}
		
		protected function getFileDetails():Array {
			var fileDetails:Array = new Array(this.filePath, this.fileType);
			return fileDetails;
		}
	}
}