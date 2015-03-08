#ifndef INCLUDED_Bar
#define INCLUDED_Bar

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Bar)


class HXCPP_CLASS_ATTRIBUTES  Bar_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef Bar_obj OBJ_;
		Bar_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=false)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Bar_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Bar_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("Bar"); }

		static int sampleMethod( int inputValue);
		static Dynamic sampleMethod_dyn();

		static Dynamic bar_sample_method;
		static Dynamic &bar_sample_method_dyn() { return bar_sample_method;}
		static Dynamic bar_sample_method_jni;
		static Dynamic &bar_sample_method_jni_dyn() { return bar_sample_method_jni;}
};


#endif /* INCLUDED_Bar */ 
