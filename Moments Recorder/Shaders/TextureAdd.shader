Shader "MomentsRecorder/TextureAdd"
{
Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_OverlayTex ("Overlay (RGBA)", 2D) = "white" {}
	}
	SubShader {
        ZTest Always 
        Cull Off 
        ZWrite Off
        Fog { Mode off }
            
		Pass {
			CGPROGRAM
                #pragma vertex vert_img
                #pragma fragment frag
                #include "UnityCG.cginc"
            
                uniform sampler2D _MainTex;
                uniform sampler2D _OverlayTex;
    
                fixed4 frag (v2f_img i) : COLOR {
                    float4  base = tex2D(_MainTex, i.uv);
                    float4  overlay = tex2D(_OverlayTex, i.uv);
                    return lerp(base, overlay, overlay[3]);
                }
			ENDCG
		}
	}
}