//#EditorFriendly
//#node23:posx=-706:posy=25:title=ParamFloat:title2=CubemapAlphaAdd:input0=1:input0type=float:
//#node22:posx=-603:posy=-15:title=Multiply:input0=1:input0type=float:input0linkindexnode=18:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=23:input1linkindexoutput=0:
//#node21:posx=-357:posy=110:title=ParamFloat:title2=ReflectContrast:input0=1:input0type=float:
//#node20:posx=-249:posy=-1:title=Power:input0=0:input0type=float:input0linkindexnode=13:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=21:input1linkindexoutput=0:
//#node19:posx=-401:posy=-6:title=Multiply:input0=1:input0type=float:input0linkindexnode=6:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=17:input1linkindexoutput=0:
//#node18:posx=-604:posy=-77:title=Vector.W:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=6:input0linkindexoutput=0:
//#node17:posx=-502:posy=19:title=Add:input0=0:input0type=float:input0linkindexnode=22:input0linkindexoutput=0:input1=1:input1type=float:
//#node16:posx=-932:posy=65:title=Texture:title2=BumpMap:input0=(0,0):input0type=Vector2:
//#node15:posx=-190:posy=-226:title=Texture:title2=MainTex:input0=(0,0):input0type=Vector2:
//#node14:posx=-374:posy=-166:title=Texture:title2=Spec:input0=(0,0):input0type=Vector2:
//#node13:posx=-307:posy=-81:title=Multiply:input0=1:input0type=float:input0linkindexnode=14:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=19:input1linkindexoutput=0:
//#node12:posx=-133:posy=9:title=Multiply:input0=1:input0type=float:input0linkindexnode=20:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=11:input1linkindexoutput=0:
//#node11:posx=-224:posy=110:title=ParamFloat:title2=ReflectionPower:input0=1:input0type=float:
//#node10:posx=-98:posy=125:title=ParamFloat:title2=Glossiness:input0=1:input0type=float:
//#node9:posx=-373:posy=-227:title=ParamFloat:title2=SpecPower:input0=1:input0type=float:
//#node8:posx=-190:posy=-151:title=Multiply:input0=0:input0type=float:input0linkindexnode=9:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=14:input1linkindexoutput=0:
//#node7:posx=-814:posy=68:title=UnpackNormal:input0=0:input0type=float:input0linkindexnode=16:input0linkindexoutput=0:
//#node6:posx=-604:posy=-134:title=CubeMap:title2=CubeMap1:input0=(0,0):input0type=Vector2:input0linkindexnode=5:input0linkindexoutput=0:
//#node5:posx=-734:posy=-43:title=Reflection:input0=0:input0type=float:input1=0:input1type=float:input1linkindexnode=7:input1linkindexoutput=0:
//#node4:posx=0:posy=0:title=Lighting:title2=On:
//#node3:posx=0:posy=0:title=DoubleSided:title2=Back:
//#node2:posx=0:posy=0:title=FallbackInfo:title2=Transparent/Cutout/VertexLit:input0=1:input0type=float:
//#node1:posx=0:posy=0:title=LODInfo:title2=LODInfo1:input0=600:input0type=float:
//#masterNode:posx=0:posy=0:title=Master Node:input0linkindexnode=15:input0linkindexoutput=0:input1linkindexnode=12:input1linkindexoutput=0:input2linkindexnode=8:input2linkindexoutput=0:input3linkindexnode=10:input3linkindexoutput=0:input5linkindexnode=7:input5linkindexoutput=0:
//#sm=3.0
//#blending=Normal
//#ShaderName
Shader "ShaderFusion/CubemapReflection" {
	Properties {
_Color ("Diffuse Color", Color) = (1.0, 1.0, 1.0, 1.0)
_SpecColor ("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
//#ShaderProperties
_MainTex ("MainTex", 2D) = "white" {}
_Spec ("Spec", 2D) = "white" {}
_BumpMap ("BumpMap", 2D) = "white" {}
_CubeMap1 ("CubeMap1", Cube) = "_Skybox" { TexGen CubeReflect }
_CubemapAlphaAdd ("CubemapAlphaAdd", Float) = 1
_ReflectContrast ("ReflectContrast", Float) = 1
_ReflectionPower ("ReflectionPower", Float) = 1
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
#pragma target 3.0
//#UnlitCGDefs
sampler2D _MainTex;
sampler2D _Spec;
sampler2D _BumpMap;
samplerCUBE _CubeMap1;
float _CubemapAlphaAdd;
float _ReflectContrast;
float _ReflectionPower;
float _SpecPower;
float _Glossiness;
float4 _Color;
		struct Input {
//#UVDefs
float2 sfuv1;
float3 worldRefl;
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
float4 node15 = tex2D(_MainTex,IN.sfuv1);
float4 node14 = tex2D(_Spec,IN.sfuv1);
float4 node16 = tex2D(_BumpMap,IN.sfuv1);
float4 node6 = texCUBE(_CubeMap1,WorldReflectionVector(IN, ((float4(float3(UnpackNormal((node16))),0)))));
//#FragBody
normal = (float4(float3(UnpackNormal((node16))),0));
gloss = (_Glossiness);
specular = ((_SpecPower) * (node14));
emissive = ((pow(((node14) * ((node6) * ((((node6).w) * (_CubemapAlphaAdd)) + 1))),(_ReflectContrast))) * (_ReflectionPower));
diffuse = (node15);
			
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
