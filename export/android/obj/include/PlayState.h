#ifndef INCLUDED_PlayState
#define INCLUDED_PlayState

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flixel/FlxState.h>
HX_DECLARE_CLASS0(Ball)
HX_DECLARE_CLASS0(PlayState)
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS1(flixel,FlxState)
HX_DECLARE_CLASS3(flixel,addons,display,FlxExtendedSprite)
HX_DECLARE_CLASS2(flixel,group,FlxGroup)
HX_DECLARE_CLASS2(flixel,group,FlxTypedGroup)
HX_DECLARE_CLASS2(flixel,interfaces,IFlxDestroyable)
HX_DECLARE_CLASS2(flixel,interfaces,IFlxPooled)
HX_DECLARE_CLASS2(flixel,tweens,FlxTween)
HX_DECLARE_CLASS2(flixel,util,FlxPoint)


class HXCPP_CLASS_ATTRIBUTES  PlayState_obj : public ::flixel::FlxState_obj{
	public:
		typedef ::flixel::FlxState_obj super;
		typedef PlayState_obj OBJ_;
		PlayState_obj();
		Void __construct(Dynamic MaxSize);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< PlayState_obj > __new(Dynamic MaxSize);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~PlayState_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("PlayState"); }

		::flixel::group::FlxGroup Balls_all;
		Array< ::Dynamic > array_all_0;
		Array< ::Dynamic > array_all_1;
		Array< ::Dynamic > array_all_2;
		Array< ::Dynamic > array_all_3;
		Array< ::Dynamic > array_all_4;
		Array< ::Dynamic > array_all_5;
		Array< ::Dynamic > array_all_6;
		Array< ::Dynamic > array_all_7;
		Array< ::Dynamic > array_all_8;
		Array< ::Dynamic > array_all_9;
		Array< ::Dynamic > array_all;
		Array< ::Dynamic > beClear;
		Array< ::Dynamic > canClear;
		Array< ::Dynamic > toClear;
		bool b;
		bool canCheck;
		bool canTouch;
		::flixel::util::FlxPoint d1;
		::flixel::util::FlxPoint d2;
		::flixel::util::FlxPoint d3;
		int _w;
		int _h;
		Array< Float > arr_point;
		Array< ::Dynamic > tempBall;
		Array< int > tempPos1;
		Array< int > tempPos2;
		::Ball temp2;
		::Ball temp1;
		virtual Void create( );

		virtual Void GoToCheck( );
		Dynamic GoToCheck_dyn();

		virtual Void checkClear( ::Ball checkBall,Array< ::Dynamic > beClear1);
		Dynamic checkClear_dyn();

		virtual Void checkBallWasClear( );
		Dynamic checkBallWasClear_dyn();

		virtual Void canbeCheck( ::flixel::tweens::FlxTween tween);
		Dynamic canbeCheck_dyn();

		virtual Void refresh( );
		Dynamic refresh_dyn();

		virtual Void update( );

		virtual Void checkDir( ::flixel::util::FlxPoint _d1,::flixel::util::FlxPoint _d2);
		Dynamic checkDir_dyn();

		virtual ::Ball searchBall( int x,int y);
		Dynamic searchBall_dyn();

		virtual Void canTouchCheck( ::flixel::tweens::FlxTween tween);
		Dynamic canTouchCheck_dyn();

		virtual Void backToNormal( ::flixel::tweens::FlxTween tween);
		Dynamic backToNormal_dyn();

		virtual Void checkClearOne( ::Ball checkBall);
		Dynamic checkClearOne_dyn();

};


#endif /* INCLUDED_PlayState */ 
