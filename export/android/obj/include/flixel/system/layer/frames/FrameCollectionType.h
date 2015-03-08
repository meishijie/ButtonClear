#ifndef INCLUDED_flixel_system_layer_frames_FrameCollectionType
#define INCLUDED_flixel_system_layer_frames_FrameCollectionType

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS4(flixel,system,layer,frames,FrameCollectionType)
namespace flixel{
namespace system{
namespace layer{
namespace frames{


class FrameCollectionType_obj : public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef FrameCollectionType_obj OBJ_;

	public:
		FrameCollectionType_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("flixel.system.layer.frames.FrameCollectionType"); }
		::String __ToString() const { return HX_CSTRING("FrameCollectionType.") + tag; }

		static ::flixel::system::layer::frames::FrameCollectionType ATLAS;
		static inline ::flixel::system::layer::frames::FrameCollectionType ATLAS_dyn() { return ATLAS; }
		static ::flixel::system::layer::frames::FrameCollectionType FONT;
		static inline ::flixel::system::layer::frames::FrameCollectionType FONT_dyn() { return FONT; }
		static ::flixel::system::layer::frames::FrameCollectionType SINGLE;
		static inline ::flixel::system::layer::frames::FrameCollectionType SINGLE_dyn() { return SINGLE; }
		static ::flixel::system::layer::frames::FrameCollectionType SPRITESHEET;
		static inline ::flixel::system::layer::frames::FrameCollectionType SPRITESHEET_dyn() { return SPRITESHEET; }
};

} // end namespace flixel
} // end namespace system
} // end namespace layer
} // end namespace frames

#endif /* INCLUDED_flixel_system_layer_frames_FrameCollectionType */ 
