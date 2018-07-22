#include "common.h"

struct OUTStruct
{
	half4 Position	: COLOR0;
	half4 Normal	: COLOR1;
};

OUTStruct main()
{
	OUTStruct OUT;
	
	OUT.Position	= half4(0.f, 0.f, 10000.f, 0.f);
	OUT.Normal 		= half4(0.f, 0.f, 0.f, 0.f);
	
	return OUT;
}
