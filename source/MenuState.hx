package;

import flixel.addons.display.FlxBackdrop;
import flixel.ui.FlxButton;
import openfl.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
//import flixel.util.FlxMisc;


import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import openfl.Assets;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display.Loader;
import flash.Lib;

/**
 * ...
 * @author David Bell
 */
class MenuState extends FlxState 
{
    
    
    
      
    
    override public function create():Void 
    {
        
        
        
        //
        
       /* var bytes = Assets.getBytes("assets/kiz10.swf");
 // trace("Bytes " + bytes.length);

  var loader:Loader = new Loader();
  loader.loadBytes(bytes);

  loader.contentLoaderInfo.addEventListener
    (Event.COMPLETE,
     function (_) {
       var mc:MovieClip = cast(loader.content, MovieClip);
       //trace("Frames: " + mc.totalFrames);
       mc.addFrameScript(mc.totalFrames-1,
                         function():Void {
                          // trace("Done.");
                           mc.stop();
                          FlxG.stage.removeChild(mc);
                          
                          FlxG.switchState(new MenuMain());
                         });
      FlxG.stage.addChild(mc);
     });

        
        //
        */
        startGame();
        super.create();
    }
    
    override public function update():Void 
    {
        
        super.update();
    }
    
    
    
    private function startGame():Void
    {
        FlxG.switchState(new PlayState());
    }
}