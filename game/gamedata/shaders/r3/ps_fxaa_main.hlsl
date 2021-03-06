#include "common.h"
#include "fxaa.h"

float4 main (p_screen I) : SV_Target
{
    FxaaTex tex = { smp_rtlinear, s_image };

	float4 img = FxaaPixelShader(
			I.tc0,									// FxaaFloat2 pos,
            FxaaFloat4(0.0f, 0.0f, 0.0f, 0.0f),		// FxaaFloat4 fxaaConsolePosPos,
            tex,									// FxaaTex tex,
            tex,									// FxaaTex fxaaConsole360TexExpBiasNegOne,
            tex,									// FxaaTex fxaaConsole360TexExpBiasNegTwo,
            screen_res.zw,							// FxaaFloat2 fxaaQualityRcpFrame,
            FxaaFloat4(0.0f, 0.0f, 0.0f, 0.0f),		// FxaaFloat4 fxaaConsoleRcpFrameOpt,
            FxaaFloat4(0.0f, 0.0f, 0.0f, 0.0f),		// FxaaFloat4 fxaaConsoleRcpFrameOpt2,
            FxaaFloat4(0.0f, 0.0f, 0.0f, 0.0f),		// FxaaFloat4 fxaaConsole360RcpFrameOpt2,
            0.35f,									// FxaaFloat fxaaQualitySubpix,
            0.125f,									// FxaaFloat fxaaQualityEdgeThreshold,
            0.0f,//0.0625f,							// FxaaFloat fxaaQualityEdgeThresholdMin,
            0.0f,									// FxaaFloat fxaaConsoleEdgeSharpness,
            0.0f,									// FxaaFloat fxaaConsoleEdgeThreshold,
            0.0f,									// FxaaFloat fxaaConsoleEdgeThresholdMin,
            FxaaFloat4(0.0f, 0.0f, 0.0f, 0.0f)		// FxaaFloat4 fxaaConsole360ConstDir,
            );
	
	img.w = 1.0f;
	
	return saturate(img);
}
