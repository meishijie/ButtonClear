package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tweens.FlxTween;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil.*;
import flixel.util.FlxVelocity;
import flixel.util.FlxPoint;
import flixel.system.layer.frames.FrameCollectionType;
import flixel.system.FlxCollisionType;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import flixel.util.FlxArrayUtil;
/**
 * A FlxState which can be used for the actual gameplay.
 //千万记住在重新搜索时，设置 pretrue 为false
pretrue 是用来记住物体是否在上一次已经被设置为可消除，作用为在检测当前的物体时可以知道前一个物体或者后一个物体是否已经被检测过，并且是需要消除的，如果为true，则在设置wasClear时，不要设置为wasClear = false,以至于让上次需要消除的物体，被错误的取消消除。

 */
class PlayState extends FlxState
{
	var Balls_all:FlxGroup;
	var array_all_0:Array<Ball> = [] ;
	var array_all_1:Array<Ball> = [] ;
	var array_all_2:Array<Ball> = [] ;
	var array_all_3:Array<Ball> = [] ;
	var array_all_4:Array<Ball> = [] ;
	var array_all_5:Array<Ball> = [] ;
	var array_all_6:Array<Ball> = [] ;
	var array_all_7:Array<Ball> = [] ;
	var array_all_8:Array<Ball> = [] ;
	var array_all = new Array();
	var canClear:Array<Ball>= [];
	var toClear:Array<Ball>=[];
	var b = false;
	var canCheck = true;

	var widthCount = 4;
	var heightCount = 4;

	override public function create():Void
	{
		

		super.create();
		
		canCheck = true;//可以检测消除
		
		array_all = [array_all_0,array_all_1,array_all_2,array_all_3,array_all_4,array_all_5,array_all_6,array_all_7,array_all_8];
		//trace(array_all[0]);

		Balls_all = new FlxGroup();
		add(Balls_all);

		var btn1 = new FlxButton(0,0,"重新生成", refresh);
		btn1.text = "refresh";
		btn1.height = 200;
		add(btn1);

		var txt:FlxText = new FlxText( 100 , 400 , 200 , "中文aa" , 20 , false);
		add(txt);

		for (i in 0...9){
			
			//
			for(h in 0...9){
				
				var mySpr_ball:Ball = new Ball(0,0,FlxRandom.intRanged(1,6));
				Balls_all.add(mySpr_ball);
				array_all[i].push(mySpr_ball);
				
				mySpr_ball.y = 35*(i);
				mySpr_ball.x = 35*(h);
				mySpr_ball.namex = h;
				mySpr_ball.namey = i;

			}
		}
		
		var btn_oneCheck = new FlxButton(200,300,"检测",GoToCheck);
		add(btn_oneCheck);
		
		
	}
	
	function GoToCheck(){
		if(canCheck == true){
			//检测所有格子的可消除，设置属性为wasClear = true
			for (i in 0...9){
				for(h in 0...9){
					checkClear(array_all[i][h],canClear);
				}

			}
			//处理可消除的对象,并移动未被消除的对象
			checkBallWasClear();
		}
		
	}


	private function checkClear(checkBall:Ball,beClear:Array<Ball>){

		//往左检测
		var tempCount = 0;
		var prevX:Int = checkBall.namex - 1;//前面一个的x
		var xtrue = false;

		while(prevX>=0){//
				
				if( array_all[checkBall.namey][prevX].ballType == checkBall.ballType ){
					
					tempCount ++;
					//trace(tempCount);
					//if(checkInCanClear(array_all[checkBall.namey][prevX])  == false){
						canClear.push(array_all[checkBall.namey][prevX]);
						array_all[checkBall.namey][prevX].wasClear = true;

					//}
					
					prevX --;
					
				}else{
					
					break;
				}
				
		}
		
		var tempCount_1 = 0 ;
		var nextX:Int = checkBall.namex + 1;//后面一个的x
		while(nextX <= 8){
			if( array_all[checkBall.namey][nextX].ballType == checkBall.ballType ){
					tempCount_1 ++;
					//trace(tempCount);
					//if(checkInCanClear(array_all[checkBall.namey][nextX])  == false){
						canClear.push(array_all[checkBall.namey][nextX]);
						array_all[checkBall.namey][nextX].wasClear = true;
					//}
					
					nextX ++;
			}else{
				break;
			}
		}
		if(tempCount >=1 && tempCount_1 >= 1){
			canClear.push(checkBall);
			checkBall.wasClear = true;
			xtrue = true;
		}
		//if(tempCount ==1 && tempCount_1 >= 1 ){
			//if(checkInCanClear(checkBall)  == false){
		//		canClear.push(checkBall);
		//		checkBall.wasClear = true;
		//		xtrue = true;
			//}
			
		//}
		if(tempCount ==1 && tempCount_1 == 0 ){
			if(canClear[canClear.length -1].pretrue == false){
				canClear[canClear.length -1].wasClear = false;
				canClear.splice(canClear.length -1,1);
			}
			
		}
		if(tempCount ==0 && tempCount_1 == 1 ){
			if(canClear[canClear.length -1].pretrue == false){
				canClear[canClear.length -1].wasClear = false;
				
				canClear.splice(canClear.length -1,1);
			}

			
		}
		if(tempCount >=2 || tempCount_1 >= 2){
			//if(checkInCanClear(checkBall)  == false){
				canClear.push(checkBall);
				xtrue = true;
				checkBall.wasClear = true;
			//}
			
		}
		//////////y检测
		var tempCount = 0;
		var prevY:Int = checkBall.namey - 1;//前面一个的x

		while(prevY>=0){//
				
				if( array_all[prevY][checkBall.namex].ballType == checkBall.ballType  )
				{
					
					tempCount ++;
					//trace(tempCount);
					//if(checkInCanClear(array_all[prevY][checkBall.namex]) == false ){
						canClear.push(array_all[prevY][checkBall.namex]);
						array_all[prevY][checkBall.namex].wasClear = true;	
					//}
					
					prevY --;
					
				}else{
					
					break;
				}
				
		}
		//
		var tempCount_1 = 0 ;
		var nextY:Int = checkBall.namey + 1;//后面一个的x
		while(nextY <= 8){
			if( array_all[nextY][checkBall.namex].ballType == checkBall.ballType ){
					tempCount_1 ++;
					//trace(tempCount);
					//if(checkInCanClear(array_all[nextY][checkBall.namex]) == false){
						canClear.push(array_all[nextY][checkBall.namex]);
						array_all[nextY][checkBall.namex].wasClear = true;
					//}
					
					nextY ++;
			}else{
				break;
			}
		}
		
		if(tempCount ==1 && tempCount_1 == 0 ){
			
				if(canClear[canClear.length -1].pretrue == false){
					canClear[canClear.length-1].wasClear = false;
					canClear.splice(canClear.length -1,1);
				}
				
			
		}
		if(tempCount ==0 && tempCount_1 == 1 ){
				if(canClear[canClear.length -1].pretrue == false){			
					canClear[canClear.length-1].wasClear = false;	
					canClear.splice(canClear.length -1,1);
				}
		}
		if(tempCount >=1 && tempCount_1 >= 1 ){
			//if(checkInCanClear(checkBall) == false){
				canClear.push(checkBall);
				checkBall.wasClear = true;
			//}
			
		}
		if(tempCount >=2 || tempCount_1>=2){
			//if(checkInCanClear(checkBall) == false){
				checkBall.wasClear = true;
				canClear.push(checkBall);
			//}
			
		}
		//设置所有的需要消除的 pretrue 都为 true
		for(i in 0...canClear.length){
			canClear[i].pretrue = true;
		}

	}
	//
	private function checkBallWasClear(){
		//检测数组中 设置为可消除的有哪几个
		for (i in 0...9){
			for(h in 0...9){
				if(array_all[i][h].wasClear == true){
					array_all[i][h].velocity.y = 100;
					//array_all[i][h].acceleration.add(FlxRandom.intRanged(-500,500),500);
				}
				
			}
			
		}
		//使被消除的格子上面的球往下移动
		var inflColCount = new Array();
		for (x in 0...9){
			var removedSushiOfCol = 0;
			for(y in 0...9){
				if(array_all[8-y][x].wasClear == true || array_all[8-y][x] == null){
					removedSushiOfCol ++;
				}else{
					if(removedSushiOfCol > 0){
						
						var newLow = 8-y+removedSushiOfCol;
						trace(newLow);
						array_all[newLow][x] = array_all[8-y][x] ;
						
						trace(array_all[newLow][x]);
						//array_all[newLow][x].wasClear = false;
						//array_all[newLow][x].ballType = array_all[8-y][x].ballType;
						//array_all[newLow][x].namex = array_all[8-y][x].namex;
						//array_all[newLow][x].namey = array_all[8-y][x].namey;
						FlxTween.tween(array_all[8-y][x], { y:newLow*35 }, 0.3);
					}

				}
				
			}
			inflColCount[x] = removedSushiOfCol;
			//trace("x"+x+";"+removedSushiOfCol);
			
		}
		//检测每一列一共有几个空格
		
		
		inflColCount = [];
		
	}
	
	private function refresh():Void{
		trace("重新开始");
		FlxG.resetState();

	}
	
	
  	
	
}