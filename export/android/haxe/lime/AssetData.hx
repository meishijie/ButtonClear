package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/ball_1.png", "assets/ball_1.png");
			type.set ("assets/ball_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/ball_2.png", "assets/ball_2.png");
			type.set ("assets/ball_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/ball_3.png", "assets/ball_3.png");
			type.set ("assets/ball_3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/ball_4.png", "assets/ball_4.png");
			type.set ("assets/ball_4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/ball_5.png", "assets/ball_5.png");
			type.set ("assets/ball_5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/ball_6.png", "assets/ball_6.png");
			type.set ("assets/ball_6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Border.png", "assets/Border.png");
			type.set ("assets/Border.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/DroidSansFallback.ttf", "assets/DroidSansFallback.ttf");
			type.set ("assets/DroidSansFallback.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/FloorTexture.png", "assets/FloorTexture.png");
			type.set ("assets/FloorTexture.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/l.ttf", "assets/l.ttf");
			type.set ("assets/l.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/Orb.png", "assets/Orb.png");
			type.set ("assets/Orb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/OrbShadow.png", "assets/OrbShadow.png");
			type.set ("assets/OrbShadow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/OtherOrb.png", "assets/OtherOrb.png");
			type.set ("assets/OtherOrb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/OtherOrbShadow.png", "assets/OtherOrbShadow.png");
			type.set ("assets/OtherOrbShadow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/WallLeft.png", "assets/WallLeft.png");
			type.set ("assets/WallLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/WallUp.png", "assets/WallUp.png");
			type.set ("assets/WallUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
