package ;

import flixel.FlxSprite;
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxPoint;
import PlayState;
/**
 * ...
 * @author meishijie
 */
class Ball extends FlxExtendedSprite
{
	public var namex:Int = 1;
	public var namey:Int = 1;
	public var canClear:Bool = false;
	public var ballType:Int = 1;
	public var ArrayID:Int = 0;
	public var wasClear:Bool = false;
	public var pretrue:Bool = false;


	public function new(X:Float=0, Y:Float=0, thisBallType:Int = 1 ) 
	{
		super(X, Y );
		
		this.clickable = true;
		ballType = thisBallType;
		if(ballType == 1){
			loadGraphic(("assets/ball_1.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		if(ballType == 2){
			loadGraphic(("assets/ball_2.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		if(ballType == 3){
			loadGraphic(("assets/ball_3.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		if(ballType == 4){
			loadGraphic(("assets/ball_4.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		if(ballType == 5){
			loadGraphic(("assets/ball_5.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		if(ballType == 6){
			loadGraphic(("assets/ball_6.png"), false);
			//acceleration.y = 2000;
			maxVelocity.set(0, 2000);
			this.antialiasing = true;
		}
		
	}
	
	
}