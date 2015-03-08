package ;

import flixel.FlxSprite;
import Ball;
/**
 * ...
 * @author meishijie
 */
class CheckBalls extends FlxSprite
{
	

	public function new(X:Float=0, Y:Float=0 ) 
	{
		super(X, Y );
		
		
	}
	public function checkClear(checkBall:Ball){

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
		while(nextX <= 3){
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
		while(nextY <= 3){
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
	
}