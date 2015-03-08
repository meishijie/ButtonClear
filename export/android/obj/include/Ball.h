#ifndef INCLUDED_Ball
#define INCLUDED_Ball

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flixel/addons/display/FlxExtendedSprite.h>
HX_DECLARE_CLASS0(Ball)
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS3(flixel,addons,display,FlxExtendedSprite)
HX_DECLARE_CLASS2(flixel,interfaces,IFlxDestroyable)


class HXCPP_CLASS_ATTRIBUTES  Ball_obj : public ::flixel::addons::display::FlxExtendedSprite_obj{
	public:
		typedef ::flixel::addons::display::FlxExtendedSprite_obj super;
		typedef Ball_obj OBJ_;
		Ball_obj();
		Void __construct(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,hx::Null< int >  __o_thisBallType);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Ball_obj > __new(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,hx::Null< int >  __o_thisBallType);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Ball_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("Ball"); }

		int namex;
		int namey;
		bool canClear;
		int ballType;
		int ArrayID;
		bool wasClear;
		bool pretrue;
};


#endif /* INCLUDED_Ball */ 
