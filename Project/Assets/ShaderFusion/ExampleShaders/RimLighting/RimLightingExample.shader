//#EditorFriendly
//#node31:posx=-401:posy=95:title=ParamColor:title2=FresnelColor:input0=(1,1,1,1):input0type=Color:
//#node30:posx=-290:posy=23:title=Multiply:input0=1:input0type=float:input0linkindexnode=17:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=31:input1linkindexoutput=0:
//#node29:posx=-910:posy=-13:title=Normalize:input0=0:input0type=float:input0linkindexnode=28:input0linkindexoutput=0:
//#node28:posx=-1002:posy=-32:title=ViewDir:
//#node27:posx=-791:posy=13:title=DotProduct:input0=0:input0type=float:input0linkindexnode=29:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=22:input1linkindexoutput=0:
//#node26:posx=-987:posy=232:title=Number:input0=0:input0type=float:
//#node25:posx=-997:posy=169:title=Number:input0=1:input0type=float:
//#node24:posx=-1018:posy=93:title=Vector.Y:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=21:input0linkindexoutput=0:
//#node23:posx=-1024:posy=36:title=Vector.X:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=21:input0linkindexoutput=0:
//#node22:posx=-904:posy=100:title=Assembler:input0=1:input0type=float:input0linkindexnode=23:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=24:input1linkindexoutput=0:input2=1:input2type=float:input2linkindexnode=25:input2linkindexoutput=0:input3=1:input3type=float:input3linkindexnode=26:input3linkindexoutput=0:
//#node21:posx=-1113:posy=113:title=Multiply:input0=1:input0type=float:input0linkindexnode=20:input0linkindexoutput=0:input1=2:input1type=float:
//#node20:posx=-1113:posy=167:title=Subtract:input0=0:input0type=float:input0linkindexnode=19:input0linkindexoutput=0:input1=0.5:input1type=float:
//#node19:posx=-1111:posy=226:title=Vector.XY:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=11:input0linkindexoutput=0:
//#node18:posx=-518:posy=77:title=ParamFloat:title2=FresnelBrightness:input0=1:input0type=float:
//#node17:posx=-413:posy=17:title=Multiply:input0=1:input0type=float:input0linkindexnode=15:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=18:input1linkindexoutput=0:
//#node16:posx=-644:posy=39:title=ParamFloat:title2=FresnelContrast:input0=1:input0type=float:
//#node15:posx=-531:posy=6:title=Power:input0=0:input0type=float:input0linkindexnode=13:input0linkindexoutput=0:input1=0:input1type=float:input1linkindexnode=16:input1linkindexoutput=0:
//#node14:posx=-192:posy=-4:title=Multiply:input0=1:input0type=float:input0linkindexnode=5:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=30:input1linkindexoutput=0:
//#node13:posx=-643:posy=-22:title=Subtract:input0=1:input0type=float:input1=0:input1type=float:input1linkindexnode=27:input1linkindexoutput=0:
//#node12:posx=-1158:posy=-89:title=Fresnel:
//#node11:posx=-582.5:posy=226.5:title=TexWithXform:title2=BumpMap:input0=(0,0):input0type=Vector2:
//#node10:posx=-165.5:posy=99.5:title=ParamFloat:title2=Glossiness:input0=1:input0type=float:
//#node9:posx=-413.5:posy=-98.5:title=ParamFloat:title2=SpecPower:input0=1:input0type=float:
//#node8:posx=-303.5:posy=-101.5:title=Multiply:input0=1:input0type=float:input0linkindexnode=7:input0linkindexoutput=0:input1=1:input1type=float:input1linkindexnode=9:input1linkindexoutput=0:
//#node7:posx=-302.5:posy=-161.5:title=Vector.W:input0=(0,0,0,0):input0type=Vector4:input0linkindexnode=5:input0linkindexoutput=0:
//#node6:posx=-179.5:posy=183.5:title=UnpackNormal:input0=0:input0type=float:input0linkindexnode=11:input0linkindexoutput=0:
//#node5:posx=-303.5:posy=-224.5:title=TexWithXform:title2=MainTex:input0=(0,0):input0type=Vector2:
//#node4:posx=0:posy=0:title=Lighting:title2=On:
//#node3:posx=0:posy=0:title=DoubleSided:title2=Back:
//#node2:posx=0:posy=0:title=FallbackInfo:title2=Transparent/Cutout/VertexLit:input0=1:input0type=float:
//#node1:posx=0:posy=0:title=LODInfo:title2=LODInfo1:input0=600:input0type=float:
//#masterNode:posx=0:posy=0:title=Master Node:input0linkindexnode=5:input0linkindexoutput=0:input1linkindexnode=14:input1linkindexoutput=0:input2linkindexnode=8:input2linkindexoutput=0:input3linkindexnode=10:input3linkindexoutput=0:input5linkindexnode=6:input5linkindexoutput=0:
//#sm=3.0
//#blending=Normal
//#ShaderName
Shader "ShaderFusion/RimLightingExample" {
	Properties {
_Color ("Diffuse Color", Color) = (1.0, 1.0, 1.0, 1.0)
_SpecColor ("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
//#ShaderProperties
_MainTex ("MainTex", 2D) = "white" {}
_BumpMap ("BumpMap", 2D) = "white" {}
_FresnelContrast ("FresnelContrast", Float) = 1
_FresnelBrightness ("FresnelBrightness", Float) = 1
_FresnelColor ("FresnelColor", Color) = (1,1,1,1)
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
inline fixed4 LightingShaderFusion (SurfaceShaderFusion s, fixed3 lightDir, half3 viewDir, fixed atten)
{
	half3 h = normalize (lightDir + viewDir);
	
	fixed diff = max (0, dot (s.Normal, lightDir));
	
	float nh = max (0, dot (s.Normal, h));
	float3 spec = pow (nh, s.Specular*128.0) * s.GlossColor;
	
	fixed4 c;
	c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * _SpecColor.rgb * spec) * (atten * 2);
	c.a = s.Alpha + _LightColor0.a * _SpecColor.a * spec * atten;
	return c;
}
inline fixed4 LightingShaderFusion_PrePass (SurfaceShaderFusion s, half4 light)
{
	fixed3 spec = light.a * s.GlossColor;
	
	fixed4 c;
	c.rgb = (s.Albedo * light.rgb + light.rgb * _SpecColor.rgb * spec);
	c.a = s.Alpha + spec * _SpecColor.a;
	return c;
}
inline half4 LightingShaderFusion_DirLightmap (SurfaceShaderFusion s, fixed4 color, fixed4 scale, half3 viewDir, bool surfFuncWritesNormal, out half3 specColor)
{
	UNITY_DIRBASIS
	half3 scalePerBasisVector;
	
	half3 lm = DirLightmapDiffuse (unity_DirBasis, color, scale, s.Normal, surfFuncWritesNormal, scalePerBasisVector);
	
	half3 lightDir = normalize (scalePerBasisVector.x * unity_DirBasis[0] + scalePerBasisVector.y * unity_DirBasis[1] + scalePerBasisVector.z * unity_DirBasis[2]);
	half3 h = normalize (lightDir + viewDir);
	float nh = max (0, dot (s.Normal, h));
	float spec = pow (nh, s.Specular * 128.0);
	
	// specColor used outside in the forward path, compiled out in prepass
	specColor = lm * _SpecColor.rgb * s.GlossColor * spec;
	
	// spec from the alpha component is used to calculate specular
	// in the Lighting*_Prepass function, it's not used in forward
	return half4(lm, spec);
}
//#TargetSM
#pragma target 3.0
//#UnlitCGDefs
sampler2D _MainTex;
sampler2D _BumpMap;
float _FresnelContrast;
float _FresnelBrightness;
float4 _FresnelColor;
float _SpecPower;
float _Glossiness;
float4 _Color;
		struct Input {
//#UVDefs
float2 uv_MainTex;
float3 viewDir;
float2 uv_BumpMap;
		INTERNAL_DATA
		};
		
		void vert (inout appdata_full v, out Input o) {
//#DeferredVertexBody
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
float4 node5 = tex2D(_MainTex,IN.uv_MainTex.xy);
float4 node11 = tex2D(_BumpMap,IN.uv_BumpMap.xy);
float4 node22 = float4((((((node11).xy) - 0.5) * 2).x),(((((node11).xy) - 0.5) * 2).y),(1),(0));
//#FragBody
normal = (float4(float3(UnpackNormal((node11))),0));
gloss = (_Glossiness);
specular = (((node5).w) * (_SpecPower));
emissive = ((node5) * (((pow((1 - (dot((normalize((IN.viewDir))),(node22)))),(_FresnelContrast))) * (_FresnelBrightness)) * (_FresnelColor)));
diffuse = (node5);
			
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
