//#EditorFriendly
//#node19:posx=0:posy=0:title=Lighting:title2=On:
//#node18:posx=0:posy=0:title=DoubleSided:title2=Back:
//#node17:posx=0:posy=0:title=FallbackInfo:title2=Transparent/Cutout/VertexLit:input0=1:input0type=float:
//#node16:posx=0:posy=0:title=LODInfo:title2=LODInfo1:input0=500:input0type=float:
//#node15:posx=-252.5:posy=80.5:title=ParamFloat:title2=SpecPower:input0=1:input0type=float:
//#node14:posx=-134.5:posy=97.5:title=ParamFloat:title2=Glossiness:input0=1:input0type=float:
//#node13:posx=-917.5:posy=139.5:title=ParamFloat:title2=UVScale:input0=1:input0type=float:
//#node12:posx=-835.5:posy=46.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=9:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=13:input1linkindexoutput=0:
//#node11:posx=-607.5:posy=-0.5:title=NormalMap:input0=(0,0):input0type=Vector2:input0linkindexnode=10:input0linkindexoutput=0:
//#node10:posx=-721.5:posy=-0.5:title=Add:input0=0:input0type=float:input0linkindexnode=8:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=12:input1linkindexoutput=0:
//#node9:posx=-950.5:posy=79.5:title=UV1:
//#node8:posx=-835.5:posy=-32.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=6:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=7:input1linkindexoutput=0:
//#node7:posx=-953.5:posy=18.5:title=ParamVector:title2=ScrollSpeed:input0=(0.1,0.1,0,0):input0type=Vector4:
//#node6:posx=-953.5:posy=-68.5:title=Time:
//#node5:posx=-144.5:posy=-0.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=2:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node4:posx=-491.5:posy=60.5:title=ParamFloat:title2=Refraction:input0=1:input0type=float:
//#node3:posx=-363.5:posy=-0.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=1:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=4:input1linkindexoutput=0:
//#node2:posx=-251.5:posy=-0.5:title=SceneColor:input0=(0,0):input0type=Vector2:input0linkindexnode=3:input0linkindexoutput=0:
//#node1:posx=-490.5:posy=-0.5:title=Subtract:input0=0:input0type=float:input0linkindexnode=11:input0linkindexoutput=0:input1=0.5:input1type=float:
//#masterNode:posx=0:posy=0:title=Master Node:input0linkindexnode=5:input0linkindexoutput=0:input1linkindexnode=5:input1linkindexoutput=0:input2linkindexnode=15:input2linkindexoutput=0:input3linkindexnode=14:input3linkindexoutput=0:input5linkindexnode=11:input5linkindexoutput=0:
//#sm=2.0
//#blending=Alpha
//#ShaderName
Shader "ShaderFusion/SimpleWater" {
	Properties {
_Color ("Diffuse Color", Color) = (1.0, 1.0, 1.0, 1.0)
_SpecColor ("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
//#ShaderProperties
_ScrollSpeed ("ScrollSpeed", Vector) = (0.1,0.1,0,0)
_UVScale ("UVScale", Float) = 1
_BumpMap ("Normal Map", 2D) = "white" {}
_Refraction ("Refraction", Float) = 1
_SpecPower ("SpecPower", Float) = 1
_Glossiness ("Glossiness", Float) = 1
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
LOD 500
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
#pragma target 2.0
//#UnlitCGDefs
float4 _ScrollSpeed;
float _UVScale;
sampler2D _BumpMap;
float _Refraction;
sampler2D _GrabTexture;
float4 _GrabTexture_TexelSize;
float _SpecPower;
float _Glossiness;
float4 _Color;
		struct Input {
//#UVDefs
float2 sfuv1;
float2 uvCoords;
float4 screenPos;
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
float4 node11 = (float4(UnpackNormal(tex2D(_BumpMap,(((_Time) * (_ScrollSpeed)) + ((IN.sfuv1) * (_UVScale))))),0));
float4 __sceneColor_node2 = (tex2D(_GrabTexture,((IN.screenPos.xy/IN.screenPos.w)+(((((node11) - 0.5) * (_Refraction)))*(IN.screenPos.z*_GrabTexture_TexelSize.xy)))));
//#FragBody
normal = (node11);
gloss = (_Glossiness);
specular = (_SpecPower);
emissive = ((__sceneColor_node2) * 0.5);
diffuse = ((__sceneColor_node2) * 0.5);
			
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
Fallback "Transparent/Cutout/VertexLit"
}
