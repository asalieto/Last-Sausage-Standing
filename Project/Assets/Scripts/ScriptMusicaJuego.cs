using UnityEngine;
using System.Collections;

public class ScriptMusicaJuego : MonoBehaviour {

	public static ScriptMusicaJuego scriptMusicaJuego;
	
	void Awake () {
		if(scriptMusicaJuego == null){
			
			scriptMusicaJuego = this;
			DontDestroyOnLoad (gameObject);
			
		}else if(scriptMusicaJuego != this){
			Destroy(gameObject);
		}
	}	
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
	
	void autodestruir(){
		Destroy (this);
	}
}
