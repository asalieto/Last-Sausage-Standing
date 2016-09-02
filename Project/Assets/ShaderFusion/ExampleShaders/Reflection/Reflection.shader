//#EditorFriendly
//#node23:posx=-469.5:posy=41.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=20:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=22:input1linkindexoutput=0:
//#node22:posx=-615.5:posy=38.5:title=ParamFloat:title2=ReflectionDistortion:input0=1:input0type=float:
//#node21:posx=-611.5:posy=176.5:title=ScreenTexelSize:title2=ScreenTexelSize1:
//#node20:posx=-450.5:posy=108.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=21:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=18:input1linkindexoutput=0:
//#node19:posx=-164.5:posy=-77.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=12:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=8:input1linkindexoutput=0:
//#node18:posx=-439.5:posy=168.5:title=Vector.XY:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=16:input0linkindexoutput=0:
//#node17:posx=-477.5:posy=-36.5:title=Add:input0=0:input0type=float:input0linkindexnode=5:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=23:input1linkindexoutput=0:
//#node16:posx=-390.5:posy=250.5:title=UnpackNormal:input0=0:input0type=float:input0linkindexnode=15:input0linkindexoutput=0:
//#node15:posx=-531.5:posy=250.5:title=Texture:title2=Bumpmap:input0=(0,0):input0type=Vector2:
//#node14:posx=-378.5:posy=-124.5:title=ParamFloat:title2=ReflectPower:input0=1:input0type=float:
//#node13:posx=-302.5:posy=106.5:title=ParamFloat:title2=Glossiness:input0=1:input0type=float:
//#node12:posx=-275:posy=-77:title=Multiply:input0=1:input0type=float:input0linkindexnode=14:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=6:input1linkindexoutput=0:
//#node11:posx=-184:posy=48:title=Multiply:input0=1:input0type=float:input0linkindexnode=8:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=13:input1linkindexoutput=0:
//#node10:posx=-185:posy=-6:title=Multiply:input0=1:input0type=float:input0linkindexnode=8:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=9:input1linkindexoutput=0:
//#node9:posx=-302:posy=51:title=ParamFloat:title2=SpecPower:input0=1:input0type=float:
//#node8:posx=-302:posy=-3:title=Texture:title2=Spec:input0=(0,0):input0type=Vector2:
//#node7:posx=-135:posy=-159:title=Texture:title2=MainTex:input0=(0,0):input0type=Vector2:
//#node6:posx=-375:posy=-58:title=GlobalTexture:title2=ReflectionTex:input0=(0,0):input0type=Vector2:input0linkindexnode=17:input0linkindexoutput=0:
//#node5:posx=-580:posy=-59:title=PlaneReflectUV:title2=PlaneReflection1:
//#node4:posx=0:posy=0:title=Lighting:title2=On:
//#node3:posx=0:posy=0:title=DoubleSided:title2=Back:
//#node2:posx=0:posy=0:title=FallbackInfo:title2=Transparent/Cutout/VertexLit:input0=1:input0type=float:
//#node1:posx=0:posy=0:title=LODInfo:title2=LODInfo1:input0=600:input0type=float:
//#masterNode:posx=0:posy=0:title=Master Node:input0linkindexnode=7:input0linkindexoutput=0:input1linkindexnode=19:input1linkindexoutput=0:input2linkindexnode=10:input2linkindexoutput=0:input3linkindexnode=11:input3linkindexoutput=0:input5linkindexnode=16:input5linkindexoutput=0:
//#sm=2.0
//#blending=Normal
//#ShaderName
Shader "ShaderFusion/Reflection" {
	Properties {
_Color ("Diffuse Color", Color) = (1.0, 1.0, 1.0, 1.0)
_SpecColor ("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
//#ShaderProperties
_MainTex ("MainTex", 2D) = "white" {}
_ReflectPower ("ReflectPower", Float) = 1
_Bumpmap ("Bumpmap", 2D) = "white" {}
_ReflectionDistortion ("ReflectionDistortion", Float) = 1
_Spec ("Spec", 2D) = "white" {}
_SpecPower ("SpecPower", Float) = 1
_Glossiness ("Glossiness", Float) = 1
	}
	Category {
		SubShader { 
//#Blend
ZWrite On
//#CatTags
Tags { "RenderType"="Opaque" }
Lighting On
Cull Back
//#LOD
LOD 600
//#GrabPass
		CGPROGRAM
//#LightingModelTag
#pragma surface surf ShaderFusion vertex:vert alphatest:_Cutoff
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
sampler2D _MainTex;
float _ReflectPower;
sampler2D _Bumpmap;
float _ReflectionDistortion;
sampler2D _ReflectionTex;
sampler2D _Spec;
float _SpecPower;
float _Glossiness;
float4 _Color;
		struct Input {
//#UVDefs
float2 sfuv1;
float4 planeReflectionUV;
		INTERNAL_DATA
		};
		
		void vert (inout appdata_full v, out Input o) {
//#DeferredVertexBody
o.sfuv1 = v.texcoord.xy;
o.planeReflectionUV = ComputeScreenPos(mul(UNITY_MATRIX_MVP, v.vertex));
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
float4 node7 = tex2D(_MainTex,IN.sfuv1);
float4 node15 = tex2D(_Bumpmap,IN.sfuv1);
float4 node6 = tex2D(_ReflectionTex,((IN.planeReflectionUV.xy/IN.planeReflectionUV.w) + (((float2(1.0/_ScreenParams.x,1.0/_ScreenParams.y)) * ((float4(float3(UnpackNormal((node15))),0)).xy)) * (_ReflectionDistortion))));
float4 node8 = tex2D(_Spec,IN.sfuv1);
//#FragBody
normal = (float4(float3(UnpackNormal((node15))),0));
gloss = ((node8) * (_Glossiness));
specular = ((node8) * (_SpecPower));
emissive = (((_ReflectPower) * (node6)) * (node8));
diffuse = (node7);
			
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
