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
import flixel.input.FlxSwipe;
import flixel.util.FlxColor;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;
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
	var array_all_9:Array<Ball> = [] ;
	var array_all = new Array();
	var beClear = new Array();
	var canClear:Array<Ball>= [];
	var toClear:Array<Ball>=[];
	var b = false;
	var canCheck = true;
	var canTouch = false;
	var d1:FlxPoint = new FlxPoint(0,0);
	var d2:FlxPoint = new FlxPoint(0,0);
	var d3:FlxPoint = new FlxPoint(0,0);
	var _w = 9;
	var _h = 9;
	var arr_point = [];
	var tempBall:Array<Ball> = [];
	var tempPos1 =[];
	var tempPos2 =[];
	var temp2:Ball;
	var temp1:Ball;
	var _moveDir = 'no';

	override public function create():Void
	{
		

		super.create();
		
		
		//trace(SetBrightness.sm(1000.0));

		canCheck = true;//可以检测消除
		//array_all = [array_all_0,array_all_1,array_all_2,array_all_3];
		array_all = [array_all_0,array_all_1,array_all_2,array_all_3,array_all_4,array_all_5,array_all_6,array_all_7,array_all_8];
		beClear = [array_all_0,array_all_1,array_all_2,array_all_3,array_all_4,array_all_5,array_all_6,array_all_7,array_all_8];
		
		Balls_all = new FlxGroup();
		add(Balls_all);

		var btn1 = new FlxButton(200,400,"重新生成", refresh);
		//btn1.text = Std.string(SetBrightness.sm(1));
		btn1.text = "good";
		btn1.height = 200;
		add(btn1);
		/*
		var labelFont = Assets.getFont("assets/DroidSansFallback.ttf");
		var format = new TextFormat (labelFont.fontName, 50, 0x7A0026);
		var textField = new TextField ();
		
		textField.defaultTextFormat = format;
		textField.embedFonts = true;
		textField.selectable = false;
		
		textField.x = 50;
		textField.y = 50;
		textField.width = 500;
		
		textField.text = "Hello World 中文支持吗";
		FlxG.addChildBelowMouse(textField);
		
		
		var txt:FlxText = new FlxText( 100 , 200 , 200 , "中文支持吗" , 20 , true);
		txt.setFormat("assets/DroidSansFallback.ttf", 40, FlxColor.WHITE, "center");
		add(txt);
		*/

		for (i in 0..._h){
			
			//
			for(h in 0..._w){
				
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
		for (i in 0..._h){
			for(h in 0..._w){
				array_all[i][h].pretrue = false;
				array_all[i][h].wasClear = false;
				
			}
		}
		if(canCheck == true){
			canTouch = false;
			canCheck = false;
			//检测所有格子的可消除，设置属性为wasClear = true
			for (i in 0..._h){
				for(h in 0..._w){
					checkClear(array_all[i][h],canClear);
				}

			}
			//trace(canClear.length);
			if(canClear.length >0){
				//处理可消除的对象,并移动未被消除的对象
				checkBallWasClear();
			}else{
				canTouch = true;
			}
			
		}
		
	}


	private function checkClear(checkBall:Ball,beClear1:Array<Ball>){

		//往左检测
		var tempCount = 0;
		var prevX:Int = checkBall.namex - 1;//前面一个的x
		var xtrue = false;

		while(prevX>=0){
				
				if( array_all[checkBall.namey][prevX].ballType == checkBall.ballType ){
					
					tempCount ++;
						canClear.push(array_all[checkBall.namey][prevX]);
						array_all[checkBall.namey][prevX].wasClear = true;
					prevX --;
					
				}else{
					
					break;
				}
				
		}
		
		var tempCount_1 = 0 ;
		var nextX:Int = checkBall.namex + 1;//后面一个的x
		while(nextX <= _w-1){
			if( array_all[checkBall.namey][nextX].ballType == checkBall.ballType ){
					tempCount_1 ++;
						canClear.push(array_all[checkBall.namey][nextX]);
						array_all[checkBall.namey][nextX].wasClear = true;
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
		while(nextY <= _h-1){
			if( array_all[nextY][checkBall.namex].ballType == checkBall.ballType ){
					tempCount_1 ++;
						canClear.push(array_all[nextY][checkBall.namex]);
						array_all[nextY][checkBall.namex].wasClear = true;
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
			
				canClear.push(checkBall);
				checkBall.wasClear = true;
			
			
		}
		if(tempCount >=2 || tempCount_1>=2){
			
				checkBall.wasClear = true;
				canClear.push(checkBall);
			
			
		}
		//设置所有的需要消除的 pretrue 都为 true
		for(i in 0...canClear.length){
			canClear[i].pretrue = true;
		}

	}
	//
	private function checkBallWasClear(){
		//检测数组中 设置为可消除的有哪几个
		for (i in 0..._h){
			for(h in 0..._w){
				if(array_all[i][h].wasClear == true){

					
					array_all[i][h].acceleration.add(FlxRandom.intRanged(-500,500),500);
					array_all[i][h] = null;
					
				}
				
			}
			
		}
		//使被消除的格子上面的球往下移动
		var inflColCount = new Array();
		for (x in 0..._w){
			var removedSushiOfCol = 0;
			for(y in 0..._h){
				//array_all[3-y][x].wasClear == true || 
				if(array_all[_h-1-y][x] == null){
					removedSushiOfCol ++;
				}else{
					if(removedSushiOfCol > 0){
						
						var newLow = _h-1-y+removedSushiOfCol;
						//trace(newLow);
						
						FlxTween.tween(array_all[_h-1-y][x], { y:newLow*35 }, 0.3);
						array_all[newLow][x] = array_all[_h-1-y][x] ;
						array_all[_h-1-y][x]= null;
						
					}

				}
				
			}
			inflColCount[x] = removedSushiOfCol;
			//trace("x"+x+";"+removedSushiOfCol);
			
		}
		//检测每一列一共有几个空格
		for (x in 0...inflColCount.length){
					
					if(inflColCount[x] > 0){
						for(y in 0...inflColCount[x]){
							var mySpr_ball:Ball = new Ball(x*35,-y*35*(inflColCount[x]-1-y)-200,FlxRandom.intRanged(1,6));
							Balls_all.add(mySpr_ball);
							array_all[y][x]=null;
							array_all[y][x]=mySpr_ball;
							FlxTween.tween(array_all[y][x], { y:y*35 }, 1,{complete:canbeCheck});

							//mySpr_ball.y = 35*(y);
							//mySpr_ball.x = 35*(x);
							mySpr_ball.namex = x;
							mySpr_ball.namey = y;
							
						}
					}
		}
		for (i in 0..._h){
			for(h in 0..._w){
				array_all[i][h].pretrue = false;
				array_all[i][h].wasClear = false;
				array_all[i][h].namex = h;
				array_all[i][h].namey = i;
				
			}
		}

		inflColCount = [];
		canClear = [];

	}
	
	private function canbeCheck(tween:FlxTween):Void{
		//trace(canCheck);
		canTouch = true;
		canCheck = true;
	}
	private function refresh():Void{
		//trace("----");
		FlxG.resetState();

	}
	override public function update():Void 
    {
        
        super.update();
        GoToCheck();

        if(FlxG.mouse.justPressed && canTouch == true){
        	arr_point = [];
        	arr_point[0] = FlxG.mouse.x;
        	arr_point[1] = FlxG.mouse.y;
        	//trace(d3); 
        	canTouch = true;
        	//trace(canCheck);
				for (i in 0..._h){
					for(h in 0..._w){
						
						if(array_all[i][h].mouseOver){
							//trace(array_all[i][h]);//
							d1 = new FlxPoint(array_all[i][h].x,array_all[i][h].y);
							tempBall = [];
							tempBall.push(array_all[i][h]);
						}
						
					}
				}

		}
		if(FlxG.mouse.justReleased && canTouch == true){
				
				d2 = FlxG.mouse;
				//trace(d2);
				checkDir(d1,d2);
		}
    }
    private function checkDir(_d1:FlxPoint,_d2:FlxPoint){
    	//trace(_d1);
    	//trace(_d2);
    	//trace(arr_point[0]+":"+arr_point[1]);
    	if(_d2.x == arr_point[0] && _d2.y == arr_point[1] ){
    		_moveDir = 'no';
	    	//trace("no move");
    	}else{
    		
    		if(Math.abs(_d2.x - _d1.x) > Math.abs(_d2.y - _d1.y)){
    			if(_d2.x > _d1.x && tempBall[0].namex != _w-1){
    				_moveDir = 'right';
    				//trace("向右");
    				//设置移动后的ball的位置为其自身的坐标/35
			    	for (y in 0..._h){
						for(x in 0..._w){
							//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
							//trace();
							array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
							array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
							//trace(array_all[y][x].namex,array_all[y][x].namey);
						}
					}

    				temp2=searchBall(tempBall[0].namex+1,tempBall[0].namey);
    				temp1=searchBall(tempBall[0].namex,tempBall[0].namey);
    				tempPos1=[];
    				tempPos2=[];
    				tempPos1.push(temp1.namex);
    				tempPos1.push(temp1.namey);
    				tempPos1.push(temp1.ballType);
    				tempPos2.push(temp2.namex);
    				tempPos2.push(temp2.namey);
    				tempPos2.push(temp2.ballType);

    				//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex+1].ballType);
    				var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
					var tmp2 = array_all[tempBall[0].namey][tempBall[0].namex+1];
					temp1 = tmp1;
					temp2 = tmp2;
					array_all[tempBall[0].namey][tempBall[0].namex]= null;
					array_all[tempBall[0].namey][tempBall[0].namex+1]= null;
					array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
					array_all[tempBall[0].namey][tempBall[0].namex+1] = temp1;
					//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex+1].ballType);
    				
					//处理可消除的对象,并移动未被消除的对象

					FlxTween.tween(temp1, { x:(temp2.namex)*35 ,y:temp2.namey*35 },0.3);
					FlxTween.tween(temp2, { x:(temp1.namex)*35 ,y:temp1.namey*35 },0.3,{complete:canTouchCheck});

					//
    				
    				canTouch = false;
    			}else if(_d2.x < _d1.x && tempBall[0].namex != 0){
    				_moveDir = 'left';
    				//trace("向左");
    				//设置移动后的ball的位置为其自身的坐标/35
			    	for (y in 0..._h){
						for(x in 0..._w){
							//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
							//trace();
							array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
							array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
							//trace(array_all[y][x].namex,array_all[y][x].namey);
						}
					}

    				temp2=searchBall(tempBall[0].namex-1,tempBall[0].namey);
    				temp1=searchBall(tempBall[0].namex,tempBall[0].namey);
    				tempPos1=[];
    				tempPos2=[];
    				tempPos1.push(temp1.namex);
    				tempPos1.push(temp1.namey);
    				tempPos1.push(temp1.ballType);
    				tempPos2.push(temp2.namex);
    				tempPos2.push(temp2.namey);
    				tempPos2.push(temp2.ballType);

    				//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
					var tmp2 = array_all[tempBall[0].namey][tempBall[0].namex-1];
					temp1 = tmp1;
					temp2 = tmp2;
					array_all[tempBall[0].namey][tempBall[0].namex]= null;
					array_all[tempBall[0].namey][tempBall[0].namex-1]= null;
					array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
					array_all[tempBall[0].namey][tempBall[0].namex-1] = temp1;
					//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				
					//处理可消除的对象,并移动未被消除的对象

					FlxTween.tween(temp1, { x:(temp2.namex)*35 ,y:temp2.namey*35 },0.3);
					FlxTween.tween(temp2, { x:(temp1.namex)*35 ,y:temp1.namey*35 },0.3,{complete:canTouchCheck});

					//

    				canTouch = false;
    			}
	    		
	    	}else if(Math.abs(_d2.x - _d1.x) < Math.abs(_d2.y - _d1.y)){
	    		if(_d2.y > _d1.y){
	    			_moveDir = 'down';
    				//trace("向下");
    				//设置移动后的ball的位置为其自身的坐标/35
			    	for (y in 0..._h){
						for(x in 0..._w){
							//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
							//trace();
							array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
							array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
							//trace(array_all[y][x].namex,array_all[y][x].namey);
						}
					}

    				temp2=searchBall(tempBall[0].namex,tempBall[0].namey+1);
    				temp1=searchBall(tempBall[0].namex,tempBall[0].namey);
    				tempPos1=[];
    				tempPos2=[];
    				tempPos1.push(temp1.namex);
    				tempPos1.push(temp1.namey);
    				tempPos1.push(temp1.ballType);
    				tempPos2.push(temp2.namex);
    				tempPos2.push(temp2.namey);
    				tempPos2.push(temp2.ballType);

    				//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
					var tmp2 = array_all[tempBall[0].namey+1][tempBall[0].namex];
					temp1 = tmp1;
					temp2 = tmp2;
					array_all[tempBall[0].namey][tempBall[0].namex]= null;
					array_all[tempBall[0].namey+1][tempBall[0].namex]= null;
					array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
					array_all[tempBall[0].namey+1][tempBall[0].namex] = temp1;
					//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				
					//处理可消除的对象,并移动未被消除的对象

					FlxTween.tween(temp1, { x:(temp2.namex)*35 ,y:temp2.namey*35 },0.3);
					FlxTween.tween(temp2, { x:(temp1.namex)*35 ,y:temp1.namey*35 },0.3,{complete:canTouchCheck});

					//

    				canTouch = false;
    			}else{
    				_moveDir = 'up';
    				//trace("向上");
    				//设置移动后的ball的位置为其自身的坐标/35
			    	for (y in 0..._h){
						for(x in 0..._w){
							//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
							//trace();
							array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
							array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
							//trace(array_all[y][x].namex,array_all[y][x].namey);
						}
					}

    				temp2=searchBall(tempBall[0].namex,tempBall[0].namey-1);
    				temp1=searchBall(tempBall[0].namex,tempBall[0].namey);
    				tempPos1=[];
    				tempPos2=[];
    				tempPos1.push(temp1.namex);
    				tempPos1.push(temp1.namey);
    				tempPos1.push(temp1.ballType);
    				tempPos2.push(temp2.namex);
    				tempPos2.push(temp2.namey);
    				tempPos2.push(temp2.ballType);

    				//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
					var tmp2 = array_all[tempBall[0].namey-1][tempBall[0].namex];
					temp1 = tmp1;
					temp2 = tmp2;
					array_all[tempBall[0].namey][tempBall[0].namex]= null;
					array_all[tempBall[0].namey-1][tempBall[0].namex]= null;
					array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
					array_all[tempBall[0].namey-1][tempBall[0].namex] = temp1;
					//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
    				
					//处理可消除的对象,并移动未被消除的对象

					FlxTween.tween(temp1, { x:(temp2.namex)*35 ,y:temp2.namey*35 },0.3);
					FlxTween.tween(temp2, { x:(temp1.namex)*35 ,y:temp1.namey*35 },0.3,{complete:canTouchCheck});

					//

    				canTouch = false;
    			}
	    		
	    	}//

    	}
    	
    }
    private function searchBall(x:Int,y:Int):Ball{
    	var b:Ball = null;
    	for (i in 0..._h){
			for(h in 0..._w){
				array_all[i][h].namex = h;
				array_all[i][h].namey = i;
				if(array_all[i][h].namex == x && array_all[i][h].namey == y){

					b = array_all[i][h];
				}
			}
		}
		return b;

    }

    private function canTouchCheck(tween:FlxTween):Void{
    	//设置移动后的ball的位置为其自身的坐标/35
    	for (y in 0..._h){
			for(x in 0..._w){
				//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
				//trace();
				array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
				array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
				
			}
		}
		//球类型换一下位置

		beClear = array_all;

		canClear = [];
		for (y in 0..._h){
			for(x in 0..._w){
				checkClearOne(beClear[y][x]);
			}
		}

		if(canClear.length > 0){
			canTouch = true;
    		canCheck = true;
		}else{
			FlxTween.tween(temp1, { x:tempPos1[0]*35 ,y:tempPos1[1]*35 },0.3);
			FlxTween.tween(temp2, { x:tempPos2[0]*35 ,y:tempPos2[1]*35 },0.3,{complete:backToNormal});
			
		}
    	
    }
	

    private function backToNormal(tween:FlxTween){

    		//返回原来位置时，位置为-1(向左滑动时)
    		if(_moveDir == 'left'){
    			var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
				var tmp2 = array_all[tempBall[0].namey][tempBall[0].namex+1];
				temp1 = tmp1;
				temp2 = tmp2;
				array_all[tempBall[0].namey][tempBall[0].namex]= null;
				array_all[tempBall[0].namey][tempBall[0].namex+1]= null;
				array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
				array_all[tempBall[0].namey][tempBall[0].namex+1] = temp1;
    		}
    		if (_moveDir == 'right'){
    			//trace(_moveDir);
    			var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
				var tmp2 = array_all[tempBall[0].namey][tempBall[0].namex-1];
				temp1 = tmp1;
				temp2 = tmp2;
				array_all[tempBall[0].namey][tempBall[0].namex]= null;
				array_all[tempBall[0].namey][tempBall[0].namex-1]= null;
				array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
				array_all[tempBall[0].namey][tempBall[0].namex-1] = temp1;
    		}
    		if (_moveDir == 'up'){
    			var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
				var tmp2 = array_all[tempBall[0].namey+1][tempBall[0].namex];
				temp1 = tmp1;
				temp2 = tmp2;
				array_all[tempBall[0].namey][tempBall[0].namex]= null;
				array_all[tempBall[0].namey+1][tempBall[0].namex]= null;
				array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
				array_all[tempBall[0].namey+1][tempBall[0].namex] = temp1;
    		}
    		if (_moveDir == 'down'){
    			var tmp1 = array_all[tempBall[0].namey][tempBall[0].namex];
				var tmp2 = array_all[tempBall[0].namey-1][tempBall[0].namex];
				temp1 = tmp1;
				temp2 = tmp2;
				array_all[tempBall[0].namey][tempBall[0].namex]= null;
				array_all[tempBall[0].namey-1][tempBall[0].namex]= null;
				array_all[tempBall[0].namey][tempBall[0].namex] = temp2;
				array_all[tempBall[0].namey-1][tempBall[0].namex] = temp1;
    		}
			//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
			
			//trace(array_all[tempBall[0].namey][tempBall[0].namex].ballType,array_all[tempBall[0].namey][tempBall[0].namex-1].ballType);
			
    		//设置移动后的ball的位置为其自身的坐标/35
	    	for (y in 0..._h){
				for(x in 0..._w){
					//trace(array_all[y][x].namex,Std.int(array_all[y][x].x/35));
					//trace();
					array_all[y][x].namex = Std.int(array_all[y][x].x/35) ;
					array_all[y][x].namey = Std.int(array_all[y][x].y/35) ;
					//trace(array_all[y][x].namex,array_all[y][x].namey);
				}
			}
    		canTouch = true;
    }




    private function checkClearOne(checkBall:Ball){

		//往左检测
		
		var tempCount = 0;
		var prevX:Int = checkBall.namex - 1;//前面一个的x
		var xtrue = false;

		while(prevX>=0){
				
				if( beClear[checkBall.namey][prevX].ballType == checkBall.ballType ){
					
					tempCount ++;
						canClear.push(beClear[checkBall.namey][prevX]);
						beClear[checkBall.namey][prevX].wasClear = true;
					prevX --;
					
				}else{
					
					break;
				}
				
		}
		
		var tempCount_1 = 0 ;
		var nextX:Int = checkBall.namex + 1;//后面一个的x
		while(nextX <= _w-1){
			if( beClear[checkBall.namey][nextX].ballType == checkBall.ballType ){
					tempCount_1 ++;
						canClear.push(beClear[checkBall.namey][nextX]);
						beClear[checkBall.namey][nextX].wasClear = true;
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
				
				if( beClear[prevY][checkBall.namex].ballType == checkBall.ballType  )
				{
					
					tempCount ++;
					//trace(tempCount);
					//if(checkInCanClear(array_all[prevY][checkBall.namex]) == false ){
						canClear.push(beClear[prevY][checkBall.namex]);
						beClear[prevY][checkBall.namex].wasClear = true;	
					//}
					
					prevY --;
					
				}else{
					
					break;
				}
				
		}
		//
		var tempCount_1 = 0 ;
		var nextY:Int = checkBall.namey + 1;//后面一个的x
		while(nextY <= _h-1){
			if( beClear[nextY][checkBall.namex].ballType == checkBall.ballType ){
					tempCount_1 ++;
						canClear.push(beClear[nextY][checkBall.namex]);
						beClear[nextY][checkBall.namex].wasClear = true;
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
			
				canClear.push(checkBall);
				checkBall.wasClear = true;
			
			
		}
		if(tempCount >=2 || tempCount_1>=2){
			
				checkBall.wasClear = true;
				canClear.push(checkBall);
		}
		

	}
	//



}