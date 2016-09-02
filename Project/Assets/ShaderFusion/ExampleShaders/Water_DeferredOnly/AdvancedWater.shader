//#EditorFriendly
//#node74:posx=-992.5:posy=-135:title=Vector.XY:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=37:input0linkindexoutput=0:
//#node73:posx=-1058.5:posy=-197:title=ParamFloat:title2=DiffuseDistortion:input0=0.1:input0type=float:
//#node72:posx=-898.5:posy=-182:title=Multiply:input0=1:input0type=float:input0linkindexnode=73:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=74:input1linkindexoutput=0:
//#node71:posx=-788.5:posy=-181:title=Add:input0=0:input0type=float:input0linkindexnode=72:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=33:input1linkindexoutput=0:
//#node70:posx=-689.5:posy=-14:title=UnpackNormal:input0=0:input0type=float:input0linkindexnode=38:input0linkindexoutput=0:
//#node69:posx=-679.5:posy=-181:title=Texture:title2=MainTex:input0=(0,0):input0type=Vector2:input0linkindexnode=71:input0linkindexoutput=0:
//#node68:posx=-973.5:posy=-300:title=Texture:title2=BumpMap:input0=(0,0):input0type=Vector2:input0linkindexnode=8:input0linkindexoutput=0:
//#node67:posx=0:posy=0:title=Lighting:title2=On:
//#node66:posx=0:posy=0:title=DoubleSided:title2=Back:
//#node65:posx=0:posy=0:title=FallbackInfo:title2=ShaderFusion/SimpleWater:input0=1:input0type=float:
//#node64:posx=0:posy=0:title=LODInfo:title2=LODInfo1:input0=900:input0type=float:
//#node63:posx=-1136.5:posy=179.5:title=Fresnel:
//#node62:posx=-918.5:posy=180.5:title=Clamp:input0=(1,1,1,1):input0type=Vector4:input0linkindexnode=60:input0linkindexoutput=0:
//#node61:posx=-683.5:posy=166.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=21:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=62:input1linkindexoutput=0:
//#node60:posx=-1022.5:posy=179.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=63:input0linkindexoutput=0:input1=3:input1type=float:
//#node59:posx=-1587.5:posy=42.5:title=Assembler:input0=1:input0type=float:input0linkindexnode=57:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=58:input1linkindexoutput=0:input2=1:input2type=float:input3=1:input3type=float:
//#node58:posx=-1691.5:posy=95.5:title=Vector.W:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=54:input0linkindexoutput=0:
//#node57:posx=-1688.5:posy=36.5:title=Vector.Z:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=54:input0linkindexoutput=0:
//#node56:posx=-1386.5:posy=-69.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=6:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=55:input1linkindexoutput=0:
//#node55:posx=-1652.5:posy=-18.5:title=Vector.XY:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=54:input0linkindexoutput=0:
//#node54:posx=-1773.5:posy=-19.5:title=ParamVector:title2=UVScale:input0=(1,1,2,2):input0type=Vector4:
//#node53:posx=-1306.5:posy=-215.5:title=Assembler:input0=1:input0type=float:input0linkindexnode=51:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=52:input1linkindexoutput=0:input2=1:input2type=float:input3=1:input3type=float:
//#node52:posx=-1410.5:posy=-184.5:title=Vector.W:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=13:input0linkindexoutput=0:
//#node51:posx=-1397.5:posy=-241.5:title=Vector.Z:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=13:input0linkindexoutput=0:
//#node50:posx=-1359.5:posy=-310.5:title=Vector.XY:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=13:input0linkindexoutput=0:
//#node49:posx=-1218.5:posy=-130.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=53:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=7:input1linkindexoutput=0:
//#node48:posx=-1267.5:posy=85.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=11:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node47:posx=-290.5:posy=181.5:title=Vector.X:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=28:input0linkindexoutput=0:
//#node46:posx=-627.5:posy=-93.5:title=Vector.Z:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=45:input0linkindexoutput=0:
//#node45:posx=-711.5:posy=-108.5:title=ScreenPos:
//#node44:posx=-514.5:posy=-39.5:title=Divide:input0=1:input0type=float:input0linkindexnode=37:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=46:input1linkindexoutput=0:
//#node43:posx=-871.5:posy=92.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=41:input0linkindexoutput=0:input1=2:input1type=float:
//#node42:posx=-1068.5:posy=95.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=39:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node41:posx=-972.5:posy=94.5:title=Clamp:input0=(1,1,1,1):input0type=Vector4:input0linkindexnode=42:input0linkindexoutput=0:
//#node40:posx=-1267.5:posy=148.5:title=ParamFloat:title2=Falloff:input0=1:input0type=float:
//#node39:posx=-1169.5:posy=95.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=48:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=40:input1linkindexoutput=0:
//#node38:posx=-794.5:posy=-17.5:title=Add:input0=0:input0type=float:input0linkindexnode=37:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node37:posx=-988.5:posy=-64.5:title=Add:input0=0:input0type=float:input0linkindexnode=35:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=36:input1linkindexoutput=0:
//#node36:posx=-905.5:posy=22.5:title=Subtract:input0=0:input0type=float:input0linkindexnode=32:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node35:posx=-876.5:posy=-299.5:title=Subtract:input0=0:input0type=float:input0linkindexnode=68:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node34:posx=-1387.5:posy=-7.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=6:input0linkindexoutput=0:input1=0.5:input1type=float:input1linkindexnode=59:input1linkindexoutput=0:
//#node33:posx=-1134.5:posy=-58.5:title=Add:input0=0:input0type=float:input0linkindexnode=49:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=34:input1linkindexoutput=0:
//#node32:posx=-1022.5:posy=1.5:title=Texture:title2=NormalMap2:input0=(0,0):input0type=Vector2:input0linkindexnode=33:input0linkindexoutput=0:
//#node31:posx=-150.5:posy=97.5:title=ParamFloat:title2=Glossiness:input0=0.1:input0type=float:
//#node30:posx=-360.5:posy=266.5:title=ParamFloat:title2=SpecPower:input0=1:input0type=float:
//#node29:posx=-176.5:posy=170.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=47:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=30:input1linkindexoutput=0:
//#node28:posx=-384.5:posy=197.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=14:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=69:input1linkindexoutput=0:
//#node27:posx=-335.5:posy=-119.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=26:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=22:input1linkindexoutput=0:
//#node26:posx=-419.5:posy=-185.5:title=ParamColor:title2=DiffuseColor:input0=(1,1,1,1):input0type=Color:
//#node25:posx=-109.5:posy=13.5:title=Lerp:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=3:input0linkindexoutput=0:input1=(0,0,0,0):input1type=Vector4:input1linkindexnode=19:input1linkindexoutput=0:input2=0.5:input2type=float:input2linkindexnode=14:input2linkindexoutput=0:
//#node24:posx=-243.5:posy=-112.5:title=Clamp:input0=(1,1,1,1):input0type=Vector4:input0linkindexnode=27:input0linkindexoutput=0:
//#node23:posx=-516.5:posy=-166.5:title=Lerp:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=3:input0linkindexoutput=0:input1=(0,0,0,0):input1type=Vector4:input1linkindexnode=69:input1linkindexoutput=0:input2=0.5:input2type=float:input2linkindexnode=14:input2linkindexoutput=0:
//#node22:posx=-429.5:posy=-112.5:title=Add:input0=0:input0type=float:input0linkindexnode=23:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=43:input1linkindexoutput=0:
//#node21:posx=-781.5:posy=129.5:title=Subtract:input0=1:input0type=float:input1=0:input1type=float:input1linkindexnode=43:input1linkindexoutput=0:
//#node20:posx=-101.5:posy=-94.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=24:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=12:input1linkindexoutput=0:
//#node19:posx=-213.5:posy=-35.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=24:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=3:input1linkindexoutput=0:
//#node18:posx=-482.5:posy=120.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=43:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=9:input1linkindexoutput=0:
//#node17:posx=-378.5:posy=116.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=18:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=14:input1linkindexoutput=0:
//#node16:posx=-488.5:posy=51.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=15:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=14:input1linkindexoutput=0:
//#node15:posx=-595.5:posy=42.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=5:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=61:input1linkindexoutput=0:
//#node14:posx=-649.5:posy=261.5:title=Clamp:input0=(1,1,1,1):input0type=Vector4:input0linkindexnode=2:input0linkindexoutput=0:
//#node13:posx=-1511:posy=-269.5:title=ParamVector:title2=ScrollSpeed:input0=(0.1,0.1,0.1,0.1):input0type=Vector4:
//#node12:posx=-258:posy=99.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=3:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=17:input1linkindexoutput=0:
//#node11:posx=-1374:posy=84.5:title=Fresnel:
//#node10:posx=-1183:posy=-184.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=50:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=7:input1linkindexoutput=0:
//#node9:posx=-575:posy=182:title=ParamFloat:title2=LitValue:input0=0.25:input0type=float:
//#node8:posx=-1092:posy=-302:title=Add:input0=0:input0type=float:input0linkindexnode=10:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=56:input1linkindexoutput=0:
//#node7:posx=-1415:posy=-128:title=Time:
//#node6:posx=-1643:posy=-76:title=UV1:
//#node5:posx=-700:posy=45:title=ParamFloat:title2=Refraction:input0=1:input0type=float:
//#node4:posx=-399:posy=9:title=Multiply:input0=1:input0type=float:input0linkindexnode=44:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=16:input1linkindexoutput=0:
//#node3:posx=-305:posy=9:title=SceneColor:input0=(0,0):input0type=Vector2:input0linkindexnode=4:input0linkindexoutput=0:
//#node2:posx=-781:posy=262:title=DepthBlend:input0=0.5:input0type=float:input0linkindexnode=1:input0linkindexoutput=0:
//#node1:posx=-884:posy=270:title=ParamFloat:title2=FadeDist:input0=1:input0type=float:
//#masterNode:posx=0:posy=0:title=Master Node:input0linkindexnode=20:input0linkindexoutput=0:input1linkindexnode=25:input1linkindexoutput=0:input2linkindexnode=29:input2linkindexoutput=0:input3linkindexnode=31:input3linkindexoutput=0:input5linkindexnode=70:input5linkindexoutput=0:
//#sm=3.0
//#blending=Alpha
//#ShaderName
Shader "ShaderFusion/AdvancedWater" {
	Properties {
_Color ("Diffuse Color", Color) = (1.0, 1.0, 1.0, 1.0)
_SpecColor ("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
//#ShaderProperties
_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)
_ScrollSpeed ("ScrollSpeed", Vector) = (0.1,0.1,0.1,0.1)
_UVScale ("UVScale", Vector) = (1,1,2,2)
_BumpMap ("BumpMap", 2D) = "white" {}
_NormalMap2 ("NormalMap2", 2D) = "white" {}
_Refraction ("Refraction", Float) = 1
_Falloff ("Falloff", Float) = 1
_FadeDist ("FadeDist", Float) = 1
_DiffuseDistortion ("DiffuseDistortion", Float) = 0.1
_MainTex ("MainTex", 2D) = "white" {}
_LitValue ("LitValue", Float) = 0.25
_SpecPower ("SpecPower", Float) = 1
_Glossiness ("Glossiness", Float) = 0.1
	}
	Category {
		SubShader { 
//#Blend
ZWrite Off
Blend SrcAlpha OneMinusSrcAlpha
//#CatTags
Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
Lighting On
Cull Back
//#LOD
LOD 900
//#GrabPass
GrabPass { }
		CGPROGRAM
//#LightingModelTag
#pragma surface surf ShaderFusion vertex:vert exclude_path:prepass
 //use custom lighting functions
 
 //custom surface output structure
 struct SurfaceShaderFusion {
	half3 Albedo;
	half3 Normal;
	half3 Emission;
	half Specular;
	half3 GlossColor; //Gloss is now three-channel
	half Alpha;
 };
 //forward lighting function
 inline half4 LightingShaderFusion (SurfaceShaderFusion s, half3 lightDir, half3 viewDir, half atten) {
	#ifndef USING_DIRECTIONAL_LIGHT
	lightDir = normalize(lightDir);
	#endif
	viewDir = normalize(viewDir);
	half3 h = normalize (lightDir + viewDir);
	
	half diff = max (0, dot (s.Normal, lightDir));
	
	float nh = max (0, dot (s.Normal, h));
	float spec = pow (nh, s.Specular*128.0);
	
	half4 c;
	//Use gloss colour instead of gloss
	c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * s.GlossColor * spec) * (atten * 2);
	//We use gloss luminance to determine its overbright contribution
	c.a = s.Alpha + _LightColor0.a * Luminance(s.GlossColor) * spec * atten;
	return c;
 }
 //deferred lighting function
 inline half4 LightingShaderFusion_PrePass (SurfaceShaderFusion s, half4 light) {
	//Use gloss colour instead of gloss
	half3 spec = light.a * s.GlossColor;
	
	half4 c;
	c.rgb = (s.Albedo * light.rgb + light.rgb * spec.rgb);
	//We use gloss luminance to determine its overbright contribution
	c.a = s.Alpha + Luminance(spec);
	return c;
 }
//#TargetSM
#pragma target 3.0
//#UnlitCGDefs
float4 _DiffuseColor;
float4 _ScrollSpeed;
float4 _UVScale;
sampler2D _BumpMap;
sampler2D _NormalMap2;
float _Refraction;
float _Falloff;
float _FadeDist;
sampler2D _CameraDepthTexture;
sampler2D _GrabTexture;
float4 _GrabTexture_TexelSize;
float _DiffuseDistortion;
sampler2D _MainTex;
float _LitValue;
float _SpecPower;
float _Glossiness;
float4 _Color;
		struct Input {
//#UVDefs
float2 sfuv1;
float4 screenPos;
float3 viewDir;
		INTERNAL_DATA
		};
		
		void vert (inout appdata_full v, out Input o) {
//#DeferredVertexBody
o.sfuv1 = v.texcoord.xy;
//#DeferredVertexEnd
		}
		void surf (Input IN, inout SurfaceShaderFusion o) {
			float4 normal = float4(0.0,0.0,1.0,0.0);
			float3 emissive = 0.0;
			float3 specular = 1.0;
			float gloss = 1.0;
			float3 diffuse = 1.0;
			float alpha = 1.0;
//#PreFragBody
float4 node68 = tex2D(_BumpMap,((((_ScrollSpeed).xy) * (_Time)) + ((IN.sfuv1) * ((_UVScale).xy))));
float2 node53 = float2(((_ScrollSpeed).z),((_ScrollSpeed).w));
float2 node59 = float2(((_UVScale).z),((_UVScale).w));
float4 node32 = tex2D(_NormalMap2,(((node53) * (_Time)) + ((IN.sfuv1) * (node59))));
float node2 = ((LinearEyeDepth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(IN.screenPos)).r)-IN.screenPos.z)/(_FadeDist));
float4 __sceneColor_node3 = (tex2D(_GrabTexture,((IN.screenPos.xy/IN.screenPos.w)+(((((((node68) - 0.5) + ((node32) - 0.5)) / ((IN.screenPos).z)) * (((_Refraction) * ((1 - ((saturate(((((dot(normalize(IN.viewDir), float4(0.0,0.0,1.0,0.0))) * 0.5) * (_Falloff)) * 0.5))) * 2)) * (saturate(((dot(normalize(IN.viewDir), float4(0.0,0.0,1.0,0.0))) * 3))))) * (saturate((node2))))))*(IN.screenPos.z*_GrabTexture_TexelSize.xy)))));
float4 node69 = tex2D(_MainTex,(((_DiffuseDistortion) * ((((node68) - 0.5) + ((node32) - 0.5)).xy)) + (((node53) * (_Time)) + ((IN.sfuv1) * (node59)))));
//#FragBody
normal = (float4(float3(UnpackNormal(((((node68) - 0.5) + ((node32) - 0.5)) + 0.5))),0));
gloss = (_Glossiness);
specular = ((((saturate((node2))) * (node69)).x) * (_SpecPower));
emissive = (lerp((__sceneColor_node3),((saturate(((_DiffuseColor) * ((lerp((__sceneColor_node3),(node69),(saturate((node2))))) + ((saturate(((((dot(normalize(IN.viewDir), float4(0.0,0.0,1.0,0.0))) * 0.5) * (_Falloff)) * 0.5))) * 2))))) * (__sceneColor_node3)),(saturate((node2)))));
diffuse = ((saturate(((_DiffuseColor) * ((lerp((__sceneColor_node3),(node69),(saturate((node2))))) + ((saturate(((((dot(normalize(IN.viewDir), float4(0.0,0.0,1.0,0.0))) * 0.5) * (_Falloff)) * 0.5))) * 2))))) * ((__sceneColor_node3) * ((((saturate(((((dot(normalize(IN.viewDir), float4(0.0,0.0,1.0,0.0))) * 0.5) * (_Falloff)) * 0.5))) * 2) * (_LitValue)) * (saturate((node2))))));
			
			o.Albedo = diffuse.rgb*_Color;
			#ifdef SHADER_API_OPENGL
			o.Albedo = max(float3(0,0,0),o.Albedo);
			#endif
			
			o.Emission = emissive*_Color;
			#ifdef SHADER_API_OPENGL
			o.Emission = max(float3(0,0,0),o.Emission);
			#endif
			
			o.GlossColor = specular*_SpecColor;
			#ifdef SHADER_API_OPENGL
			o.GlossColor = max(float3(0,0,0),o.GlossColor);
			#endif
			
			o.Alpha = alpha*_Color.a;
			#ifdef SHADER_API_OPENGL
			o.Alpha = max(float3(0,0,0),o.Alpha);
			#endif
			
			o.Specular = gloss;
			#ifdef SHADER_API_OPENGL
			o.Specular = max(float3(0,0,0),o.Specular);
			#endif
			
			o.Normal = normal;
//#FragEnd
		}
		ENDCG
		}
	}
//#Fallback
Fallback "ShaderFusion/SimpleWater"
}
