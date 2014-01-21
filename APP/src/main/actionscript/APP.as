package {
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	import co.serendipi.spike.ane.PerformanceTester;
	import co.serendipi.spike.ane.SimpleObject;
	
	public class APP extends Sprite {

		public static const FILL_IN_SIZE:int = 100;
		
		public static const FILL_IN_ITER:int = 1000;
		public static const CREATE_ITER:int = 1000;
		public static const RETURN_ITER:int = 1000;
		public static const ARGUMT_ITER:int = 1000;
		
		private var _ane:PerformanceTester;
		private var _txt:TextField;
		private var _counter:int;

		public function APP() {
			super();
			_txt = getTextField();
			setupStage();
			addChild( _txt );
			_txt.text = "\n\n";

			_ane = new PerformanceTester();
			stage.addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		public function onEnterFrame( e:Event ):void {
			var str:String;

			if ( _counter == 0 ) {
				//warm up the connection
				for (var i:int; i < 10; i++ ) 
					_ane.call0Arguments();
				
			} else if ( _counter == 1 ) {
				str = callXArguments();
				trace( str );
				_ane.writeToLog( str );
				_txt.text += str;
				
			} else if ( _counter == 2 ) {
				str = callReturnXXX();
				trace( str )
				_ane.writeToLog( str );
				_txt.text += str;
				
			} else if ( _counter == 3 ) {
				str = callCreateXXX();
				trace( str );
				_ane.writeToLog( str );
				_txt.text += str;
				
			} else if ( _counter == 4 ) {
				str = callFillInXXX();
				trace( str );
				_ane.writeToLog( str );
				_txt.text += str;
				
			} else {
				stage.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
			}
			
			_counter++;
		}
		
		private function callFillInXXX( ):String {
			var i:int;
			var startT:int;
			var duration:int;
			var str:String = "callFillInXXX Iterations: "+ FILL_IN_ITER + " Objects per iteration: " + FILL_IN_SIZE + "\n";
			
			var vectBool:Vector.<Boolean> = new Vector.<Boolean>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectBool[i] = true;
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInBooleans( vectBool );
			duration = getTimer( ) - startT;
			str += "Booleans: " + duration + "ms\n";

			
			var vectUInt:Vector.<uint> = new Vector.<uint>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectUInt[i] = i as uint;
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInUInts( vectUInt );
			duration = getTimer( ) - startT;
			str += "UInts: " + duration + "ms\n";

			
			var vectInt:Vector.<int> = new Vector.<int>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectInt[i] = i as int;
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInInts( vectInt );
			duration = getTimer( ) - startT;
			str += "Ints: " + duration + "ms\n";

			
			var vectNum:Vector.<Number> = new Vector.<Number>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectNum[i] = i + 0.1;
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInDoubles( vectNum );
			duration = getTimer( ) - startT;
			str += "Doubles: " + duration + "ms\n";

			
			var vectStr:Vector.<String> = new Vector.<String>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectStr[i] = i + 0.1;
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInStrings( vectStr );
			duration = getTimer( ) - startT;
			str += "Strings: " + duration + "ms\n";


			var vectObj:Vector.<SimpleObject> = new Vector.<SimpleObject>;
			for (i = 0; i < FILL_IN_SIZE; i++ ) 
				vectObj[i] = new SimpleObject( i );
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < FILL_IN_ITER; i++)
				_ane.callFillInObjects( vectObj );
			duration = getTimer( ) - startT;
			str += "Objects: " + duration + "ms\n";

			return str + "----------------------------------------\n";
		}
		
		
		private function callCreateXXX( ):String {
			var i:int;
			var startT:int;
			var duration:int;
			var str:String = "callCreateXXX Iterations: "+ CREATE_ITER + "\n";

			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateBooleans( new Vector.<Boolean> );
			duration = getTimer( ) - startT;
			str += "Booleans: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateUInts( new Vector.<uint> );
			duration = getTimer( ) - startT;
			str += "UInts: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateInts( new Vector.<int> );
			duration = getTimer( ) - startT;
			str += "Ints: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateDoubles( new Vector.<Number> );
			duration = getTimer( ) - startT;
			str += "Doubles: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateStrings( new Vector.<String> );
			duration = getTimer( ) - startT;
			str += "Strings: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < CREATE_ITER; i++)
				_ane.callCreateObjects( new Vector.<SimpleObject> );
			duration = getTimer( ) - startT;
			str += "Objects: " + duration + "ms\n";

			return str + "----------------------------------------\n";
		}
		
		private function callReturnXXX( ):String {
			var i:int;
			var startT:int;
			var duration:int;
			var str:String = "callReturnXXX Iterations: " + RETURN_ITER + "\n";

			//callReturnXXXX
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnBoolean();
			duration = getTimer( ) - startT;
			str += "Boolean: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnUInt();
			duration = getTimer( ) - startT;
			str += "UInt: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnInt();
			duration = getTimer( ) - startT;
			str += "Int: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnDouble();
			duration = getTimer( ) - startT;
			str += "Double: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnString();
			duration = getTimer( ) - startT;
			str += "String: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnObject();
			duration = getTimer( ) - startT;
			str += "Object: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < RETURN_ITER; i++)
				_ane.callReturnVector()
			duration = getTimer( ) - startT;
			str += "Vector: " + duration + "ms\n";
			
			return str + "----------------------------------------\n";
		}
		
		private function callXArguments( ):String {
			var i:int;
			var startT:int;
			var duration:int;
			var str:String = "callXArguments Iterations: " + ARGUMT_ITER + "\n";
				
			//callXArguments
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call0Arguments();
			duration = getTimer( ) - startT;
			str += "0 Arguments: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call1Arguments( 1 );
			duration = getTimer( ) - startT;
			str += "1 Arguments: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call2Arguments( 1, 2 );
			duration = getTimer( ) - startT;
			str += "2 Arguments: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call3Arguments( 1, 2, 3 );
			duration = getTimer( ) - startT;
			str += "3 Arguments: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call4Arguments( 1, 2, 3, 4 );
			duration = getTimer( ) - startT;
			str += "4 Arguments: " + duration + "ms\n";
			
			System.gc();
			startT = getTimer();
			for (i = 0; i < ARGUMT_ITER; i++)
				_ane.call5Arguments( 1, 2, 3, 4, 5 );
			duration = getTimer( ) - startT;
			str += "5 Arguments: " + duration + "ms\n";
			
			return str + "----------------------------------------\n";
		}
		
		private function onStageResize( e:Event=null ):void {
			//trace( "Resize" );
			_txt.width = stage.fullScreenWidth;
			_txt.height = stage.fullScreenHeight;
		}
		
		private function setupStage( ):void {
			stage.addEventListener( Event.RESIZE, onStageResize );
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.color = 0x000000;
		}
		
		private function getTextField( ):TextField {
			var tf:TextField;
			var format:TextFormat = new TextFormat( );
			
			var dpi:Number = Capabilities.screenDPI;
			
			//trace( "dpi: " + dpi );
			if ( dpi < 170 )
				format.size = 12;
			else if ( dpi < 250 ) 
				format.size = 18;
			else if ( dpi < 330 )
				format.size = 26;
			else 
				format.size = 36;
			
			format.color = 0xFFFFFF;
			
			tf = new TextField( );
			tf.defaultTextFormat = format;
			tf.background = true;
			tf.backgroundColor = 0x000000;
			tf.text = "";
			//tf.wordWrap = true;
			
			return tf;
		}
	}
}