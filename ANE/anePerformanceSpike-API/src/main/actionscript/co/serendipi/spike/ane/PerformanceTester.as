package co.serendipi.spike.ane {
	
	import flash.external.ExtensionContext;
	
	public class PerformanceTester {

		public static const VECTOR_SIZE:int = 1000;
		private static const ARGUMENTS_REPETITIONS:int = 1000;

		private var _context:ExtensionContext;
		
		public function PerformanceTester() {
			_context = ExtensionContext.createExtensionContext( "co.serendipi.spike.ane", "" );
		}
		
		public function writeToLog( str:String ):void { _context.call( "writeToLog", str ); }
		public function call0Arguments( ):void { _context.call( "run0Arg" ); }
		public function call1Arguments( arg1:int ):void { _context.call( "run1Arg", arg1 ); }
		public function call2Arguments( arg1:int, arg2:int ):void { _context.call( "run2Arg", arg1, arg2 ); }
		public function call3Arguments( arg1:int, arg2:int, arg3:int ):void { _context.call( "run3Arg", arg1, arg2, arg3 ); }
		public function call4Arguments( arg1:int, arg2:int, arg3:int, arg4:int ):void { _context.call( "run4Arg", arg1, arg2, arg3, arg4 ); }
		public function call5Arguments( arg1:int, arg2:int, arg3:int, arg4:int, arg5:int ):void { _context.call( "run5Arg", arg1, arg2, arg3, arg4, arg5 ); }
				
		public function callReturnBoolean( ):Boolean     { return _context.call( "returnBool" ) as Boolean; }
		public function callReturnUInt( ):uint           { return _context.call( "returnUInt" ) as uint; }
		public function callReturnInt( ):int             { return _context.call( "returnInt" ) as int; }
		public function callReturnDouble( ):Number       { return _context.call( "returnDouble" ) as Number; } 
		public function callReturnString( ):String       { return _context.call( "returnString" ) as String; }
		public function callReturnVector( ):Vector.<*>   { return _context.call( "returnVector" ) as Vector.<*>; }
		public function callReturnObject( ):SimpleObject { return _context.call( "returnObject" ) as SimpleObject; }

		public function callCreateBooleans( vect:Vector.<Boolean> ):void     { _context.call( "createBooleans", vect ); }
		public function callCreateUInts( vect:Vector.<uint> ):void           { _context.call( "createUInts", vect ); }
		public function callCreateInts( vect:Vector.<int> ):void             { _context.call( "createInts", vect ); }
		public function callCreateDoubles( vect:Vector.<Number> ):void       { _context.call( "createDoubles", vect ); }
		public function callCreateStrings( vect:Vector.<String> ):void       { _context.call( "createStrings", vect ); }
		public function callCreateObjects( vect:Vector.<SimpleObject> ):void { _context.call( "createObjects", vect ); }
		
		public function callFillInBooleans( vect:Vector.<Boolean> ):void     { _context.call( "fillInBooleans", vect ); }
		public function callFillInUInts( vect:Vector.<uint> ):void           { _context.call( "fillInUInts", vect ); }
		public function callFillInInts( vect:Vector.<int> ):void             { _context.call( "fillInInts", vect ); }
		public function callFillInDoubles( vect:Vector.<Number> ):void       { _context.call( "fillInDoubles", vect ); }
		public function callFillInStrings( vect:Vector.<String> ):void       { _context.call( "fillInStrings", vect ); }
		public function callFillInObjects( vect:Vector.<SimpleObject> ):void { _context.call( "fillInObjects", vect ); }
	}
}