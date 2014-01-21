package co.serendipi.spike.ane {
	
	
	public class PerformanceTester {
		
		public function PerformanceTester() {
		}
		
		public function writeToLog( str:String ):void {
			
		}
		
		public function call0Arguments( ):void {
		}
		
		public function call1Arguments( arg1:int ):void {
		}
		
		public function call2Arguments( arg1:int, arg2:int ):void { 
		}
		
		public function call3Arguments( arg1:int, arg2:int, arg3:int ):void { 
		}
		
		public function call4Arguments( arg1:int, arg2:int, arg3:int, arg4:int ):void { 
		}
		
		public function call5Arguments( arg1:int, arg2:int, arg3:int, arg4:int, arg5:int ):void {
		}
		
		public function callReturnBoolean( ):Boolean     { return true; }
		public function callReturnUInt( ):uint           { return 5 as uint; }
		public function callReturnInt( ):int             { return 6 as int; }
		public function callReturnDouble( ):Number       { return new Number( 7 ); } 
		public function callReturnString( ):String       { return new String( "" ); }
		public function callReturnVector( ):Vector.<*>   { return new Vector.<*>; }
		public function callReturnObject( ):SimpleObject { return new SimpleObject( 1 ); }
		
		public function callCreateBooleans( vect:Vector.<Boolean> ):void { 
			for (var i:int; i < vect.length; i++ )
				vect[i] = true;
		}
		
		public function callCreateUInts( vect:Vector.<uint> ):void {
			var num:uint = 0;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}
		
		public function callCreateInts( vect:Vector.<int> ):void {
			var num:int = 0;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}

		public function callCreateDoubles( vect:Vector.<Number> ):void {
			var num:Number = 0.1;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}
		
		public function callCreateStrings( vect:Vector.<String> ):void {
			for (var i:int; i < vect.length; i++ )
				vect[i] = "";
		}
		
		public function callCreateObjects( vect:Vector.<SimpleObject> ):void {
			for (var i:int; i < vect.length; i++ )
				vect[i] = new SimpleObject( i );
		}
		
		public function callFillInBooleans( vect:Vector.<Boolean> ):void { 
			for (var i:int; i < vect.length; i++ )
				vect[i] = true;
		}
		
		public function callFillInUInts( vect:Vector.<uint> ):void { 
			var num:uint = 0;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}

		public function callFillInInts( vect:Vector.<int> ):void { 
			var num:int = 0;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}

		public function callFillInDoubles( vect:Vector.<Number> ):void {
			var num:Number = 0.1;
			for (var i:int; i < vect.length; i++ )
				vect[i] = num++;
		}
		
		public function callFillInStrings( vect:Vector.<String> ):void { 
			for (var i:int; i < vect.length; i++ )
				vect[i] = "";
		}
		
		public function callFillInObjects( vect:Vector.<SimpleObject> ):void {
			for (var i:int; i < vect.length; i++ )
				vect[i].number = i;
		}

	}
}