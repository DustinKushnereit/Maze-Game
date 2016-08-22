package
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import fl.motion.MotionEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	public class Enemy extends MovieClip
	{
		private var _root:Object;
		
		public function Enemy()
		{
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function beginClass(event:Event)
		{
			_root = MovieClip(root);
			
		}
		
		private function eFrame(event:Event)
		{			
			if( _root.startGameBoolPlayerOne )
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedPlayerOne);
				stage.addEventListener(KeyboardEvent.KEY_UP, keyReleasedPlayerOne);
			}
			
			if( _root.startGameBoolPlayerTwo )
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedPlayerTwo);
				stage.addEventListener(KeyboardEvent.KEY_UP, keyReleasedPlayerTwo);
			}
			
			if( _root.moveCharOneBool )
				stage.addEventListener( Event.ENTER_FRAME, moveCharOne );
			
			if( _root.moveCharTwoBool )
				stage.addEventListener( Event.ENTER_FRAME, moveCharTwo );
			
			if( _root.startGameBoolPlayerOne == false )
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressedPlayerOne);
				stage.removeEventListener(KeyboardEvent.KEY_UP, keyReleasedPlayerOne);
			}
			
			if( _root.startGameBoolPlayerTwo == false )
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressedPlayerTwo);
				stage.removeEventListener(KeyboardEvent.KEY_UP, keyReleasedPlayerTwo);
			}
			
			if( _root.moveCharOneBool == false )
				stage.removeEventListener( Event.ENTER_FRAME, moveCharOne );
			
			if( _root.moveCharTwoBool == false )
				stage.removeEventListener( Event.ENTER_FRAME, moveCharTwo );
			
			//PlayerOne
			if( this.hitTestPoint( _root.playerOne.x, _root.playerOne.y + 10) && _root.blockBrokeLeft == true )
			{
				_root.blockBrokeLeft = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerOne.x - 35;
				_root.mazeGrid.y = _root.playerOne.y;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			if( this.hitTestPoint( _root.playerOne.x + 35, _root.playerOne.y + 10) && _root.blockBrokeRight == true )
			{
				_root.blockBrokeRight = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerOne.x + 35;
				_root.mazeGrid.y = _root.playerOne.y;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			if( this.hitTestPoint( _root.playerOne.x + 10, _root.playerOne.y) && _root.blockBrokeUp == true )
			{
				_root.blockBrokeUp = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerOne.x;
				_root.mazeGrid.y = _root.playerOne.y - 35;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
				_root.hittingUp = false;
			}
			
			if( this.hitTestPoint( _root.playerOne.x + 10, _root.playerOne.y + 35) && _root.blockBrokeDown == true )
			{
				_root.blockBrokeDown = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerOne.x;
				_root.mazeGrid.y = _root.playerOne.y + 35;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			//PlayerTwo
			if( this.hitTestPoint( _root.playerTwo.x, _root.playerTwo.y + 10) && _root.blockBrokeLeft == true )
			{
				_root.blockBrokeLeft = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerTwo.x - 35;
				_root.mazeGrid.y = _root.playerTwo.y;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			if( this.hitTestPoint( _root.playerTwo.x + 35, _root.playerTwo.y + 10) && _root.blockBrokeRight == true )
			{
				_root.blockBrokeRight = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerTwo.x + 35;
				_root.mazeGrid.y = _root.playerTwo.y;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			if( this.hitTestPoint( _root.playerTwo.x + 10, _root.playerTwo.y) && _root.blockBrokeUp == true )
			{
				_root.blockBrokeUp = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerTwo.x;
				_root.mazeGrid.y = _root.playerTwo.y - 35;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
				_root.hittingUp = false;
			}
			
			if( this.hitTestPoint( _root.playerTwo.x + 10, _root.playerTwo.y + 35) && _root.blockBrokeDown == true )
			{
				_root.blockBrokeDown = false;
				_root.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.mazeGrid = new Block();
				_root.mazeGrid.graphics.lineStyle(1, 0xFF0000);
				_root.mazeGrid.graphics.beginBitmapFill( new floorTileBitmap(), null, true, false);
				_root.mazeGrid.graphics.drawRect(0, 0, 35, 35);
				_root.mazeGrid.graphics.endFill();
				_root.mazeGrid.x = _root.playerTwo.x;
				_root.mazeGrid.y = _root.playerTwo.y + 35;
				_root.mazeGridHolder.addChild(_root.mazeGrid);
			}
			
			if(_root.killChildrenBool)
			{
				this.hitTestObject(_root.backGround)
				{
					_root.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, eFrame);
				}
			}
		}
		
		function keyPressedPlayerOne( event:KeyboardEvent )
		{
			if( _root.moveCharOneBool )
			{
				if( event.keyCode == Keyboard.RIGHT && _root.moved == false && _root.hittingRight == false ) 
				{
					_root.moved = true;
					movePlayerOneRight();
					_root.movedRight = true;
					_root.playerOneActions--;
				}
				
				if( event.keyCode == Keyboard.LEFT && _root.moved == false && _root.hittingLeft == false ) 
				{
					_root.moved = true;
					movePlayerOneLeft();
					_root.movedLeft = true;
					_root.playerOneActions--;
				}
				
				if( event.keyCode == Keyboard.UP && _root.moved == false && _root.hittingUp == false ) 
				{
					_root.moved = true;
					movePlayerOneUp();
					_root.movedUp = true;
					_root.playerOneActions--;
				}
				
				if( event.keyCode == Keyboard.DOWN && _root.moved == false && _root.hittingDown == false ) 
				{
					_root.moved = true;
					movePlayerOneDown();
					_root.movedDown = true;
					_root.playerOneActions--;
				}
			}
		}
		
		function keyPressedPlayerTwo( event:KeyboardEvent )
		{
			if( _root.moveCharTwoBool )
			{
				if( event.keyCode == Keyboard.RIGHT && _root.moved == false && _root.hittingRightPlayerTwo == false ) 
				{
					_root.moved = true;
					movePlayerTwoRight();
					_root.movedRight = true;
					_root.playerTwoActions--;
				}
				
				if( event.keyCode == Keyboard.LEFT && _root.moved == false && _root.hittingLeftPlayerTwo == false ) 
				{
					_root.moved = true;
					movePlayerTwoLeft();
					_root.movedLeft = true;
					_root.playerTwoActions--;
				}
				
				if( event.keyCode == Keyboard.UP && _root.moved == false && _root.hittingUpPlayerTwo == false ) 
				{
					_root.moved = true;
					movePlayerTwoUp();
					_root.movedUp = true;
					_root.playerTwoActions--;
				}
				
				if( event.keyCode == Keyboard.DOWN && _root.moved == false && _root.hittingDownPlayerTwo == false ) 
				{
					_root.moved = true;
					movePlayerTwoDown();
					_root.movedDown = true;
					_root.playerTwoActions--;
				}
			}
		}

		function movePlayerOneRight()
		{
			if( _root.playerOne.x >= 315 )
				_root.playerOne.x = 315;
			else
				_root.playerOne.x += 35;
		}

		function movePlayerOneLeft()
		{
			if( _root.playerOne.x <= 35 )
				_root.playerOne.x = 35;
			else
				_root.playerOne.x -= 35;
		}

		function movePlayerOneUp()
		{
			if( _root.playerOne.y <= 35 )
				_root.playerOne.y = 35;
			else
				_root.playerOne.y -= 35;
		}

		function movePlayerOneDown()
		{
			if( _root.playerOne.y >= 315 )
				_root.playerOne.y = 315;
			else
				_root.playerOne.y += 35;
		}
		
		//Player Two
		function movePlayerTwoRight()
		{
			if( _root.playerTwo.x >= 315 )
				_root.playerTwo.x = 315;
			else
				_root.playerTwo.x += 35;
		}

		function movePlayerTwoLeft()
		{
			if( _root.playerTwo.x <= 35 )
				_root.playerTwo.x = 35;
			else
				_root.playerTwo.x -= 35;
		}

		function movePlayerTwoUp()
		{
			if( _root.playerTwo.y <= 35 )
				_root.playerTwo.y = 35;
			else
				_root.playerTwo.y -= 35;
		}

		function movePlayerTwoDown()
		{
			if( _root.playerTwo.y >= 315 )
				_root.playerTwo.y = 315;
			else
				_root.playerTwo.y += 35;
		}

		function keyReleasedPlayerOne( event:KeyboardEvent )
		{
			if( event.keyCode == Keyboard.RIGHT ) 
			{
				_root.moved = false;
				_root.movedRight = false;
			}
			
			if( event.keyCode == Keyboard.LEFT ) 
			{
				_root.moved = false;
				_root.movedLeft = false;
			}
			
			if( event.keyCode == Keyboard.UP ) 
			{
				_root.moved = false;
				_root.movedUp = false;
			}
			
			if( event.keyCode == Keyboard.DOWN ) 
			{
				_root.moved = false;
				_root.movedDown = false;
			}
		}
		
		function moveCharOne( event:Event )
		{	
			if( this.hitTestPoint( _root.playerOne.x, _root.playerOne.y + 10 ) )
				_root.hittingLeft = true;
			else if( _root.movedRight || _root.movedDown || _root.movedUp )
				_root.hittingLeft = false;
			
			if( this.hitTestPoint( _root.playerOne.x + 35, _root.playerOne.y + 10) )
				_root.hittingRight = true;
			else if( _root.movedLeft || _root.movedDown || _root.movedUp )
				_root.hittingRight = false;
			
			if( this.hitTestPoint( _root.playerOne.x + 15, _root.playerOne.y ) )
				_root.hittingUp = true;
			else if( _root.movedRight || _root.movedDown || _root.movedLeft )
				_root.hittingUp = false;
			
			if( this.hitTestPoint( _root.playerOne.x + 10, _root.playerOne.y + 35 ) )
				_root.hittingDown = true;
			else if( _root.movedRight || _root.movedLeft || _root.movedUp )
				_root.hittingDown = false;
		}
		
		//Player Two
		function keyReleasedPlayerTwo( event:KeyboardEvent )
		{
			if( event.keyCode == Keyboard.RIGHT ) 
			{
				_root.moved = false;
				_root.movedRight = false;
			}
			
			if( event.keyCode == Keyboard.LEFT ) 
			{
				_root.moved = false;
				_root.movedLeft = false;
			}
			
			if( event.keyCode == Keyboard.UP ) 
			{
				_root.moved = false;
				_root.movedUp = false;
			}
			
			if( event.keyCode == Keyboard.DOWN ) 
			{
				_root.moved = false;
				_root.movedDown = false;
			}
		}
		
		function moveCharTwo( event:Event )
		{	
			if( this.hitTestPoint( _root.playerTwo.x, _root.playerTwo.y + 10 ) )
				_root.hittingLeftPlayerTwo = true;
			else if( _root.movedRight || _root.movedDown || _root.movedUp )
				_root.hittingLeftPlayerTwo = false;
			
			if( this.hitTestPoint( _root.playerTwo.x + 35, _root.playerTwo.y + 10) )
				_root.hittingRightPlayerTwo = true;
			else if( _root.movedLeft || _root.movedDown || _root.movedUp )
				_root.hittingRightPlayerTwo = false;
			
			if( this.hitTestPoint( _root.playerTwo.x + 15, _root.playerTwo.y ) )
				_root.hittingUpPlayerTwo = true;
			else if( _root.movedRight || _root.movedDown || _root.movedLeft )
				_root.hittingUpPlayerTwo = false;
			
			if( this.hitTestPoint( _root.playerTwo.x + 10, _root.playerTwo.y + 35 ) )
				_root.hittingDownPlayerTwo = true;
			else if( _root.movedRight || _root.movedLeft || _root.movedUp )
				_root.hittingDownPlayerTwo = false;
		}

		public function removeListeners()
		{
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		
	}
}