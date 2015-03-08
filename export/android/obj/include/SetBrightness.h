#ifndef INCLUDED_SetBrightness
#define INCLUDED_SetBrightness

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(SetBrightness)


class HXCPP_CLASS_ATTRIBUTES  SetBrightness_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef SetBrightness_obj OBJ_;
		SetBrightness_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=false)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< SetBrightness_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SetBrightness_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("SetBrightness"); }

		static Float sm( Float b);
		static Dynamic sm_dyn();

		static Dynamic setbrightness_sm_jni;
		static Dynamic &setbrightness_sm_jni_dyn() { return setbrightness_sm_jni;}
};


#endif /* INCLUDED_SetBrightness */ 
